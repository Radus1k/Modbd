CREATE EXTENSION IF NOT EXISTS pglogical;

SELECT pglogical.create_node(
    node_name := 'local2',
    dsn := 'host=db_postgres_local2 port=5432 dbname=local2 user=postgres password=postgres'
);

-- CREATE SUBSCRIPTION local2_subscription CONNECTION 'dbname=global host=db_postgres_global user=postgres password=postgres' PUBLICATION global_publication;

-- CREATE SUBSCRIPTION client_subscription CONNECTION 'dbname=global host=db_postgres_global user=postgres password=postgres' PUBLICATION client_publication;
-- ALTER SUBSCRIPTION client_subscription ENABLE;