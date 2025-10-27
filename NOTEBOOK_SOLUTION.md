# Question 1 Solution - RecipeDB Query

## Problem Statement
Write a query to retrieve the 'RecipeTitle' and 'IngredientName' for each ingredient used in the 'Fettuccini Alfredo' recipe (from 'recipes' and 'ingredients' tables).

**Hint**: 3 tables used in join

## Solution

### SQL Query
```sql
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
ORDER BY 
    ri.RecipeSeqNo;
```

### Explanation

**Tables involved:**
1. **`recipes` (alias: r)** - Contains recipe information (RecipeID, RecipeTitle)
2. **`recipe_ingredients` (alias: ri)** - Junction table that links recipes to ingredients (RecipeID, IngredientID, RecipeSeqNo)
3. **`ingredients` (alias: i)** - Contains ingredient information (IngredientID, IngredientName)

**Join Logic:**
- First JOIN: Connect `recipes` to `recipe_ingredients` using `RecipeID`
- Second JOIN: Connect `recipe_ingredients` to `ingredients` using `IngredientID`

**Filtering:**
- WHERE clause filters for only 'Fettuccini Alfredo' recipe

**Ordering:**
- Results are ordered by `RecipeSeqNo` to show ingredients in the order they're used

## Results

Found **7 ingredients** for 'Fettuccini Alfredo' recipe:

| RecipeTitle         | IngredientName           |
|---------------------|--------------------------|
| Fettuccini Alfredo  | Fettuccini Pasta         |
| Fettuccini Alfredo  | Vegetable Oil            |
| Fettuccini Alfredo  | Salt                     |
| Fettuccini Alfredo  | Butter                   |
| Fettuccini Alfredo  | Heavy Cream              |
| Fettuccini Alfredo  | Parmesan Cheese          |
| Fettuccini Alfredo  | White Pepper (ground)    |

## Implementation in Notebook

The solution is implemented in `Notebooks/Notebooks.ipynb` using the `connect_database` utility module:

```python
# Import utility functions
from connect_database import get_engine, query_to_dataframe

# Connect to RecipeDB
engine = get_engine(database='recipedb', verbose=True)

# Execute query
df = query_to_dataframe(engine, query)

# Display results
print(df)

# Clean up
engine.dispose()
```

## Key Concepts Demonstrated

1. **Multi-table JOIN** - Connecting 3 tables using INNER JOIN
2. **Table aliases** - Using short aliases (r, ri, i) for readability
3. **Foreign key relationships** - Understanding how junction tables work
4. **Query optimization** - Using appropriate JOINs and ORDER BY
5. **Using utility module** - Leveraging reusable database connection code
6. **Pandas integration** - Converting SQL results to DataFrame for analysis

## Database Schema

```
recipes
├── RecipeID (PK)
└── RecipeTitle

recipe_ingredients (Junction Table)
├── RecipeID (FK → recipes.RecipeID)
├── IngredientID (FK → ingredients.IngredientID)
└── RecipeSeqNo

ingredients
├── IngredientID (PK)
└── IngredientName
```

## Alternative Approaches

### Using explicit column selection from junction table:
```sql
SELECT 
    r.RecipeTitle,
    i.IngredientName,
    ri.Amount,
    ri.RecipeSeqNo
FROM recipes r
INNER JOIN recipe_ingredients ri ON r.RecipeID = ri.RecipeID
INNER JOIN ingredients i ON ri.IngredientID = i.IngredientID
WHERE r.RecipeTitle = 'Fettuccini Alfredo'
ORDER BY ri.RecipeSeqNo;
```

### Using LEFT JOIN (if recipe might have no ingredients):
```sql
SELECT 
    r.RecipeTitle,
    COALESCE(i.IngredientName, 'No ingredient') as IngredientName
FROM recipes r
LEFT JOIN recipe_ingredients ri ON r.RecipeID = ri.RecipeID
LEFT JOIN ingredients i ON ri.IngredientID = i.IngredientID
WHERE r.RecipeTitle = 'Fettuccini Alfredo'
ORDER BY ri.RecipeSeqNo;
```

## Verification

✅ Query successfully executes  
✅ Returns 7 ingredients  
✅ All ingredients are specific to Fettuccini Alfredo  
✅ Results are properly ordered  
✅ No duplicate entries  
✅ Properly formatted output  

## Files Modified

- `Notebooks/Notebooks.ipynb` - Contains the complete solution with explanations
- `connect_database.py` - Utility module used for database connections

