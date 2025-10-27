"""
Database Connection Utility Module

A reusable utility module for connecting to MySQL databases and executing queries.
This module can be imported and used in other scripts, notebooks, or applications.

Usage Examples:
    # Simple query
    from connect_database import get_connection, execute_query
    
    conn = get_connection()
    result = execute_query(conn, "SELECT * FROM table")
    
    # Using pandas
    from connect_database import get_engine, query_to_dataframe
    
    engine = get_engine()
    df = query_to_dataframe(engine, "SELECT * FROM table")
    
    # Connect to specific database
    from connect_database import get_connection
    
    conn = get_connection(database='recipedb')
"""

import os
from dotenv import load_dotenv
import pandas as pd
from sqlalchemy import create_engine
import pymysql
from typing import Optional, Any, Dict, List, Tuple

# Optional imports
try:
    import pyodbc
except ImportError:
    pyodbc = None

try:
    import psycopg2
except ImportError:
    psycopg2 = None

# Load environment variables from .env file
load_dotenv()

# Default database configuration from environment
DEFAULT_CONFIG = {
    'host': os.getenv('DB_SERVER', '127.0.0.1'),
    'port': int(os.getenv('DB_PORT', '3306')),
    'user': os.getenv('DB_USER', 'root'),
    'password': os.getenv('DB_PASSWORD', ''),
    'database': os.getenv('DB_NAME', 'schoolschedulingdb'),
    'charset': os.getenv('DB_CHARSET', 'utf8mb4')
}


# ==================== Core Connection Functions ====================

def get_connection(database: Optional[str] = None, 
                  host: Optional[str] = None,
                  port: Optional[int] = None,
                  user: Optional[str] = None,
                  password: Optional[str] = None,
                  charset: Optional[str] = None,
                  verbose: bool = False) -> Optional[pymysql.connections.Connection]:
    """
    Get a MySQL database connection using pymysql.
    
    Args:
        database: Database name (defaults to .env DB_NAME)
        host: Server host (defaults to .env DB_SERVER)
        port: Server port (defaults to .env DB_PORT)
        user: Username (defaults to .env DB_USER)
        password: Password (defaults to .env DB_PASSWORD)
        charset: Character set (defaults to .env DB_CHARSET)
        verbose: Print connection status messages
        
    Returns:
        pymysql.Connection object or None if connection fails
        
    Example:
        conn = get_connection()
        conn = get_connection(database='recipedb')
        conn = get_connection(database='recipedb', verbose=True)
    """
    config = {
        'host': host or DEFAULT_CONFIG['host'],
        'port': port or DEFAULT_CONFIG['port'],
        'user': user or DEFAULT_CONFIG['user'],
        'password': password or DEFAULT_CONFIG['password'],
        'database': database or DEFAULT_CONFIG['database'],
        'charset': charset or DEFAULT_CONFIG['charset']
    }
    
    try:
        conn = pymysql.connect(**config)
        if verbose:
            print(f"[SUCCESS] Connected to MySQL database: {config['database']}")
        return conn
    except Exception as e:
        if verbose:
            print(f"[ERROR] MySQL Connection failed: {e}")
        return None


def get_engine(database: Optional[str] = None,
              host: Optional[str] = None,
              port: Optional[int] = None,
              user: Optional[str] = None,
              password: Optional[str] = None,
              charset: Optional[str] = None,
              verbose: bool = False):
    """
    Get a SQLAlchemy engine for MySQL (recommended for pandas operations).
    
    Args:
        database: Database name (defaults to .env DB_NAME)
        host: Server host (defaults to .env DB_SERVER)
        port: Server port (defaults to .env DB_PORT)
        user: Username (defaults to .env DB_USER)
        password: Password (defaults to .env DB_PASSWORD)
        charset: Character set (defaults to .env DB_CHARSET)
        verbose: Print connection status messages
        
    Returns:
        SQLAlchemy Engine object or None if connection fails
        
    Example:
        engine = get_engine()
        engine = get_engine(database='recipedb')
        df = pd.read_sql("SELECT * FROM table", engine)
    """
    config = {
        'host': host or DEFAULT_CONFIG['host'],
        'port': port or DEFAULT_CONFIG['port'],
        'user': user or DEFAULT_CONFIG['user'],
        'password': password or DEFAULT_CONFIG['password'],
        'database': database or DEFAULT_CONFIG['database'],
        'charset': charset or DEFAULT_CONFIG['charset']
    }
    
    connection_string = (
        f"mysql+pymysql://{config['user']}:{config['password']}"
        f"@{config['host']}:{config['port']}/{config['database']}"
        f"?charset={config['charset']}"
    )
    
    try:
        engine = create_engine(connection_string)
        # Test connection
        with engine.connect() as conn:
            pass
        if verbose:
            print(f"[SUCCESS] SQLAlchemy engine created for: {config['database']}")
        return engine
    except Exception as e:
        if verbose:
            print(f"[ERROR] SQLAlchemy connection failed: {e}")
        return None


# ==================== Query Execution Functions ====================

def execute_query(conn, query: str, params: Optional[tuple] = None) -> List[tuple]:
    """
    Execute a SQL query and return results as list of tuples.
    
    Args:
        conn: pymysql Connection object
        query: SQL query string
        params: Optional tuple of parameters for parameterized queries
        
    Returns:
        List of tuples containing query results
        
    Example:
        conn = get_connection()
        results = execute_query(conn, "SELECT * FROM table WHERE id = %s", (1,))
        conn.close()
    """
    try:
        cursor = conn.cursor()
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
    except Exception as e:
        print(f"[ERROR] Query execution failed: {e}")
        return []


def execute_query_dict(conn, query: str, params: Optional[tuple] = None) -> List[Dict]:
    """
    Execute a SQL query and return results as list of dictionaries.
    
    Args:
        conn: pymysql Connection object
        query: SQL query string
        params: Optional tuple of parameters for parameterized queries
        
    Returns:
        List of dictionaries containing query results (column: value pairs)
        
    Example:
        conn = get_connection()
        results = execute_query_dict(conn, "SELECT * FROM table")
        for row in results:
            print(row['column_name'])
        conn.close()
    """
    try:
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
    except Exception as e:
        print(f"[ERROR] Query execution failed: {e}")
        return []


def execute_update(conn, query: str, params: Optional[tuple] = None) -> int:
    """
    Execute an INSERT, UPDATE, or DELETE query.
    
    Args:
        conn: pymysql Connection object
        query: SQL query string
        params: Optional tuple of parameters for parameterized queries
        
    Returns:
        Number of affected rows
        
    Example:
        conn = get_connection()
        rows = execute_update(conn, "UPDATE table SET col = %s WHERE id = %s", ('value', 1))
        conn.commit()
        conn.close()
    """
    try:
        cursor = conn.cursor()
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        affected_rows = cursor.rowcount
        cursor.close()
        return affected_rows
    except Exception as e:
        print(f"[ERROR] Update execution failed: {e}")
        return 0


def query_to_dataframe(engine, query: str, params: Optional[dict] = None) -> Optional[pd.DataFrame]:
    """
    Execute a SQL query and return results as pandas DataFrame.
    
    Args:
        engine: SQLAlchemy Engine object
        query: SQL query string
        params: Optional dictionary of parameters for parameterized queries
        
    Returns:
        pandas DataFrame containing query results or None if query fails
        
    Example:
        engine = get_engine(database='recipedb')
        df = query_to_dataframe(engine, "SELECT * FROM recipes WHERE RecipeID = %(id)s", {'id': 1})
        engine.dispose()
    """
    try:
        df = pd.read_sql(query, engine, params=params)
        return df
    except Exception as e:
        print(f"[ERROR] Query execution failed: {e}")
        return None


def dataframe_to_table(df: pd.DataFrame, 
                      table_name: str,
                      engine,
                      if_exists: str = 'append',
                      index: bool = False) -> bool:
    """
    Write a pandas DataFrame to a MySQL table.
    
    Args:
        df: pandas DataFrame to write
        table_name: Name of the target table
        engine: SQLAlchemy Engine object
        if_exists: How to behave if table exists ('fail', 'replace', 'append')
        index: Write DataFrame index as a column
        
    Returns:
        True if successful, False otherwise
        
    Example:
        engine = get_engine()
        df = pd.DataFrame({'col1': [1, 2], 'col2': ['a', 'b']})
        success = dataframe_to_table(df, 'my_table', engine, if_exists='replace')
        engine.dispose()
    """
    try:
        df.to_sql(table_name, engine, if_exists=if_exists, index=index)
        print(f"[SUCCESS] DataFrame written to table: {table_name}")
        return True
    except Exception as e:
        print(f"[ERROR] Failed to write DataFrame to table: {e}")
        return False


# ==================== Utility Functions ====================

def get_tables(conn) -> List[str]:
    """
    Get list of all tables in the current database.
    
    Args:
        conn: pymysql Connection object
        
    Returns:
        List of table names
        
    Example:
        conn = get_connection()
        tables = get_tables(conn)
        print(tables)
        conn.close()
    """
    try:
        cursor = conn.cursor()
        cursor.execute("SHOW TABLES")
        tables = [table[0] for table in cursor.fetchall()]
        cursor.close()
        return tables
    except Exception as e:
        print(f"[ERROR] Failed to get tables: {e}")
        return []


def get_databases(conn) -> List[str]:
    """
    Get list of all databases on the MySQL server.
    
    Args:
        conn: pymysql Connection object
        
    Returns:
        List of database names
        
    Example:
        conn = get_connection()
        databases = get_databases(conn)
        print(databases)
        conn.close()
    """
    try:
        cursor = conn.cursor()
        cursor.execute("SHOW DATABASES")
        databases = [db[0] for db in cursor.fetchall()]
        cursor.close()
        return databases
    except Exception as e:
        print(f"[ERROR] Failed to get databases: {e}")
        return []


def get_table_info(conn, table_name: str) -> List[tuple]:
    """
    Get column information for a specific table.
    
    Args:
        conn: pymysql Connection object
        table_name: Name of the table
        
    Returns:
        List of tuples containing column information
        
    Example:
        conn = get_connection()
        info = get_table_info(conn, 'recipes')
        for col in info:
            print(f"{col[0]} - {col[1]}")
        conn.close()
    """
    try:
        cursor = conn.cursor()
        cursor.execute(f"DESCRIBE `{table_name}`")
        info = cursor.fetchall()
        cursor.close()
        return info
    except Exception as e:
        print(f"[ERROR] Failed to get table info: {e}")
        return []


# ==================== Testing Functions ====================

def test_connection(database: Optional[str] = None):
    """
    Test database connection with both pymysql and SQLAlchemy.
    
    Args:
        database: Database name to test (defaults to .env DB_NAME)
        
    Example:
        test_connection()
        test_connection('recipedb')
    """
    db = database or DEFAULT_CONFIG['database']
    
    print("="*60)
    print("Testing MySQL Connection...")
    print("="*60)
    print(f"Server: {DEFAULT_CONFIG['host']}:{DEFAULT_CONFIG['port']}")
    print(f"Database: {db}")
    print(f"User: {DEFAULT_CONFIG['user']}")
    print("="*60)
    
    # Test with pymysql
    print("\n[Test 1] Testing with pymysql...")
    conn = get_connection(database=db, verbose=True)
    if conn:
        try:
            tables = get_tables(conn)
            print(f"\n[SUCCESS] Found {len(tables)} tables in {db}:")
            for i, table in enumerate(tables[:10], 1):
                print(f"  {i}. {table}")
            if len(tables) > 10:
                print(f"  ... and {len(tables) - 10} more tables")
            conn.close()
        except Exception as e:
            print(f"[ERROR] Error listing tables: {e}")
    
    # Test with SQLAlchemy
    print(f"\n[Test 2] Testing with SQLAlchemy + pandas...")
    engine = get_engine(database=db, verbose=True)
    if engine:
        try:
            # Query first table
            df = query_to_dataframe(engine, "SHOW TABLES")
            if df is not None:
                print(f"\n[SUCCESS] Can query data with pandas")
                
                # Try to get a sample record from first table
                if len(df) > 0:
                    first_table = df.iloc[0, 0]
                    sample_df = query_to_dataframe(engine, f"SELECT * FROM `{first_table}` LIMIT 3")
                    if sample_df is not None:
                        print(f"\n[SUCCESS] Sample data from '{first_table}' table:")
                        print(sample_df)
            
            engine.dispose()
        except Exception as e:
            print(f"[ERROR] Error with SQLAlchemy test: {e}")
    
    print("\n" + "="*60)
    print("Connection test completed!")
    print("="*60)


# ==================== Main Entry Point ====================

if __name__ == "__main__":
    print("Database Connection Utility Module")
    print("="*60)
    print("Available databases:")
    print("  - schoolschedulingdb")
    print("  - recipedb")
    print("  - accountspayabledb")
    print("  - entertainmentagencydb")
    print("  - salesordersdb")
    print("  - bowlingleaguedb")
    print("="*60)
    print("\nConfiguration loaded from .env file")
    print(f"Default database: {DEFAULT_CONFIG['database']}")
    print("="*60)
    print("\nUsage Examples:")
    print("  from connect_database import get_connection, execute_query")
    print("  conn = get_connection()")
    print("  results = execute_query(conn, 'SELECT * FROM table')")
    print("  conn.close()")
    print()
    print("  from connect_database import get_engine, query_to_dataframe")
    print("  engine = get_engine(database='recipedb')")
    print("  df = query_to_dataframe(engine, 'SELECT * FROM recipes')")
    print("  engine.dispose()")
    print("="*60)
    print("\nRunning connection test...\n")
    
    # Run connection test
    test_connection()

