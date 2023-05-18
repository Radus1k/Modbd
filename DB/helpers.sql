INSERT INTO administrator (id_administrator, nume_utilizator, hash_parola, nume_complet, telefon, email, cnp)
VALUES (2, 'gilbert_mccarty', 'gilbert_mccarty', 'Administrator Name', '+40 123 356 789', 'admin1@example.com', '123456780123');

-- Insert hotel_administrator association
INSERT INTO hotel_administrator (id_hotel, id_administrator)
VALUES (1000, 1);