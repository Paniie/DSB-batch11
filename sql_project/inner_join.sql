SELECT 
	A.ArtistId artistID,
    A.Name artistName,
    B.title albumName
FROM artists A JOIN albums B
ON A.ArtistId = B.ArtistId -- PK = FK
WHERE A.name LIKE 'C%'
    AND B.title LIKE 'C%'; -- pattern matching
