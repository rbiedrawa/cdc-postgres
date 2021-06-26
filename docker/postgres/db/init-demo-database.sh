#!/bin/bash
set -e
export PGPASSWORD=$POSTGRES_PASSWORD;
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';
  CREATE DATABASE $APP_DB_NAME;
  GRANT ALL PRIVILEGES ON DATABASE $APP_DB_NAME TO $APP_DB_USER;
  \connect $APP_DB_NAME $APP_DB_USER
  BEGIN;
    CREATE TABLE IF NOT EXISTS demo_table (
      id  SERIAL PRIMARY KEY,
      message VARCHAR(255)
    );
  COMMIT;
  BEGIN;
    INSERT INTO demo_table(id, message) VALUES (1, 'Hello World 1');
    INSERT INTO demo_table(id, message) VALUES (2, 'Hello World 2');
  COMMIT;
EOSQL