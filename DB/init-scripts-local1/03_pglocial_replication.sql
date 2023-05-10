-- CREATE EXTENSION IF NOT EXISTS pglogical;

-- CREATE SUBSCRIPTION client_subscription_local1
--     CONNECTION 'dbname=local1 host=db_postgres_global user=postgres password=postgres'
--     PUBLICATION client_pub;