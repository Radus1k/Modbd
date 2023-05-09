CREATE EXTENSION IF NOT EXISTS dblink;

SELECT dblink_connect('toglobal', 'host=db_postgres_global port=5432 dbname=global_hotels user=postgres password=postgres');