CREATE EXTENSION IF NOT EXISTS pglogical;
-- On local1
SELECT pglogical.create_node(
    node_name := 'local1',
    dsn := 'host=db_postgres_local1 port=5432 dbname=local1 user=postgres password=postgres'
);

SELECT pglogical.create_subscription(
    subscription_name := 'local1_subscription',
    replication_sets := ARRAY['local1_set'],
    provider_dsn := 'host=db_postgres_global port=5432 dbname=global user=postgres password=postgres'
);

SELECT pglogical.create_subscription(
    subscription_name := 'local1_client_subscription',
    replication_sets := ARRAY['local1_client_set'],
    provider_dsn := 'host=db_postgres_global port=5432 dbname=global user=postgres password=postgres'
);

