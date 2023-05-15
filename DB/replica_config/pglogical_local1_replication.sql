CREATE EXTENSION IF NOT EXISTS pglogical;
-- On local2

SELECT pglogical.create_subscription(
    subscription_name := 'global_to_local1_subscription',
    replication_sets := ARRAY['local1_set'],
    provider_dsn := 'host=db_postgres_global port=5432 dbname=global user=postgres password=postgres'
);

CREATE SUBSCRIPTION local1_subscription CONNECTION 'dbname=global host=db_postgres_global user=postgres password=postgres' PUBLICATION global_publication;
CREATE SUBSCRIPTION client_subscription CONNECTION 'dbname=global host=db_postgres_global user=postgres password=postgres' PUBLICATION global_client_publication;
ALTER SUBSCRIPTION local1_subscription ENABLE;
ALTER SUBSCRIPTION client_subscription ENABLE;
