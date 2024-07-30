[![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)](https://fastapi.tiangolo.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Psycopg](https://img.shields.io/badge/Psycopg-FF6C37?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.psycopg.org/)
[![Passlib](https://img.shields.io/badge/Passlib-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://passlib.readthedocs.io/)
[![Bcrypt](https://img.shields.io/badge/Bcrypt-8A2BE2?style=for-the-badge&logo=python&logoColor=white)](https://pypi.org/project/bcrypt/)


# Deployment Instructions using Windows Subsystem for Linux (WSL)

1. Install PostgreSQL
2. Create the database with the appropriate name and import the data using the 'Restore' function.
3. Open 'Turn Windows features On or Off' from the start menu.
   - Tick the 'Windows Subsystem for Linux' and apply.
   - Restart when prompted.
4. Search for the latest 'Ubuntu' app from Windows Store and install the latest edition.
   - Enter a user name and password and configure anything else if needed.
5. Clone this repository
6. `cd` into the cloned directory.
7. Create Python Virtual Environment with `python -m venv venv`
8. Activate the virtual environment `./venv/bin/activate`
9. Find the `postgresql.conf` file
   - default location: `C:\Program Files\PostgreSQL\<PostgreSQL version no.>\data\postgresql.conf`
   - Find the line `listen_addresses` and change it's value to `'*'`
10. Find the `pg_hba.conf` file
    - default location `C:\Program Files\PostgreSQL\<PostgreSQL version no.>\data\pg_hba.conf`
    - Add the following line at the end of the file
      ```
      host    all    all    127.0.0.1/32    scram-sha-256
      ```
    - Ensure the columns of the last line are aligned with the previous last row.
11. When you are at the directory of the cloned repository, enter command `fastapi dev app/main.py` to start the server.