"""
Simple MySQL Connection Tester
Tests basic connectivity to MySQL server before trying to connect to specific database
"""

import os
from dotenv import load_dotenv
import pymysql

# Load environment variables
load_dotenv()

DB_SERVER = os.getenv('DB_SERVER', 'localhost')
DB_PORT = int(os.getenv('DB_PORT', '3306'))
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_NAME = os.getenv('DB_NAME')

print("="*60)
print("MySQL Connection Tester")
print("="*60)
print(f"Server: {DB_SERVER}:{DB_PORT}")
print(f"User: {DB_USER}")
print(f"Password: {'*' * len(DB_PASSWORD) if DB_PASSWORD else 'Not set'}")
print(f"Target Database: {DB_NAME}")
print("="*60)

# Test 1: Connect to MySQL server without specifying database
print("\n[TEST 1] Connecting to MySQL server (no database)...")
try:
    conn = pymysql.connect(
        host=DB_SERVER,
        port=DB_PORT,
        user=DB_USER,
        password=DB_PASSWORD
    )
    print("[SUCCESS] Connected to MySQL server!")
    
    # List available databases
    cursor = conn.cursor()
    cursor.execute("SHOW DATABASES")
    databases = cursor.fetchall()
    
    print(f"\nAvailable databases ({len(databases)} found):")
    for db in databases:
        marker = " <-- TARGET" if db[0] == DB_NAME else ""
        print(f"  - {db[0]}{marker}")
    
    # Check if target database exists
    db_exists = any(db[0] == DB_NAME for db in databases)
    
    if db_exists:
        print(f"\n[SUCCESS] Target database '{DB_NAME}' exists!")
        
        # Test connecting to specific database
        print(f"\n[TEST 2] Connecting to specific database '{DB_NAME}'...")
        cursor.execute(f"USE {DB_NAME}")
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        print(f"[SUCCESS] Connected! Found {len(tables)} tables:")
        for i, table in enumerate(tables[:10], 1):
            print(f"  {i}. {table[0]}")
        if len(tables) > 10:
            print(f"  ... and {len(tables) - 10} more")
    else:
        print(f"\n[WARNING] Target database '{DB_NAME}' does NOT exist!")
        print("\nTo create it, run:")
        print(f"  mysql -u {DB_USER} -p < create_db.sql")
        print("\nOr from MySQL command line:")
        print(f"  SOURCE {os.path.abspath('create_db.sql')};")
    
    cursor.close()
    conn.close()
    
except pymysql.err.OperationalError as e:
    error_code = e.args[0]
    error_msg = e.args[1]
    
    print(f"[ERROR] Connection failed!")
    print(f"Error Code: {error_code}")
    print(f"Error Message: {error_msg}")
    
    if error_code == 1045:
        print("\n[HINT] Authentication failed. Possible reasons:")
        print("  1. Password is incorrect")
        print("  2. User 'root' doesn't have access from 'localhost'")
        print("  3. MySQL user doesn't exist")
        print("\nTry these commands in MySQL:")
        print(f"  ALTER USER '{DB_USER}'@'localhost' IDENTIFIED BY '{DB_PASSWORD}';")
        print(f"  FLUSH PRIVILEGES;")
        print("\nOr test with command line:")
        print(f"  mysql -u {DB_USER} -p")
    
    elif error_code == 2003:
        print("\n[HINT] Can't connect to MySQL server. Possible reasons:")
        print("  1. MySQL server is not running")
        print("  2. MySQL is running on a different port")
        print("  3. Firewall blocking the connection")
        print("\nCheck MySQL service status in Windows Services")
    
except Exception as e:
    print(f"[ERROR] Unexpected error: {e}")

print("\n" + "="*60)
print("Test completed!")
print("="*60)

