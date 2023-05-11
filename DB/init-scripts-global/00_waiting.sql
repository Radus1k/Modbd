DO $$
BEGIN
    RAISE NOTICE 'Waiting for the local databases to be created';
END $$;

SELECT pg_sleep(5);


DO $$
BEGIN
    RAISE NOTICE 'Local databases should have been created';
END $$;