-- JOIN clause
SELECT
	artists.ArtistId,
    artists.Name ArtistName,
    albums.Title AlbumName,
    tracks.Name Songs,
    genres.Name GenreName
FROM artists 
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.AlbumId = tracks.AlbumId
JOIN genres ON tracks.GenreId = genres.GenreId
WHERE albums.Title LIKE '%The %';

-- WHERE clause
SELECT
	  artists.ArtistId,
    artists.Name ArtistName,
    albums.Title AlbumName,
    tracks.Name Songs,
    genres.Name GenreName
FROM artists, albums, tracks, genres
WHERE artists.ArtistId = albums.ArtistId
	AND albums.AlbumId = tracks.AlbumId
  AND tracks.GenreId = genres.GenreId;
