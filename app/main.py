from fastapi import FastAPI, Body, Response, status
from fastapi.responses import JSONResponse

from pydantic import BaseModel

import psycopg
from psycopg.rows import dict_row

from app.utils import hash_password, verify_password

import base64
from PIL import Image
import io

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


class PostCreate(BaseModel):
    poster: int
    caption: str
    image: str  # Base64 encoded image


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
            query,
            (
                payload.first_name,
                payload.last_name,
                payload.phone_number,
                payload.location,
                hashed_password,
                payload.nic_passport,
                payload.email,
            ),
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


endpoint_status_codes = {
    201: {"description": "Post created"},
    500: {"description": "Database Error"},
}


@app.post("/posts/create", responses=endpoint_status_codes, status_code=status.HTTP_201_CREATED)  # type: ignore
async def create_post(payload: PostCreate = Body(...)):
    poster = payload.poster
    caption = payload.caption
    image = payload.image

    # Open the image from the Base64 encoded string
    image_data = io.BytesIO(base64.b64decode(image))
    image = Image.open(image_data)

    # Resize the image
    resized_image = image.resize((image.width // 3, image.height // 3))

    # Convert the resized image back to Base64 encoded string
    output_buffer = io.BytesIO()
    resized_image.save(output_buffer, format="JPEG")
    resized_image_data = base64.b64encode(output_buffer.getvalue()).decode("utf-8")

    query = b"""INSERT INTO posts (poster, caption, image) VALUES (%s, %s, %s) RETURNING id"""

    try:
        # Use the resized image in the query
        cur.execute(query, (poster, caption, resized_image_data))
        post_id = cur.fetchone()["id"]  # type: ignore
        conn.commit()
        return JSONResponse(
            status_code=status.HTTP_201_CREATED,
            content={"message": endpoint_status_codes[201]["description"], "post_id": post_id},
        )
    except Exception as e:
        print(f"ERROR - DB:\n{e}")
        return JSONResponse(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            content={"message": endpoint_status_codes[500]["description"]},
        )


endpoint_status_codes = {
    200: {"description": "Post liked"},
    500: {"description": "Database Error"},
    404: {"description": "Post not found"},
}


@app.put("/posts/like/{post_id}", responses=endpoint_status_codes)  # type: ignore
async def like_post(post_id: int):
    query = b"SELECT * FROM posts WHERE id = %s"
    try:
        cur.execute(query, (post_id,))
        result = cur.fetchone()
        if result:
            likes = result["likes"] + 1  # type: ignore
            query = b"UPDATE posts SET likes = %s WHERE id = %s"
            cur.execute(query, (likes, post_id))
            conn.commit()
            return JSONResponse(
                status_code=status.HTTP_200_OK,
                content={"message": endpoint_status_codes[200]["description"], "likes": likes},
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
