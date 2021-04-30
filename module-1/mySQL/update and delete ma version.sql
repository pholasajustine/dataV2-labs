USE lab_mysql;
UPDATE customers
SET email = 'ppicasso@gmail.com'
WHERE customer_name = 'Pablo Picasso';
UPDATE customers
SET email = 'lincoln@us.gov'
WHERE customer_name = 'Abraham Lincoln';
UPDATE customers
SET email = 'hello@napoleon.me'
WHERE customer_name = 'Napoléon Bonaparte';
SELECT *
FROM cars;
DELETE FROM cars
WHERE vehicle_identification_number is null;