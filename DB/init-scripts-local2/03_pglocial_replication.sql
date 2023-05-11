CREATE EXTENSION IF NOT EXISTS pglogical;

SELECT pglogical.create_node(
    node_name := 'local2',
    dsn := 'host=db_postgres_local2 port=5432 dbname=local2 user=postgres password=postgres'
);
