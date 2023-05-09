

CREATE OR REPLACE PROCEDURE insereaza_in_hotel(p_nume TEXT,
											  p_nr_stele INT,
											  p_adresa TEXT,
											  p_id_localitate INT,
											  p_are_mic_dejun_inclus BOOL,
											  p_are_piscina BOOL)
LANGUAGE plpgsql AS $$
	DECLARE
		v_nr_server INT;
		v_id_hotel INT;
	BEGIN
		v_nr_server:=server_asociat_localitatii(p_id_localitate);
		IF v_nr_server=1 THEN
			v_id_hotel:=NEXTVAL('hotel_serv1_seq');
		ELSE
			V_id_hotel:=NEXTVAL('hotel_serv2_seq');
		END IF;
		INSERT INTO hotel(nume,nr_stele,adresa,id_localitate,are_mic_dejun_inclus,are_piscina)
		VALUES(p_nume,
			  p_nr_stele ,
			  p_adresa ,
			  p_id_localitate ,
			  p_are_mic_dejun_inclus ,
			  p_are_piscina );
	END;
$$;

CREATE OR REPLACE PROCEDURE insereaza_in_recenzie(p_id_client INT,
												 p_id_hotel INT,
												 p_scor INT,
												 p_text_recenzie TEXT)
LANGUAGE plpgsql AS $$
DECLARE
	v_id_recenzie INT;
	v_nr_server INT;
BEGIN
	v_nr_server:=server_asociat_hotelului(p_id_hotel);
	IF v_nr_server=1 THEN
		v_id_recenzie:=NEXTVAL('recenzie_serv1_seq');
	ELSE
		V_id_recenzie:=NEXTVAL('recenzie_serv2_seq');
	END IF;
	INSERT INTO recenzie(id_recenzie,id_client,id_hotel,scor,text_recenzie)
	VALUES(v_id_recenzie,
		 p_id_client ,
		 p_id_hotel ,
		 p_scor ,
		 p_text_recenzie );
END;
$$;

CREATE OR REPLACE PROCEDURE insereaza_in_rezervare(p_id_client INT,
												 p_id_hotel INT,
												 p_scor INT,
												 p_text_rezervare TEXT)
LANGUAGE plpgsql AS $$
DECLARE
	v_id_rezervare INT;
	v_nr_server INT;
BEGIN
	v_nr_server:=server_asociat_hotelului(p_id_hotel);
	IF v_nr_server=1 THEN
		v_id_rezervare:=NEXTVAL('rezervare_serv1_seq');
	ELSE
		V_id_rezervare:=NEXTVAL('rezervare_serv2_seq');
	END IF;
	INSERT INTO rezervare(id_rezervare,id_client,id_hotel,scor,text_rezervare)
	VALUES(v_id_rezervare,
		 p_id_client ,
		 p_id_hotel ,
		 p_scor ,
		 p_text_rezervare );
END;
$$;

CREATE OR REPLACE PROCEDURE insereaza_in_rezervare(
    p_id_client INT,
    p_id_hotel INT,
    p_data_efectuarii DATE,
    p_data_inceput DATE,
    p_data_sfarsit DATE,
    p_pret_total REAL,
    p_specificatii TEXT)
LANGUAGE plpgsql AS $$
DECLARE
    v_id_rezervare INT;
    v_nr_server INT;
BEGIN
    v_nr_server:=server_asociat_hotelului(p_id_hotel);
    IF v_nr_server=1 THEN
        v_id_rezervare:=NEXTVAL('rezervare_serv1_seq');
    ELSE
        v_id_rezervare:=NEXTVAL('rezervare_serv2_seq');
    END IF;
    INSERT INTO rezervare(
        id_rezervare,
        id_client,
        id_hotel,
        data_efectuarii,
        data_inceput,
        data_sfarsit,
        pret_total,
        specificatii)
    VALUES(
        v_id_rezervare,
        p_id_client,
        p_id_hotel,
        p_data_efectuarii,
        p_data_inceput,
        p_data_sfarsit,
        p_pret_total,
        p_specificatii);
END;
$$;


CREATE OR REPLACE FUNCTION server_asociat_hotelului(p_id_hotel BIGINT)
RETURNS SMALLINT AS $$
DECLARE 
	v_id_localitate INT;
BEGIN
	SELECT id_localitate
	INTO v_id_localitate
	FROM hotel
	WHERE id_localitate=p_id_localitate;
	
	RETURN server_asociat_localitatii(v_id_localitate);
END;	
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION server_asociat_localitatii(p_id_localitate BIGINT)
RETURNS SMALLINT AS $$
DECLARE 
	v_id_judet INT;
BEGIN
	SELECT id_judet
	INTO v_id_judet
	FROM localitate
	WHERE id_localitate=p_id_localitate;
	
	RETURN server_asociat_judetului(v_id_judet);
END;		
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION server_asociat_judetului(p_id_judet BIGINT)
RETURNS SMALLINT AS $$
DECLARE
	 v_id_regiune INT;
BEGIN
	SELECT id_regiune
	INTO v_id_regiune
	FROM judet
	WHERE id_judet=p_id_judet;
	
	IF v_id_regiune IN (1,2,3,4) THEN
		RETURN 1;
	ELSE
		RETURN 2;
	END IF;
END;		
$$ LANGUAGE plpgsql;


-- CREATE OR REPLACE FUNCTION gaseste_id_localitate_cu_nume_si_nume_judet(p_nume TEXT, p_nume_judet TEXT)
-- RETURNS BIGINT AS $$
-- DECLARE 
-- 	v_id BIGINT;
-- BEGIN
-- 	SELECT id_localitate
-- 	INTO v_id
-- 	FROM localitate
-- 	WHERE localitate.nume=p_nume AND judet.nume=p_nume_judet;
--  	RETURN v_id;
-- END;
-- $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gaseste_id_localitate_cu_nume_si_nume_judet(p_nume TEXT, p_nume_judet TEXT)
RETURNS BIGINT AS $$
DECLARE 
	v_id BIGINT;
BEGIN
	SELECT l.id_localitate
	INTO v_id
	FROM localitate l
	INNER JOIN judet j ON l.id_judet = j.id_judet
	WHERE l.nume = p_nume AND j.nume = p_nume_judet;
 	RETURN v_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION gaseste_id_judet_cu_nume(p_nume TEXT, p_nume_judet TEXT)
RETURNS BIGINT AS $$
DECLARE 
	v_id BIGINT;
BEGIN
	SELECT id_judet
	INTO v_id
	FROM judet
	WHERE judet.nume=p_nume;
 	RETURN v_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION gaseste_id_regiune_cu_nume(p_nume TEXT, p_nume_judet TEXT)
RETURNS BIGINT AS $$
DECLARE 
	v_id BIGINT;
BEGIN
	SELECT id_regiune
	INTO v_id
	FROM regiune
	WHERE regiune.nume=p_nume;
 	RETURN v_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE PROCEDURE insereaza_in_localitate(
    p_nume TEXT, 
    p_id_judet INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_id_localitate INT;
	v_nr_server INT;
BEGIN
    v_nr_server:=server_asociat_judetului(p_id_judet);
	IF v_nr_server=1 THEN
		v_id_localitate:=NEXTVAL('localitate_serv1_seq');
	ELSE
		V_id_localitate:=NEXTVAL('localitate_serv2_seq');
	END IF;
    INSERT INTO localitate(nume, id_judet)
    VALUES(p_nume, p_id_judet);
END;
$$;
