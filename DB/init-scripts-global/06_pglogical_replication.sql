 -- Enable pg_logical extension
CREATE EXTENSION IF NOT EXISTS pglogical;
    -- Create the replication slot

SELECT pg_create_logical_replication_slot('global_slot', 'pgoutput');

  -- Create the replication publication for the client table
CREATE PUBLICATION client_pub FOR TABLE client;

    -- Create the replication subscription for the client table
CREATE SUBSCRIPTION client_subscription_local1
        CONNECTION 'dbname=local1 host=db_postgres_local1 user=postgres password=postgres'
        PUBLICATION client_pub;

CREATE SUBSCRIPTION client_subscription_local2
        CONNECTION 'dbname=local2 host=db_postgres_local1 user=postgres password=postgres'
        PUBLICATION client_pub;     