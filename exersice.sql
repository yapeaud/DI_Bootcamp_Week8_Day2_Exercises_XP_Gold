-- EXERCCISE 1

-- Découvrez combien de films il y a pour chaque rating.
SELECT rating, COUNT(*) AS num_film FROM film GROUP BY rating;

-- Obtenez une liste de tous les films classés G ou PG-13.
SELECT title FROM film WHERE (rating = 'G' OR rating = 'PG-13') AND length < 120 AND rental_rate < 3.00 ORDER BY title;

-- Recherchez un client dans la table des clients et remplacez ses coordonnées par vos coordonnées à l'aide de SQL UPDATE.
SELECT * FROM customer WHERE customer_id = 1; 

UPDATE customer SET first_name = 'Beda', last_name = 'Yapeaud', email = 'yapoabed@gmail.com' WHERE customer_id = 1; -- To update the customer's details


--Trouvez maintenant l'adresse du client et utilisez UPDATE pour remplacer l'adresse par votre adresse (ou créez-en une).
UPDATE address SET address = 'Anokoua 3', city = 'Abobo', postal_code = '915071'
WHERE address_id = (SELECT address_id FROM customer WHERE customer_id = 1); 


-- EXERCISE 2

UPDATE student SET birth_date = '1998-11-02' WHERE first_name = 'Lea' OR first_name = 'Marc';

UPDATE student SET last_name = 'Guez' WHERE first_name = 'David';

DELETE FROM student WHERE first_name = 'Lea' AND last_name = 'Benichou';

SELECT COUNT(*) AS num_students FROM student;

SELECT COUNT(*) AS num_students FROM student WHERE birth_date > '2000-01-01';

ALTER TABLE student ADD COLUMN math_grade INT;

UPDATE student SET math_grade = math_grade + 80 WHERE id = 1;

UPDATE student SET math_grade = math_grade + 90 WHERE id IN (2, 4);

UPDATE student SET math_grade = math_grade + 40 WHERE id = 6;

SELECT first_name, last_name, COUNT(*) AS total_grades FROM student WHERE math_grade > 83 GROUP BY first_name, last_name;

INSERT INTO student (first_name, last_name, birth_date, math_grade) SELECT first_name, last_name, birth_date, 70 FROM student WHERE first_name = 'Omer' AND last_name = 'Simpson';

SELECT first_name, last_name, COUNT(math_grade) AS total_grades FROM student GROUP BY first_name, last_name;

SELECT SUM(math_grade) AS total_grades FROM student;

-- EXERCISE 3

-- Part I

CREATE TABLE purchases ( id INT PRIMARY KEY, customer_id INT, item_id INT, quantity_purchased INT);

INSERT INTO purchases (customer_id, item_id, quantity_purchased) SELECT id, 2, 10 FROM customers WHERE first_name = 'Melanie' AND last_name = 'Johnson';

INSERT INTO purchases (customer_id, item_id, quantity_purchased) SELECT id, 1, 2 FROM customers WHERE first_name = 'Greg' AND last_name = 'Jones';

-- Part II

SELECT * FROM purchases;
SELECT * FROM purchases;

SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased FROM purchases INNER JOIN customers ON purchases.customer_id = customers.id INNER JOIN items ON purchases.item_id = items.id;

-- Purchases of the customer with the ID equal to 5:

SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased FROM purchases INNER JOIN customers ON purchases.customer_id = customers.id INNER JOIN items ON purchases.item_id = items.id
WHERE customers.id = 5;

-- Purchases for a large desk AND a small desk:

SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased FROM purchases INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id
WHERE items.name = 'Large Desk' OR items.name = 'Small Desk';

-- Customers who have made a purchase:

SELECT customers.first_name, customers.last_name, items.name FROM purchases INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id;

-- Adding a row which references a customer by ID, but does not reference an item by ID (leave it blank):

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (1, NULL, 1);