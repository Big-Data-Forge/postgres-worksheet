[![Docker](https://img.shields.io/badge/Docker-%230db7ed.svg?logo=docker&logoColor=white)](https://www.docker.com/)
[![Docker Compose](https://img.shields.io/badge/Docker%20Compose-%230db7ed.svg?logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-%23316192.svg?logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![PgBouncer](https://img.shields.io/badge/PgBouncer-%23316192.svg?logo=postgresql&logoColor=white)](https://www.pgbouncer.org/)
[![pgAdmin](https://img.shields.io/badge/pgAdmin-%23316192.svg?logo=postgresql&logoColor=white)](https://www.pgadmin.org/)
<br>
![OS](https://img.shields.io/badge/OS-Linux%2C%20Windows%2C%20MacOS-0078D4)
![CPU](https://img.shields.io/badge/CPU-x86%2C%20x64%2C%20ARM%2C%20ARM64-FF8C00)
![GitHub last commit](https://img.shields.io/github/last-commit/Kyrylo-Ktl/advent-of-code)

# Postgres worksheet

This project provides a preconfigured environment for working with PostgreSQL databases using Docker Compose. It includes the following services:

+ [PostgreSQL](https://www.postgresql.org/) - the primary database service with custom configuration.
+ [PgBouncer](https://www.pgbouncer.org/) - a lightweight connection pooler for PostgreSQL, improving performance and scalability.
+ [pgAdmin](https://www.pgadmin.org/) - a web-based PostgreSQL database management tool.


## Architecture

### Components

![Architecture diagram](https://github.com/user-attachments/assets/d20e472b-6c2d-4561-b31c-f8cd13c6a020)

### Data model

![postgres-worksheet-er](https://github.com/user-attachments/assets/dd8c7574-8d83-4bc8-b134-2d17b6686fa3)

## Usage

### Prerequisites

...

### Configuration

...

Fill environment .env file:

```
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=

PGADMIN_DEFAULT_EMAIL=
PGADMIN_DEFAULT_PASSWORD=

POSTGRESQL_HOST=postgres
POSTGRESQL_PORT=5432
```

### Run

...

```shell
docker compose up --build
```


## License

...
