import psycopg
from psycopg.rows import dict_row

# database configuration
db_name = "travelpoint"
user = "postgres"
root_password = "root"
DSN = f"dbname={db_name} user={user} password={root_password}"

#  try to connect to database
conn: psycopg.connection.Connection  # type hint
try:
    # type hints for IDE support
    conn: psycopg.Connection
    cur: psycopg.Cursor

    conn = psycopg.connect(DSN, row_factory=dict_row)  # type: ignore
    cur = conn.cursor()
except Exception as e:
    print(f"Error connecting to DB:\n{e}")
    exit(1)

# test database
# read all rows
cur.execute("SELECT * FROM user_info")
result = cur.fetchall()

print("Printing rows")
i: psycopg.rows.DictRow
for i in result:
    print(i)