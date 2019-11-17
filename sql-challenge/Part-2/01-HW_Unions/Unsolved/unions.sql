-- Create view
CREATE VIEW all_parties AS
SELECT first_name, last_name
FROM actor 
UNION 
SELECT first_name,last_name 
FROM customer
UNION
SELECT first_name,last_name 
FROM staff;

SELECT * FROM all_parties

--create new view 
CREATE VIEW all_customer_id AS
SELECT customer_id, first_name, last_name
	FROM customer
UNION ALL 
SELECT id, name
	FROM customer_list; 

SELECT * FROM all_customer_id 
--not the same number of columns above 
--drop view with id's
DROP VIEW all_customer_id

-- Query the view to he ID of all customers who live in the city of London
SELECT *
FROM customer
WHERE customer_id IN
  (
  SELECT customer_id
  FROM customer
  WHERE customer_id IN

  (
    SELECT id
    FROM customer_list
    WHERE id IN
      (
        SELECT id
        FROM customer_list
        WHERE city = 'London'
      
    )
  )
);

