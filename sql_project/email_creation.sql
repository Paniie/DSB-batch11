SELECT 
	customerid,
	firstname,
	lastname,
    firstname || ' ' || lastname AS FullName,
    LOWER(firstname) || '.' || LOWER(SUBSTR(lastname, 1, 3)) || '@fullstack.com' AS email
FROM customers;
