CREATE EXTENSION IF NOT EXISTS pglogical;
-- On local2

SELECT pglogical.create_subscription(
    subscription_name := 'global_to_local1_subscription',
    replication_sets := ARRAY['local1_set'],
    provider_dsn := 'host=db_postgres_global port=5432 dbname=global user=postgres password=postgres'
);
