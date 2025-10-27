# Database Utility Quick Start Guide

## Import the Module

```python
from connect_database import (
    get_connection,
    get_engine,
    execute_query,
    execute_query_dict,
    query_to_dataframe,
    get_tables,
    get_databases
)
```

## Basic Usage

### 1. Simple Query (using pymysql)

```python
# Connect to database
conn = get_connection(database='recipedb')

# Execute query - returns list of tuples
results = execute_query(conn, "SELECT * FROM recipes LIMIT 5")
for row in results:
    print(row)

# Close connection
conn.close()
```

### 2. Query with Dictionary Results

```python
conn = get_connection(database='recipedb')

# Returns list of dictionaries
results = execute_query_dict(conn, "SELECT RecipeTitle, RecipeID FROM recipes LIMIT 5")
for row in results:
    print(f"Recipe: {row['RecipeTitle']} (ID: {row['RecipeID']})")

conn.close()
```

### 3. Using Pandas (Recommended)

```python
# Create engine
engine = get_engine(database='recipedb')

# Query to DataFrame
df = query_to_dataframe(engine, "SELECT * FROM recipes")
print(df.head())

# Clean up
engine.dispose()
```

### 4. Parameterized Queries (Safe from SQL Injection)

```python
conn = get_connection(database='recipedb')

# Using tuple for parameters
query = "SELECT * FROM recipes WHERE RecipeID = %s"
results = execute_query(conn, query, (1,))

conn.close()
```

```python
engine = get_engine(database='recipedb')

# Using dict for parameters with pandas
query = "SELECT * FROM recipes WHERE RecipeID = %(id)s"
df = query_to_dataframe(engine, query, {'id': 1})

engine.dispose()
```

### 5. Complex Queries with Joins

```python
engine = get_engine(database='recipedb')

query = """
SELECT 
    r.RecipeTitle,
    i.IngredientName
FROM 
    recipes r
INNER JOIN 
    recipe_ingredients ri ON r.RecipeID = ri.RecipeID
INNER JOIN 
    ingredients i ON ri.IngredientID = i.IngredientID
WHERE 
    r.RecipeTitle = 'Fettuccini Alfredo'
"""

df = query_to_dataframe(engine, query)
print(df)

engine.dispose()
```

### 6. Insert/Update/Delete Operations

```python
conn = get_connection(database='recipedb')

# Insert
query = "INSERT INTO table_name (col1, col2) VALUES (%s, %s)"
rows_affected = execute_update(conn, query, ('value1', 'value2'))
conn.commit()  # Don't forget to commit!

# Update
query = "UPDATE table_name SET col1 = %s WHERE col2 = %s"
rows_affected = execute_update(conn, query, ('new_value', 'condition'))
conn.commit()

# Delete
query = "DELETE FROM table_name WHERE col1 = %s"
rows_affected = execute_update(conn, query, ('value',))
conn.commit()

conn.close()
```

### 7. Get Database Information

```python
conn = get_connection()

# List all databases
databases = get_databases(conn)
print("Available databases:", databases)

# List tables in current database
tables = get_tables(conn)
print("Tables:", tables)

# Get table structure
table_info = get_table_info(conn, 'recipes')
for column in table_info:
    print(f"{column[0]} - {column[1]}")

conn.close()
```

### 8. Write DataFrame to Database

```python
import pandas as pd

engine = get_engine(database='recipedb')

# Create a DataFrame
df = pd.DataFrame({
    'col1': [1, 2, 3],
    'col2': ['a', 'b', 'c']
})

# Write to database
success = dataframe_to_table(df, 'my_new_table', engine, if_exists='replace')

engine.dispose()
```

## Context Manager Pattern (Auto-close)

```python
from contextlib import closing

# Automatically closes connection
with closing(get_connection(database='recipedb')) as conn:
    results = execute_query(conn, "SELECT * FROM recipes LIMIT 5")
    for row in results:
        print(row)
```

## Switching Databases

```python
# Connect to different databases
school_conn = get_connection(database='schoolschedulingdb')
recipe_conn = get_connection(database='recipedb')
sales_conn = get_connection(database='salesordersdb')

# Or with engines
school_engine = get_engine(database='schoolschedulingdb')
recipe_engine = get_engine(database='recipedb')
```

## Error Handling

```python
conn = get_connection(database='recipedb')

if conn is None:
    print("Failed to connect")
else:
    results = execute_query(conn, "SELECT * FROM recipes")
    if results:
        print(f"Found {len(results)} records")
    conn.close()
```

## Complete Example

```python
from connect_database import get_engine, query_to_dataframe

def get_recipe_ingredients(recipe_name):
    """Get all ingredients for a specific recipe"""
    engine = get_engine(database='recipedb')
    
    query = """
    SELECT 
        r.RecipeTitle,
        i.IngredientName,
        ri.Amount,
        m.MeasurementDescription
    FROM recipes r
    INNER JOIN recipe_ingredients ri ON r.RecipeID = ri.RecipeID
    INNER JOIN ingredients i ON ri.IngredientID = i.IngredientID
    LEFT JOIN measurements m ON ri.MeasureAmountID = m.MeasureAmountID
    WHERE r.RecipeTitle = %(recipe)s
    ORDER BY ri.RecipeSeqNo
    """
    
    df = query_to_dataframe(engine, query, {'recipe': recipe_name})
    engine.dispose()
    
    return df

# Use the function
result = get_recipe_ingredients('Fettuccini Alfredo')
print(result)
```

## Tips

1. **Always close connections/engines** when done
2. **Use `get_engine()` for pandas** operations
3. **Use parameterized queries** to prevent SQL injection
4. **Commit after INSERT/UPDATE/DELETE** operations
5. **Use `verbose=True`** when debugging connections
6. **Check for None** before using connection/engine

## Available Databases

- `schoolschedulingdb`
- `recipedb`
- `accountspayabledb`
- `entertainmentagencydb`
- `salesordersdb`
- `bowlingleaguedb`

