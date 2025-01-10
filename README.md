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

This project provides a preconfigured environment for working with PostgreSQL database infrastructure using Docker Compose.
It includes the following services:

+ [PostgreSQL](https://www.postgresql.org/) - the primary database service with custom configuration;
+ [PgBouncer](https://www.pgbouncer.org/) - a lightweight connection pooler for PostgreSQL;
+ [pgAdmin](https://www.pgadmin.org/) - a web-based PostgreSQL database management tool.


## Architecture

### Components

![Architecture diagram](https://github.com/user-attachments/assets/d20e472b-6c2d-4561-b31c-f8cd13c6a020)

### Features

This preconfigured project environment provides the following features:

+ **PostgreSQL**
  + Custom configuration through a mounted `postgresql.conf` file;
  + Automated data model creation with scripts from mounted `docker-entrypoint-initdb.d` folder;
  + Persistent data model storage via volumes;
  + Resources optimal setup - CPU (2) and memory (4G);
  + Health checks to ensure the database is ready before other services start;
  + Isolated in the internal Docker network;


+ **PgBouncer**;
  + Connection pooling for database to optimize resource usage;
  + SCRAM-SHA-256 authentication for secure connections;
  + Resources optimal setup - CPU (0.5) and memory (1G);
  + Accessible via the external Docker network;


+ **pgAdmin**;
  + Persistent configurations storage via volumes;
  + Resources optimal setup - CPU (0.5) and memory (1G);

### Data model

In this project, an e-commerce data model is implemented by default to manage customers, products and related orders.
The data model is created automatically when the database is first started and is populated with synthetic records:

+ Customers - [table](config/postgresql/scripts/01-create-0001-customers-table.sql) with information about 10,000 [randomly generated](config/postgresql/scripts/02-fill-0001-customers-table.sql) customers;
+ Products - [table](config/postgresql/scripts/01-create-0002-products-table.sql) with information about 100,000 [randomly generated](config/postgresql/scripts/02-fill-0002-products-table.sql) products;
+ Orders - [table](config/postgresql/scripts/01-create-0003-orders-table.sql) with information about 1,000,000 [randomly generated](config/postgresql/scripts/02-fill-0003-orders-table.sql) orders;

![postgres-worksheet-er](https://github.com/user-attachments/assets/dd8c7574-8d83-4bc8-b134-2d17b6686fa3)


## Usage

### Prerequisites

Make sure you have [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) installed on your machine.

### Setup

Project uses an `.env` file with environment variables to manage configurations and tool settings.
The file should be created using the `.env.example` file provided in the root directory using the following command:


```shell
cp .env.example .env
```

And then filled with the corresponding values: 

```dotenv
POSTGRES_DB=<database-name>
POSTGRES_USER=<postgres-user>
POSTGRES_PASSWORD=<postgres-password>

PGADMIN_DEFAULT_EMAIL=<pgadmin-email>
PGADMIN_DEFAULT_PASSWORD=<pgadmin-password>

POSTGRESQL_HOST=postgres
POSTGRESQL_PORT=5432
```

### Run

Build and start the database services infrastructure by running:

```shell
docker compose up -d --build
```

> [!NOTE]  
> First run will take some time, as all necessary docker images will be loaded and the data model will be created and populated with synthetic records.

Check that all services are successfully started by running:

```shell
docker compose ps
```

To stop all running services, execute:

```shell
docker compose down
```

> [!NOTE]  
> After stopping the services, the data will not be deleted and will be available when the services are restarted.

If you want to stop the services and remove all associated data use:

```shell
docker compose down --volumes
```

> [!WARNING]
> This command deletes all service data (e.g. data model, stored passwords and configurations).


## License

This project is licensed under the [MIT License](LICENSE).
