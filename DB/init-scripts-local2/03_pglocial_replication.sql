-- CREATE EXTENSION IF NOT EXISTS pglogical;

-- CREATE SUBSCRIPTION client_subscription_local2
--     CONNECTION 'dbname=local2 host=db_postgres_global user=postgres password=postgres'
--     PUBLICATION client_pub;