from fastapi import FastAPI, Body, Response, status
from fastapi.responses import JSONResponse

from pydantic import BaseModel

import psycopg
from psycopg.rows import dict_row

from app.utils import hash_password, verify_password

# database configuration
db_name = "travelpoint"
user = "postgres"
root_password = "root"
host = "127.0.0.1"
port = "5432"
DSN = f"dbname={db_name} user={user} password={root_password} host={host} port={port}"

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
# cur.execute("SELECT * FROM user_info")
# result = cur.fetchall()
#
# print("Printing rows")
# i: psycopg.rows.DictRow
# for i in result:
#     print(i)

# pydantic data models


class UserRegistration(BaseModel):
    email: str
    first_name: str
    last_name: str
    phone_number: int
    nic_passport: str
    location: str
    password: str


class UserLogin(BaseModel):
    email: str
    password: str


class SimpleErrorMessage(BaseModel):
    message: str


# server
app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


endpoint_errors = {
    500: {"model": SimpleErrorMessage, "description": "Database Error"},
}


@app.post("/user_management/register", status_code=status.HTTP_201_CREATED, responses=endpoint_errors)  # type: ignore
async def register_user(payload: UserRegistration = Body(...), response: Response = Response()):
    hashed_password = hash_password(payload.password)

    query = b"""INSERT INTO user_info (first_name, last_name, phone_number, location, password, nic_passport, email) \
            VALUES (%s, %s, %s, %s, %s, %s, %s)"""

    try:
        cur.execute(
            query, (payload.first_name, payload.last_name, payload.phone_number, payload.location, hashed_password, payload.nic_passport, payload.email)
        )
        conn.commit()
        return JSONResponse(content={"message": "User registered!"})
    except Exception as e:
        print(f"ERROR - DB:\n{e}")
        return JSONResponse(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, content={"message": endpoint_errors[500]["description"]}
        )


endpoint_status_codes = {
    200: {"description": "Login successful"},
    500: {"description": "Database Error"},
    404: {"description": "User not found"},
    401: {"description": "Invalid password"},
}


@app.get("/auth/login", responses=endpoint_status_codes)  # type: ignore
async def login_user(payload: UserLogin = Body(...)):
    email = payload.email
    password = payload.password

    query = b"SELECT * FROM user_info WHERE email = %s"
    try:
        cur.execute(query, (email,))
        result = cur.fetchone()
        if result:
            if verify_password(password, result["password"]):  # type: ignore
                return JSONResponse(
                    status_code=status.HTTP_200_OK,
                    content={"message": endpoint_status_codes[200]["description"], "user": result},
                )
            else:
                return JSONResponse(
                    status_code=status.HTTP_401_UNAUTHORIZED,
                    content={"message": endpoint_status_codes[401]["description"]},
                )
        else:
            return JSONResponse(
                status_code=status.HTTP_404_NOT_FOUND, content={"message": endpoint_status_codes[404]["description"]}
            )
    except Exception as e:
        print(f"ERROR - DB:\n{e}")
        return JSONResponse(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR, content={"message": endpoint_errors[500]["description"]}
        )
