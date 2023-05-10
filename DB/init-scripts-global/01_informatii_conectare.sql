CREATE EXTENSION IF NOT EXISTS dblink;

DO $$
BEGIN
    RAISE NOTICE 'Waiting for the local databases to be created';
END $$;

SELECT pg_sleep(50);


DO $$
BEGIN
    RAISE NOTICE 'Local databases should have been created';
END $$;


CREATE OR REPLACE FUNCTION informatii_conectare_bd_asociata_rezervarii(p_id_rezervare INT)
RETURNS TEXT AS $$
DECLARE 
	v_id_hotel INT;
BEGIN
	SELECT id_hotel
	INTO v_id_hotel
	FROM rezervare
	WHERE id_hotel=p_id_rezervare;
	
	RETURN informatii_conectare_bd_asociata_hotelului(v_id_hotel);
END;	
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION informatii_conectare_bd_asociata_hotelului(p_id_hotel INT)
RETURNS TEXT AS $$
DECLARE 
	v_id_localitate INT;
BEGIN
	SELECT id_localitate
	INTO v_id_localitate
	FROM hotel
	WHERE id_localitate=p_id_hotel;
	
	RETURN informatii_conectare_bd_asociata_localitatii(v_id_localitate);
END;	
$$ LANGUAGE plpgsql;





CREATE OR REPLACE FUNCTION informatii_conectare_bd_asociata_localitatii(p_id_localitate INT)
RETURNS TEXT AS $$
DECLARE 
	v_id_judet INT;
BEGIN
	SELECT id_judet
	INTO v_id_judet
	FROM localitate
	WHERE id_localitate=p_id_localitate;
	
	RETURN informatii_conectare_bd_asociata_judetului(v_id_judet);
END;		
$$ LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION informatii_conectare_bd_asociata_judetului(p_id_judet INT)
RETURNS TEXT AS $$
DECLARE
	 v_id_regiune INT;
BEGIN
	SELECT id_regiune
	INTO v_id_regiune
	FROM judet
	WHERE id_judet=p_id_judet;
	
	RETURN informatii_conectare_bd_asociata_regiunii(v_id_regiune);
END;		
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION informatii_conectare_bd_asociata_regiunii(p_id_regiune INT)
RETURNS TEXT AS $$
BEGIN
	IF p_id_regiune IN (1,2,3,4) THEN
		RETURN informatii_conectare_bd(1);
	ELSE
		RETURN informatii_conectare_bd(2);
	END IF;
END;		
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION informatii_conectare_bd(p_nr_server INT)
RETURNS TEXT AS $$
BEGIN
	IF p_nr_server=1 THEN
		RETURN 'host=db_postgres_local1 port=5432 dbname=local1 user=postgres password=postgres';
	ELSE
		RETURN 'host=db_postgres_local2 port=5432 dbname=local2 user=postgres password=postgres';
	END IF;
END;		
$$ LANGUAGE plpgsql;
