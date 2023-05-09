CREATE OR REPLACE PROCEDURE insereaza_in_regiune(
	p_id_regiune INT,
    p_nume TEXT 
)
LANGUAGE plpgsql AS $$
DECLARE
	v_informatii_conectare TEXT;
	v_status_conectare TEXT;
BEGIN
	v_informatii_conectare:= informatii_conectare_bd_asociata_regiunii(p_id_regiune);
	SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;

	IF v_status_conectare NOT LIKE 'OK' THEN
		RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
	END IF;

    PERFORM dblink_exec('local','INSERT INTO regiune(id_regiune,nume)
						VALUES(' || p_id_regiune || ', ''' || p_nume || '''); COMMIT;');
	PERFORM dblink_disconnect('local');
END;
$$;


CREATE OR REPLACE PROCEDURE insereaza_in_judet(
    p_nume TEXT, 
    p_id_regiune INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_id_judet INT;
	v_informatii_conectare TEXT;
	v_status_conectare TEXT;
BEGIN
	v_informatii_conectare:= informatii_conectare_bd_asociata_regiunii(p_id_regiune);
	SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;

	IF v_status_conectare NOT LIKE 'OK' THEN
		RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
	END IF;

	IF position('dbname=local1' in v_informatii_conectare)>0 THEN
		v_id_judet:=NEXTVAL('judet_serv1_seq');
	ELSE
		v_id_judet:=NEXTVAL('judet_serv2_seq');
	END IF;
    PERFORM dblink_exec('local','INSERT INTO judet(id_judet, nume, id_regiune)
						VALUES(' || v_id_judet || ', ''' || p_nume || ''', ' || p_id_regiune || '); COMMIT;');
	PERFORM dblink_disconnect('local');
END;
$$;

CREATE OR REPLACE PROCEDURE insereaza_in_localitate(
    p_nume TEXT, 
    p_id_judet INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_id_localitate INT;
	v_informatii_conectare TEXT;
	v_status_conectare TEXT;
BEGIN
	v_informatii_conectare:= informatii_conectare_bd_asociata_judetului(p_id_judet);
	SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;

	IF v_status_conectare NOT LIKE 'OK' THEN
		RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
	END IF;

	IF position('dbname=local1' in v_informatii_conectare)>0 THEN
		v_id_localitate:=NEXTVAL('localitate_serv1_seq');
	ELSE
		v_id_localitate:=NEXTVAL('localitate_serv2_seq');
	END IF;
    PERFORM dblink_exec('local','INSERT INTO localitate(id_localitate, nume, id_judet)
						VALUES(' || v_id_localitate || ', ''' || p_nume || ''', ' || p_id_judet || '); COMMIT;');
	PERFORM dblink_disconnect('local');
END;
$$;





CREATE OR REPLACE PROCEDURE insereaza_in_hotel(p_nume TEXT,
											  p_nr_stele INT,
											  p_adresa TEXT,
											  p_id_localitate INT)

LANGUAGE plpgsql AS $$
	DECLARE
		v_informatii_conectare TEXT;
		v_id_hotel INT;
		v_status_conectare TEXT;
	BEGIN
		v_informatii_conectare:= informatii_conectare_bd_asociata_localitatii(p_id_localitate);
		SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;
		
		IF v_status_conectare NOT LIKE 'OK' THEN
			RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
		END IF;
		
		IF position('dbname=local1' in v_informatii_conectare)>0 THEN
			v_id_hotel:=NEXTVAL('hotel_serv1_seq');
		ELSE
			v_id_hotel:=NEXTVAL('hotel_serv2_seq');
		END IF;
		
		PERFORM dblink_exec('local','INSERT INTO hotel(id_hotel,nume,nr_stele,adresa,id_localitate) 
		VALUES(' || v_id_hotel || ', ''' || p_nume || ''', ' || p_nr_stele || ', ''' || p_adresa || ''', ' || p_id_localitate ||  '); COMMIT;');
		PERFORM dblink_disconnect('local');
	END;
$$;
--SELECT blink_disconnect('local');
--CALL insereaza_in_hotel('Hotel Privo'::TEXT,4,'Strada Principala, nr 106'::TEXT,gaseste_id_localitate_cu_nume_si_nume_judet('Targu Mures','Mures')::INT);
--SELECT * FROM hotel;


	
		
CREATE OR REPLACE PROCEDURE insereaza_in_recenzie(p_id_client INT,
												 p_id_hotel INT,
												 p_scor INT,
												 p_text_recenzie TEXT)
LANGUAGE plpgsql AS $$
DECLARE
	v_id_recenzie INT;
	v_informatii_conectare TEXT;
	v_status_conectare TEXT;
BEGIN
	v_informatii_conectare:= informatii_conectare_bd_asociata_hotelului(p_id_hotel);
	SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;

	IF v_status_conectare NOT LIKE 'OK' THEN
		RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
	END IF;

	IF position('dbname=local1' in v_informatii_conectare)>0 THEN
		v_id_recenzie:=NEXTVAL('recenzie_serv1_seq');
	ELSE
		v_id_recenzie:=NEXTVAL('recenzie_serv2_seq');
	END IF;
	
	PERFORM dblink_exec('local','INSERT INTO recenzie(id_recenzie,id_client,id_hotel,scor,text_recenzie) 
						VALUES(' || v_id_recenzie || ', ' || p_id_client || ', ' || p_id_hotel || ', ' || p_scor || ', ''' || p_text_recenzie || '''); COMMIT;');
	PERFORM dblink_disconnect('local');
END;
$$;





CREATE OR REPLACE PROCEDURE insereaza_in_rezervare(
    p_id_client INT,
    p_id_hotel INT,
    p_data_efectuarii DATE,
    p_data_inceput DATE,
    p_data_sfarsit DATE)
LANGUAGE plpgsql AS $$
DECLARE
    v_id_rezervare INT;
    v_informatii_conectare TEXT;
	v_string_data_efectuarii CHAR(10);
	v_string_data_inceput CHAR(10);
	v_string_data_sfarsit CHAR(10);
	v_status_conectare TEXT;
BEGIN
    v_informatii_conectare:= informatii_conectare_bd_asociata_hotelului(p_id_hotel);
	SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;
	IF v_status_conectare NOT LIKE 'OK' THEN
		RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
	END IF;

	IF position('dbname=local1' in v_informatii_conectare)>0 THEN
		v_id_rezervare:=NEXTVAL('rezervare_serv1_seq');
	ELSE
		v_id_rezervare:=NEXTVAL('rezervare_serv2_seq');
	END IF;
	
	v_string_data_efectuarii:=TO_CHAR(p_data_efectuarii,'DD-MM-YYYY');
	v_string_data_inceput:=TO_CHAR(p_data_inceput,'DD-MM-YYYY');
	v_string_data_sfarsit:=TO_CHAR(p_data_sfarsit,'DD-MM-YYYY');
	PERFORM dblink_exec('local','INSERT INTO rezervare(id_rezervare,id_client,id_hotel,data_efectuarii,data_inceput,data_sfarsit) 
						VALUES(' || v_id_rezervare || ', ' || p_id_client || ', ' || p_id_hotel || ', TO_DATE(''' || v_string_data_efectuarii || ''',''DD-MM-YYYY''), TO_DATE(''' || v_string_data_inceput || ''',''DD-MM-YYYY''), TO_DATE(''' || v_string_data_sfarsit || ''',''DD-MM-YYYY'')); COMMIT;');
	PERFORM dblink_disconnect('local');
END;
$$;
--SELECT dblink_disconnect('local');
--CALL insereaza_in_rezervare(1,1222,CURRENT_DATE,TO_DATE('11-AUG-2023', 'DD-MON-YYYY'), TO_DATE('22-AUG-2023', 'DD-MON-YYYY'));




CREATE OR REPLACE PROCEDURE insereaza_in_hotel_tip_camera(
	p_id_hotel INT,
    p_id_tip_camera INT,
	p_nr_camere INT,
	p_pret_per_noapte REAL
)
LANGUAGE plpgsql AS $$
DECLARE
	v_informatii_conectare TEXT;
	v_status_conectare TEXT;
BEGIN
	v_informatii_conectare:= informatii_conectare_bd_asociata_hotelului(p_id_hotel);
	SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;

	IF v_status_conectare NOT LIKE 'OK' THEN
		RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
	END IF;

    PERFORM dblink_exec('local','INSERT INTO hotel_tip_camera(id_hotel,id_tip_camera,nr_camere,pret_per_noapte)
						VALUES(' || p_id_hotel || ', ' || p_id_tip_camera || ', ' || p_nr_camere || ', ' || p_pret_per_noapte || '); COMMIT;');
	PERFORM dblink_disconnect('local');
END;
$$;
--SELECT dblink_disconnect('local');
--CALL insereaza_in_hotel_tip_camera(1222,1,20,250);
--SELECT * FROM hotel_tip_camera;





CREATE OR REPLACE PROCEDURE insereaza_in_rezervare_tip_camera(p_id_rezervare INT,
															 p_id_tip_camera INT,
															 p_nr_camere INT)
LANGUAGE plpgsql AS $$
DECLARE 
	v_pret_tip_camera_la_hotelul_rezervarii REAL;
	v_informatii_conectare TEXT;
	v_status_conectare TEXT;
BEGIN
	v_informatii_conectare:= informatii_conectare_bd_asociata_rezervarii(p_id_rezervare);
	SELECT dblink_connect('local',v_informatii_conectare) INTO v_status_conectare;
	RAISE NOTICE 'v_informatii_conectare:%',v_informatii_conectare;
	IF v_status_conectare NOT LIKE 'OK' THEN
		RAISE 'EROARE! Nu s-a putut face conexiunea la serverul local.' USING ERRCODE = 'unique_violation';
	END IF;
	
	SELECT pret_per_noapte
	INTO v_pret_tip_camera_la_hotelul_rezervarii 
	FROM rezervare JOIN hotel
	USING(id_hotel)
	JOIN hotel_tip_camera 
	USING (id_hotel)
	WHERE id_rezervare=p_id_rezervare AND id_tip_camera=p_id_tip_camera;
	
	PERFORM dblink_exec('local','INSERT INTO rezervare_tip_camera(id_rezervare,id_tip_camera,nr_camere,pret_per_noapte)
						VALUES(' || p_id_rezervare || ', ' || p_id_tip_camera || ', ' || p_nr_camere || ', ' || v_pret_tip_camera_la_hotelul_rezervarii || '); COMMIT;');
	PERFORM dblink_disconnect('local');
END;
$$;
--SELECT dblink_disconnect('local');
--SELECT * FROM rezervare;
--CALL insereaza_in_rezervare_tip_camera(1028,1,1);
--SELECT * FROM rezervare_tip_camera;