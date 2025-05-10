-- WHERE clause
SELECT 
	A.name AS genreName,
    COUNT(B.Name) AS N_Track
FROM genres A, tracks B
WHERE A.GenreId = B.GenreId
GROUP BY A.name
ORDER BY N_Track DESC;
-- JOIN clause
SELECT 
	A.name AS genreName,
    COUNT(B.Name) AS N_Track
FROM genres A
JOIN tracks B ON A.GenreId = B.GenreId
GROUP BY A.name
ORDER BY N_Track DESC;
-- Filter only TOP 5 
SELECT 
	A.name AS genreName,
    COUNT(B.Name) AS N_Track
FROM genres A
JOIN tracks B ON A.GenreId = B.GenreId
GROUP BY A.name
ORDER BY N_Track DESC
LIMIT 5;
