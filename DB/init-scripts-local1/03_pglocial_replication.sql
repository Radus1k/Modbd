CREATE EXTENSION IF NOT EXISTS pglogical;

SELECT pglogical.create_node(
    node_name := 'local1',
    dsn := 'host=db_postgres_local1 port=5432 dbname=local1 user=postgres password=postgres'
);