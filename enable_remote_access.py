"""
Enable MySQL Remote Access - Allow connections from ALL hosts
WARNING: This reduces security! Only use in development/trusted environments.
"""

import os
from dotenv import load_dotenv
import pymysql

# Load environment variables
load_dotenv()

DB_SERVER = '127.0.0.1'  # Connect locally first
DB_PORT = int(os.getenv('DB_PORT', '3306'))
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')

print("="*60)
print("MySQL Remote Access Configuration")
print("="*60)
print("[WARNING] This will allow root access from ANY host!")
print("[WARNING] Only use in development/trusted networks!")
print("="*60)
print(f"\nConnecting to MySQL at {DB_SERVER}:{DB_PORT}...")

try:
    # Connect to MySQL
    conn = pymysql.connect(
        host=DB_SERVER,
        port=DB_PORT,
        user=DB_USER,
        password=DB_PASSWORD
    )
    print("[SUCCESS] Connected to MySQL server!")
    
    cursor = conn.cursor()
    
    # Check current root users
    print("\n[INFO] Current root users:")
    cursor.execute("SELECT User, Host FROM mysql.user WHERE User = 'root'")
    current_users = cursor.fetchall()
    for user, host in current_users:
        print(f"  - root@{host}")
    
    # Create root@'%' user (wildcard = all hosts)
    print("\n[ACTION] Creating root@'%' user (allows all hosts)...")
    try:
        cursor.execute(f"CREATE USER 'root'@'%' IDENTIFIED BY '{DB_PASSWORD}'")
        print("[SUCCESS] User 'root'@'%' created!")
    except pymysql.err.OperationalError as e:
        if e.args[0] == 1396:  # User already exists
            print("[INFO] User 'root'@'%' already exists, updating privileges...")
        else:
            raise
    
    # Grant all privileges
    print("[ACTION] Granting ALL PRIVILEGES to root@'%'...")
    cursor.execute("GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION")
    print("[SUCCESS] Privileges granted!")
    
    # Flush privileges
    print("[ACTION] Flushing privileges...")
    cursor.execute("FLUSH PRIVILEGES")
    print("[SUCCESS] Privileges flushed!")
    
    # Show updated user list
    print("\n[INFO] Updated root users:")
    cursor.execute("SELECT User, Host FROM mysql.user WHERE User = 'root'")
    updated_users = cursor.fetchall()
    for user, host in updated_users:
        marker = " <-- NEW: Allows ALL hosts!" if host == '%' else ""
        print(f"  - root@{host}{marker}")
    
    cursor.close()
    conn.close()
    
    print("\n" + "="*60)
    print("[SUCCESS] Remote access enabled successfully!")
    print("="*60)
    print("\nYou can now connect from ANY host using:")
    print(f"   - Username: root")
    print(f"   - Password: {DB_PASSWORD}")
    print(f"   - Host: <your-tailscale-ip> or <your-local-ip>")
    print(f"   - Port: {DB_PORT}")
    
    print("\n[SECURITY] Important Notes:")
    print("   [!] Root can now connect from anywhere!")
    print("   [!] Make sure Windows Firewall is enabled")
    print("   [!] Only use on trusted networks")
    print("   [!] Consider creating specific users for remote access instead")
    
    print("\n[TEST] To test remote connection:")
    print("   1. Update .env: DB_SERVER=100.68.93.15 (or your Tailscale IP)")
    print("   2. Run: python test_mysql_connection.py")
    
except Exception as e:
    print(f"\n[ERROR] {e}")
    print("\nTroubleshooting:")
    print("  1. Make sure MySQL is running")
    print("  2. Verify credentials in .env file")
    print("  3. Check you're connecting to 127.0.0.1")

