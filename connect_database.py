"""
SQL Database Connection Script
This script provides multiple methods to connect to SQL databases running on localhost.
Credentials are securely loaded from .env file.
"""

import os
from dotenv import load_dotenv
import pandas as pd
from sqlalchemy import create_engine
import pymysql

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

# Get database configuration from environment
DB_SERVER = os.getenv('DB_SERVER', 'localhost')
DB_PORT = os.getenv('DB_PORT', '3306')
DB_NAME = os.getenv('DB_NAME')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_CHARSET = os.getenv('DB_CHARSET', 'utf8mb4')


# Method 1: Using pyodbc (for SQL Server, Access, etc.)
def connect_sql_server():
    """Connect to SQL Server using pyodbc"""
    conn_string = (
        'DRIVER={ODBC Driver 17 for SQL Server};'
        'SERVER=localhost;'
        'DATABASE=your_database_name;'
        'UID=your_username;'
        'PWD=your_password'
    )
    
    try:
        conn = pyodbc.connect(conn_string)
        print("[SUCCESS] Successfully connected to SQL Server")
        return conn
    except Exception as e:
        print(f"[ERROR] Connection failed: {e}")
        return None


# Method 2: Using SQLAlchemy with pyodbc (recommended for pandas)
def connect_sql_server_sqlalchemy():
    """Connect to SQL Server using SQLAlchemy"""
    connection_string = (
        'mssql+pyodbc://username:password@localhost/database_name?'
        'driver=ODBC+Driver+17+for+SQL+Server'
    )
    
    try:
        engine = create_engine(connection_string)
        print("[SUCCESS] Successfully connected to SQL Server using SQLAlchemy")
        return engine
    except Exception as e:
        print(f"[ERROR] Connection failed: {e}")
        return None


# Method 3: Using pymysql (for MySQL) - RECOMMENDED FOR YOUR SETUP
def connect_mysql():
    """Connect to MySQL database using credentials from .env file"""
    try:
        conn = pymysql.connect(
            host=DB_SERVER,
            port=int(DB_PORT),
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME,
            charset=DB_CHARSET
        )
        print(f"[SUCCESS] Successfully connected to MySQL database: {DB_NAME}")
        return conn
    except Exception as e:
        print(f"[ERROR] MySQL Connection failed: {e}")
        return None


# Method 4: Using psycopg2 (for PostgreSQL)
def connect_postgresql():
    """Connect to PostgreSQL database"""
    try:
        conn = psycopg2.connect(
            host='localhost',
            database='your_database_name',
            user='your_username',
            password='your_password'
        )
        print("[SUCCESS] Successfully connected to PostgreSQL")
        return conn
    except Exception as e:
        print(f"[ERROR] Connection failed: {e}")
        return None


# Method 5: Using SQLAlchemy for MySQL - RECOMMENDED FOR PANDAS
def connect_mysql_sqlalchemy():
    """Connect to MySQL using SQLAlchemy with credentials from .env file"""
    connection_string = f'mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_SERVER}:{DB_PORT}/{DB_NAME}?charset={DB_CHARSET}'
    
    try:
        engine = create_engine(connection_string)
        # Test connection
        with engine.connect() as conn:
            pass
        print(f"[SUCCESS] Successfully connected to MySQL using SQLAlchemy: {DB_NAME}")
        return engine
    except Exception as e:
        print(f"[ERROR] SQLAlchemy Connection failed: {e}")
        return None


# Example: Execute a query and return results as pandas DataFrame
def execute_query(engine, query):
    """Execute a SQL query and return results as DataFrame"""
    try:
        df = pd.read_sql(query, engine)
        return df
    except Exception as e:
        print(f"[ERROR] Query execution failed: {e}")
        return None


def test_connection():
    """Test the database connection and display available tables"""
    print("="*60)
    print("Testing MySQL Connection...")
    print("="*60)
    print(f"Server: {DB_SERVER}:{DB_PORT}")
    print(f"Database: {DB_NAME}")
    print(f"User: {DB_USER}")
    print("="*60)
    
    # Test with pymysql
    print("\n[Test 1] Testing with pymysql...")
    conn = connect_mysql()
    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute("SHOW TABLES")
            tables = cursor.fetchall()
            print(f"\n[SUCCESS] Found {len(tables)} tables in {DB_NAME}:")
            for i, table in enumerate(tables[:10], 1):
                print(f"  {i}. {table[0]}")
            if len(tables) > 10:
                print(f"  ... and {len(tables) - 10} more tables")
            cursor.close()
            conn.close()
        except Exception as e:
            print(f"[ERROR] Error listing tables: {e}")
    
    # Test with SQLAlchemy
    print(f"\n[Test 2] Testing with SQLAlchemy + pandas...")
    engine = connect_mysql_sqlalchemy()
    if engine:
        try:
            # Query first table
            df = pd.read_sql("SHOW TABLES", engine)
            print(f"\n[SUCCESS] SQLAlchemy connection successful!")
            print(f"[SUCCESS] Can query data with pandas")
            
            # Try to get a sample record from first table
            if len(df) > 0:
                first_table = df.iloc[0, 0]
                sample_df = pd.read_sql(f"SELECT * FROM `{first_table}` LIMIT 3", engine)
                print(f"\n[SUCCESS] Sample data from '{first_table}' table:")
                print(sample_df)
            
            engine.dispose()
        except Exception as e:
            print(f"[ERROR] Error with SQLAlchemy test: {e}")
    
    print("\n" + "="*60)
    print("Connection test completed!")
    print("="*60)


if __name__ == "__main__":
    print("SQL Connection Script")
    print("="*60)
    print("Available databases in create_db.sql:")
    print("  - SchoolSchedulingDB")
    print("  - RecipeDB")
    print("  - AccountsPayableDB")
    print("  - EntertainmentAgencyDB")
    print("  - SalesOrdersDB")
    print("  - BowlingLeagueDB")
    print("="*60)
    print("\nCurrent configuration loaded from .env file\n")
    
    # Run connection test
    test_connection()

