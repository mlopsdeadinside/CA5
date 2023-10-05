import pyodbc

# Define the connection string
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost,1433;"
    "DATABASE=MyDatabase;"
    "UID=sa;"
    "PWD=CAT@DOG123"
)

# Establish a database connection
conn = pyodbc.connect(conn_str)

# Create a cursor object
cursor = conn.cursor()

# Insert data into the database
cursor.execute("INSERT INTO MyTable (ID,Name1,Username,Email) VALUES (?, ?)", (1, 'John Doe' , 'JohnDoe11' , 'Johndoe@gmail.com'))
conn.commit()

# Retrieve data from the database
cursor.execute("SELECT * FROM MyTable")
for row in cursor:
    print(row)

# Close the cursor and connection
cursor.close()
conn.close()
