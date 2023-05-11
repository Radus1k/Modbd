CREATE EXTENSION IF NOT EXISTS pglogical;
-- On local2
SELECT pglogical.create_node(
    node_name := 'local2',
    dsn := 'host=db_postgres_local2 port=5432 dbname=local2 user=postgres password=postgres'
);

SELECT pglogical.create_subscription(
    subscription_name := 'local2_subscription',
    replication_sets := ARRAY['local2_set'],
    provider_dsn := 'host=db_postgres_global port=5432 dbname=global user=postgres password=postgres'
);

SELECT pglogical.create_subscription(
    subscription_name := 'local2_client_subscription',
    replication_sets := ARRAY['local2_client_set'],
    provider_dsn := 'host=db_postgres_global port=5432 dbname=global user=postgres password=postgres'
);
