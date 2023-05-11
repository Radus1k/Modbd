CREATE EXTENSION IF NOT EXISTS pglogical;

SELECT pglogical.create_subscription(
    subscription_name := 'local1_to_global_subscription',
    replication_sets := ARRAY['local1_set'],
    provider_dsn := 'host=db_postgres_local1 port=5432 dbname=local1 user=postgres password=postgres'
);

SELECT pglogical.create_subscription(
    subscription_name := 'local2_to_global_subscription',
    replication_sets := ARRAY['local2_set'],
    provider_dsn := 'host=db_postgres_local2 port=5432 dbname=local2 user=postgres password=postgres'
);
