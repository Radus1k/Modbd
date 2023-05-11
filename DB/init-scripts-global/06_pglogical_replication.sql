 -- Enable pg_logical extension
CREATE EXTENSION IF NOT EXISTS pglogical;
    -- Create the replication slot

SELECT pglogical.create_node(
    node_name := 'global',
    dsn := 'host=db_postgres_global port=5432 dbname=global user=postgres password=postgres'
);


SELECT pglogical.create_replication_set('local1_set');
SELECT pglogical.create_replication_set('local2_set');


SELECT pglogical.replication_set_add_table('local1_set', 'public.facilitate');
SELECT pglogical.replication_set_add_table('local1_set', 'public.tip_camera');
SELECT pglogical.replication_set_add_table('local1_set', 'public.administrator');
SELECT pglogical.replication_set_add_table('local1_set', 'public.client_replica');

SELECT pglogical.replication_set_add_table('local2_set', 'public.facilitate');
SELECT pglogical.replication_set_add_table('local2_set', 'public.tip_camera');
SELECT pglogical.replication_set_add_table('local2_set', 'public.administrator');
SELECT pglogical.replication_set_add_table('local2_set', 'public.client_replica');



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
