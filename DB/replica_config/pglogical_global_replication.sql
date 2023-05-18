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

-- Horizontal fragmentation
CREATE PUBLICATION global_publication FOR TABLE public.facilitate, public.tip_camera, public.administrator; 

-- Vertical fragmentation
CREATE PUBLICATION global_client_publication FOR TABLE client (id_client, nume_complet, email, telefon, iban);


CREATE EXTENSION IF NOT EXISTS pg_partman;

CREATE TABLE client_personal PARTITION OF client (
  hash_parola VARCHAR(25) CONSTRAINT hash_parola_client_nn NOT NULL,
  email VARCHAR(50) CONSTRAINT email_client_nn NOT NULL
);

-- Create the financial details fragment
CREATE TABLE client_financial PARTITION OF client (
  iban CHAR(34)
);

-- Create partitioning rules
SELECT partman.create_parent('client', 'id_client', 'LIST', 'nume_utilizator');
SELECT partman.create_rule('client', 'client_personal', 'FOR VALUES IN (''personal'')');
SELECT partman.create_rule('client', 'client_financial', 'FOR VALUES IN (''financial'')');
