INSERT INTO administrator (id_administrator, nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
VALUES (1, 'admin_username', 'admin_password', 'Administrator Name', '+40 123 456 789', 'admin@example.com', '1234567890123');

-- Insert hotel_administrator association
INSERT INTO hotel_administrator (id_hotel, id_administrator)
VALUES (999, 1);