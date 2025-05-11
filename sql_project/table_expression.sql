-- common table expression
WITH tmp AS (
  SELECT * FROM customers
	)

SELECT firstname, email, country
FROM tmp
WHERE country = 'USA'
UNION
SELECT firstname, email, country
FROM tmp
where country = 'Canada'
ORDER BY country;
