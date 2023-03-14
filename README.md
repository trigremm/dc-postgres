# dc-postgres

### deploy script
```
git clone https://github.com/trigremm/dc-postgres.git
cd dc-postgres
cp .env.postgres.example .env.postgres
make up 
```

### shutdown script 
```
make stop
```

## cookbook
```
# export variables
echo "export $(cat .env.postgres | grep POSTGRES_USER)"
echo "export $(cat .env.postgres | grep POSTGRES_PASSWORD)"
echo "export $(cat .env.postgres | grep POSTGRES_DB)"

export POSTGRES_HOST=127.0.0.1
export POSTGRES_PORT=5432

# create database example ! check spaces after backslash (\)
PGPASSWORD=${POSTGRES_PASSWORD} createdb \
    -h ${POSTGRES_HOST} \
    -p ${POSTGRES_PORT} \
    -U ${POSTGRES_USER} \
    -O ${POSTGRES_USER} \
    -e \
    -E UTF8 \
    example

# alternative way to create db 
PGPASSWORD=${POSTGRES_PASSWORD} psql -h localhost -p 5432 -U postgres -d postgres -c "CREATE DATABASE example;"

# restore data from dump to example database (???)
PGPASSWORD=${POSTGRES_PASSWORD} psql \
    -h ${POSTGRES_HOST} \
    -p ${POSTGRES_PORT} \
    -U ${POSTGRES_USER} \
    -d example < ~/employees-database/employees_data.sql

# drop database example 
PGPASSWORD=${POSTGRES_PASSWORD} \
PGHOST=${POSTGRES_HOST} \
PGUSER=${POSTGRES_USER} \
    dropdb --if-exists example
```