CREATE OR REPLACE FUNCTION gaseste_id_localitate_cu_nume_si_nume_judet(p_nume TEXT, p_nume_judet TEXT)
RETURNS INT AS $$
DECLARE 
	v_id INT;
BEGIN
	SELECT id_localitate
	INTO v_id
	FROM localitate JOIN judet
	USING(id_judet)
	WHERE localitate.nume=p_nume AND judet.nume=p_nume_judet;
 	RETURN v_id;
END;
$$ LANGUAGE plpgsql;





CREATE OR REPLACE FUNCTION gaseste_id_judet_cu_nume(p_nume TEXT)
RETURNS INT AS $$
DECLARE 
	v_id INT;
BEGIN
	SELECT id_judet
	INTO v_id
	FROM judet
	WHERE judet.nume=p_nume;
 	RETURN v_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION gaseste_id_regiune_cu_nume(p_nume TEXT)
RETURNS INT AS $$
DECLARE 
	v_id INT;
BEGIN
	SELECT id_regiune
	INTO v_id
	FROM regiune
	WHERE regiune.nume=p_nume;
 	RETURN v_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION gaseste_id_client_cu_nume_utilizator(p_nume_utilizator TEXT)
RETURNS INT AS $$
DECLARE
    v_id_client INT;
BEGIN
    SELECT id_client INTO v_id_client FROM client WHERE nume_utilizator = p_nume_utilizator;
    RETURN v_id_client;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION gaseste_id_hotel_cu_nume_si_id_localitate(p_nume TEXT, p_id_localitate INT)
RETURNS INT AS $$
DECLARE
    v_id_hotel INT;
BEGIN
    SELECT id_hotel INTO v_id_hotel
    FROM hotel
    WHERE nume = p_nume AND id_localitate = p_id_localitate;
    
    RETURN v_id_hotel;
END;
$$ LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION gaseste_id_rezervare_cu_id_client_si_id_hotel_si_data_efectuari(p_id_client INTEGER, p_id_hotel INTEGER, p_data_efectuarii DATE)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_id_rezervare INTEGER;
BEGIN
    SELECT id_rezervare INTO v_id_rezervare 
    FROM rezervare 
    WHERE id_client = p_id_client AND id_hotel = p_id_hotel AND data_efectuarii = p_data_efectuarii;
    
    RETURN v_id_rezervare;
END;
$$;