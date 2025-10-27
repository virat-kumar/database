# Fix MySQL Connection Through Tailscale VPN

## Problem

**Error**: `Host 'desktop-machine.tailac2e85.ts.net.' is not allowed to connect to this MySQL server`

**Error Code**: 1130

## Root Cause

Your MySQL user (`root@localhost`) only allows connections from `localhost`, but you're connecting through Tailscale VPN, which uses the hostname `desktop-machine.tailac2e85.ts.net.`

## Solutions

### Option 1: Force Localhost Connection (Recommended for Security)

Update your `.env` file to use the IP address instead of hostname:

```env
DB_SERVER=127.0.0.1
DB_PORT=3306
```

This forces the connection to use localhost directly, bypassing Tailscale's hostname resolution.

### Option 2: Allow Tailscale Hostname

Create a MySQL user that accepts connections from your Tailscale hostname:

```sql
-- Connect to MySQL first
mysql -u root -p

-- Create user for Tailscale hostname
CREATE USER 'root'@'desktop-machine.tailac2e85.ts.net.' IDENTIFIED BY 'your_password_here';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'desktop-machine.tailac2e85.ts.net.';
FLUSH PRIVILEGES;
```

Or use a wildcard for all Tailscale hosts:

```sql
CREATE USER 'root'@'%.ts.net.' IDENTIFIED BY 'your_password_here';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%.ts.net.';
FLUSH PRIVILEGES;
```

### Option 3: Allow All Hosts (⚠️ NOT RECOMMENDED - Security Risk)

```sql
CREATE USER 'root'@'%' IDENTIFIED BY 'your_password_here';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;
```

**Warning**: This allows root access from ANY host! Only use in isolated development environments.

### Option 4: Create Specific Remote User (Best Practice)

Instead of exposing root, create a dedicated user for remote access:

```sql
-- Create remote user with limited privileges
CREATE USER 'remote_user'@'%.ts.net.' IDENTIFIED BY 'SecurePassword123';

-- Grant access only to specific database
GRANT SELECT, INSERT, UPDATE, DELETE ON schoolschedulingdb.* TO 'remote_user'@'%.ts.net.';

-- Or grant to all databases
GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%.ts.net.';

FLUSH PRIVILEGES;
```

Then update `.env`:
```env
DB_USER=remote_user
DB_PASSWORD=SecurePassword123
```

## Quick Fix Steps

### Step 1: Check Current Connection Method

```bash
# In PowerShell
ipconfig | Select-String "IPv4"
```

### Step 2: Update .env File

```env
# Change from:
DB_SERVER=localhost

# To:
DB_SERVER=127.0.0.1
```

### Step 3: Test Connection

```bash
python test_mysql_connection.py
```

## Understanding the Issue

When you use `localhost` in `.env`:
- Python tries to resolve "localhost"
- Tailscale intercepts and resolves to Tailscale hostname
- MySQL sees connection from `desktop-machine.tailac2e85.ts.net.`
- MySQL checks user table: `root@localhost` ≠ `root@desktop-machine.tailac2e85.ts.net.`
- Connection rejected!

When you use `127.0.0.1`:
- Python connects directly to loopback interface
- Bypasses DNS/hostname resolution
- MySQL sees connection from `localhost`
- Matches `root@localhost` ✅

## Check Current MySQL Users

Run this to see what users exist:

```bash
mysql -u root -p -e "SELECT User, Host FROM mysql.user;"
```

You'll likely see:
```
+------------------+-----------+
| User             | Host      |
+------------------+-----------+
| root             | localhost |
+------------------+-----------+
```

## Additional Debugging

### Check hostname resolution:
```bash
# See what 'localhost' resolves to
ping localhost
nslookup localhost
```

### Check MySQL binding:
```bash
# Verify MySQL is listening
netstat -an | Select-String "3306"
```

### Test with explicit IP:
```bash
mysql -h 127.0.0.1 -u root -p
```

## Recommended Solution

**For local development (same machine)**:

1. Update `.env`:
   ```env
   DB_SERVER=127.0.0.1
   ```

2. Test:
   ```bash
   python test_mysql_connection.py
   ```

**For remote access via Tailscale**:

1. Create dedicated remote user:
   ```sql
   CREATE USER 'tailscale_user'@'%.ts.net.' IDENTIFIED BY 'StrongPassword';
   GRANT ALL PRIVILEGES ON schoolschedulingdb.* TO 'tailscale_user'@'%.ts.net.';
   FLUSH PRIVILEGES;
   ```

2. Update `.env` for remote connections:
   ```env
   DB_SERVER=<tailscale-ip-of-mysql-server>
   DB_USER=tailscale_user
   DB_PASSWORD=StrongPassword
   ```

## Summary

| Issue | Solution | Security |
|-------|----------|----------|
| Tailscale interfering with localhost | Use `127.0.0.1` instead of `localhost` | ✅ Secure |
| Need remote access | Create user with `@'%.ts.net.'` | ⚠️ Medium |
| Allow all hosts | Create user with `@'%'` | ❌ Insecure |

Choose the solution that matches your use case!

