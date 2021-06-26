FROM debezium/postgres:13
ENV APP_DB_USER ksqldb
ENV APP_DB_PASS ksqldb
ENV APP_DB_NAME demo_db
COPY db/init-demo-database.sh /docker-entrypoint-initdb.d/