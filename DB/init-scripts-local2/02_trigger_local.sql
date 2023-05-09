CREATE OR REPLACE FUNCTION update_pret_rezervare()
RETURNS TRIGGER
LANGUAGE PLPGSQL AS $$
DECLARE 
	v_pret_total REAL;
BEGIN
	SELECT SUM(nr_camere*pret_per_noapte)
	INTO v_pret_total
	FROM rezervare_tip_camera
	WHERE id_rezervare=NEW.id_rezervare;
	
	UPDATE rezervare
	SET pret_total=v_pret_total
	WHERE id_rezervare=NEW.id_rezervare;
	
	RETURN NEW;
END
$$;


CREATE OR REPLACE TRIGGER after_insert_on_rezervare
AFTER INSERT ON rezervare_tip_camera
FOR EACH ROW
EXECUTE PROCEDURE update_pret_rezervare();