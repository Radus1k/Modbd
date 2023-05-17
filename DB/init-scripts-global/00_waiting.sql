DO $$
BEGIN
    RAISE NOTICE 'Waiting for the local databases to be created';
END $$;

SELECT pg_sleep(10);


DO $$
BEGIN
    RAISE NOTICE 'Local databases should have been created';
END $$;