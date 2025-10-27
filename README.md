# Database Connection Project

Python scripts for connecting to MySQL databases running on localhost with support for multiple database schemas.

## 📋 Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Available Databases](#available-databases)
- [Usage](#usage)
- [Testing Connection](#testing-connection)
- [Project Structure](#project-structure)
- [Security](#security)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## ✨ Features

- 🔐 Secure credential management using `.env` files
- 🐍 Multiple connection methods (pymysql, SQLAlchemy)
- 🐼 Pandas integration for easy data manipulation
- 🔍 Built-in connection diagnostics and testing
- 🌐 Support for localhost and network connections
- 📊 Access to 6 pre-configured sample databases
- 🛠️ Comprehensive error handling and troubleshooting tools

## 🔧 Prerequisites

- Python 3.8+ (Anaconda recommended)
- MySQL Server 8.0+ running on localhost
- MySQL credentials (username and password)

## 📦 Installation

### 1. Clone the Repository

```bash
git clone <repository-url>
cd database
```

### 2. Install Dependencies

Using conda (recommended):
```bash
conda install -c conda-forge python-dotenv pymysql pandas sqlalchemy -y
```

Or using pip:
```bash
pip install -r requirements.txt
```

### 3. Configure Environment Variables

Create or update the `.env` file with your MySQL credentials:

```env
DB_SERVER=localhost
DB_PORT=3306
DB_NAME=schoolschedulingdb
DB_USER=root
DB_PASSWORD=your_password_here
DB_CHARSET=utf8mb4
```

### 4. Import Databases

Import the sample databases into MySQL:

```bash
mysql -u root -p < create_db.sql
```

## ⚙️ Configuration

The `.env` file controls all connection parameters:

| Variable | Description | Default | Example |
|----------|-------------|---------|---------|
| `DB_SERVER` | MySQL server address | localhost | 192.168.1.100 |
| `DB_PORT` | MySQL port | 3306 | 3306 |
| `DB_NAME` | Database name | schoolschedulingdb | recipedb |
| `DB_USER` | MySQL username | root | your_user |
| `DB_PASSWORD` | MySQL password | - | your_password |
| `DB_CHARSET` | Character encoding | utf8mb4 | utf8mb4 |

## 🗄️ Available Databases

The `create_db.sql` file includes 6 sample databases:

1. **schoolschedulingdb** - School class scheduling system
2. **recipedb** - Recipe and ingredient management
3. **accountspayabledb** - Accounts payable tracking
4. **entertainmentagencydb** - Entertainment booking agency
5. **salesordersdb** - Sales order management
6. **bowlingleaguedb** - Bowling league statistics

To switch databases, update `DB_NAME` in the `.env` file.

## 🚀 Usage

### Quick Start

```python
from connect_database import connect_mysql, connect_mysql_sqlalchemy

# Method 1: Using pymysql (simple queries)
conn = connect_mysql()
if conn:
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM buildings LIMIT 5")
    results = cursor.fetchall()
    for row in results:
        print(row)
    conn.close()

# Method 2: Using SQLAlchemy + Pandas (data analysis)
engine = connect_mysql_sqlalchemy()
if engine:
    import pandas as pd
    df = pd.read_sql("SELECT * FROM buildings", engine)
    print(df.head())
    engine.dispose()
```

### Advanced Usage

```python
from connect_database import connect_mysql_sqlalchemy, execute_query
import pandas as pd

# Connect to database
engine = connect_mysql_sqlalchemy()

# Execute query and get DataFrame
query = """
    SELECT 
        BuildingCode, 
        BuildingName, 
        NumberOfFloors 
    FROM buildings 
    WHERE NumberOfFloors > 2
"""
df = execute_query(engine, query)

# Analyze data
print(df.describe())
print(df.groupby('NumberOfFloors').count())

# Clean up
engine.dispose()
```

### Using in Jupyter Notebooks

```python
# In Jupyter/IPython notebook
from connect_database import connect_mysql_sqlalchemy
import pandas as pd

engine = connect_mysql_sqlalchemy()

# Display tables
tables_df = pd.read_sql("SHOW TABLES", engine)
display(tables_df)

# Query and visualize data
df = pd.read_sql("SELECT * FROM buildings", engine)
df.plot(kind='bar', x='BuildingName', y='NumberOfFloors')
```

## 🧪 Testing Connection

### Diagnostic Test

Quickly check if MySQL is accessible:

```bash
python test_mysql_connection.py
```

This will:
- ✅ Test MySQL server connectivity
- ✅ List all available databases
- ✅ Verify target database exists
- ✅ Show tables in the database

### Full Connection Test

Run comprehensive tests with both connection methods:

```bash
python connect_database.py
```

This will:
- ✅ Test pymysql connection
- ✅ Test SQLAlchemy connection
- ✅ Query sample data with pandas
- ✅ Display table listings

## 📁 Project Structure

```
database/
├── .env                          # Database credentials (DO NOT COMMIT)
├── .gitignore                    # Git ignore rules
├── README.md                     # This file
├── requirements.txt              # Python dependencies
├── connect_database.py           # Main connection script
├── test_mysql_connection.py      # Diagnostic tool
├── create_db.sql                 # Database schemas and data
├── reset_password_helper.sql     # MySQL password reset helper
├── mysql_network_status.md       # Network configuration guide
├── CURRENT_STATUS.md            # Setup status and checklist
└── Notebooks/
    └── Notebooks.ipynb          # Jupyter notebook for data analysis
```

## 🔒 Security

### Important Security Notes

1. **Never commit `.env` file** - Contains sensitive credentials
   - ✅ Already in `.gitignore`
   
2. **Use strong passwords** - Especially for production environments

3. **Limit user permissions** - Don't use root for applications
   ```sql
   CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'StrongPassword';
   GRANT SELECT, INSERT, UPDATE ON schoolschedulingdb.* TO 'app_user'@'localhost';
   FLUSH PRIVILEGES;
   ```

4. **Network access** - MySQL is bound to all interfaces (0.0.0.0)
   - Protected by user permissions (localhost only by default)
   - Windows Firewall provides additional protection

### Creating Application Users

```sql
-- Read-only user
CREATE USER 'readonly'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON schoolschedulingdb.* TO 'readonly'@'localhost';

-- Read-write user
CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON schoolschedulingdb.* TO 'appuser'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;
```

## 🔧 Troubleshooting

### Connection Failed: Access Denied

**Error**: `Access denied for user 'root'@'localhost'`

**Solution**:
1. Verify password in `.env` file
2. Test manual connection: `mysql -u root -p`
3. Reset password if needed (see `reset_password_helper.sql`)

### Connection Failed: Password Expired

**Error**: `Your password has expired`

**Solution**:
```bash
mysql -u root -p --connect-expired-password
```
Then:
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'your_password';
ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
FLUSH PRIVILEGES;
```

### Database Does Not Exist

**Error**: `Unknown database 'SchoolSchedulingDB'`

**Solution**:
1. Import databases: `mysql -u root -p < create_db.sql`
2. Check database names are lowercase: `schoolschedulingdb`
3. Update `.env` with correct database name

### MySQL Not Running

**Error**: `Can't connect to MySQL server on 'localhost'`

**Solution**:
1. Check MySQL service: `Get-Service MySQL*`
2. Start service: `Start-Service MySQL80`
3. Verify port 3306 is listening: `netstat -an | Select-String "3306"`

### Module Not Found Error

**Error**: `ModuleNotFoundError: No module named 'pymysql'`

**Solution**:
```bash
conda install -c conda-forge pymysql pandas sqlalchemy python-dotenv -y
```

## 📚 Additional Documentation

- `mysql_network_status.md` - Network configuration and remote access
- `CURRENT_STATUS.md` - Setup checklist and current state
- `reset_password_helper.sql` - SQL script for password reset

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is open source and available under the MIT License.

## 📞 Support

For issues and questions:
- Check the [Troubleshooting](#troubleshooting) section
- Review `mysql_network_status.md` for network issues
- Run `python test_mysql_connection.py` for diagnostics

## 🎯 Quick Reference

### Common Commands

```bash
# Test connection
python test_mysql_connection.py

# Full test with sample data
python connect_database.py

# Import databases
mysql -u root -p < create_db.sql

# Connect to MySQL manually
mysql -u root -p

# Check MySQL service
Get-Service MySQL*

# View network configuration
netstat -an | Select-String "3306"
```

### Database Connection String Examples

```python
# MySQL with pymysql
mysql+pymysql://user:password@localhost:3306/database_name

# PostgreSQL (requires psycopg2)
postgresql://user:password@localhost:5432/database_name

# SQL Server (requires pyodbc)
mssql+pyodbc://user:password@localhost/database_name?driver=ODBC+Driver+17+for+SQL+Server
```

---

**Happy Coding! 🚀**

Made with ❤️ for database connectivity
