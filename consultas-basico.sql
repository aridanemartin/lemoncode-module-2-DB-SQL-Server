


SELECT *
FROM dbo.Track
WHERE UnitPrice >= 1;

SELECT * 
FROM dbo.Track
WHERE (Milliseconds / 60000) > 4;

SELECT * 
FROM dbo.Track
WHERE Milliseconds 
BETWEEN 120000 AND 180000;

SELECT * 
FROM dbo.Track 
WHERE Composer = 'Mercury'

SELECT AVG(Milliseconds) AS average_miliseconds
FROM dbo.Track;

SELECT *
FROM dbo.customer 
WHERE Country IN ('USA', 'Canada', 'Brazil');

SELECT  T.Name,
		AL.Title,
		A.Name
FROM dbo.Track T
INNER JOIN dbo.Album AL
	ON	T.AlbumId = AL.AlbumId
INNER JOIN dbo.Artist A 
	ON AL.ArtistId = A.ArtistId
WHERE A.Name = 'Queen'

SELECT  T.Name,
		AL.Title,
		A.Name,
		T.Composer
FROM dbo.Track T
INNER JOIN dbo.Album AL
	ON	T.AlbumId = AL.AlbumId
INNER JOIN dbo.Artist A 
	ON AL.ArtistId = A.ArtistId
WHERE A.Name = 'Queen' AND T.Composer LIKE '%David Bowie%';


SELECT *
FROM dbo.Track T
INNER JOIN dbo.PlaylistTrack PT
	ON T.TrackId = PT.TrackId
INNER JOIN dbo.Playlist P
	ON PT.PlaylistId = P.PlaylistId
WHERE P.Name = 'Heavy Metal Classic';


SELECT	P.PlaylistId,
		P.Name AS PlaylistName,
		COUNT(PT.TrackId) AS NumberOfTracks
FROM dbo.Playlist P
INNER JOIN dbo.PlaylistTrack PT
	ON PT.PlaylistId = P.PlaylistId
GROUP BY
	P.PlaylistId, P.Name


SELECT DISTINCT P.Name
FROM dbo.Playlist P
INNER JOIN dbo.PlaylistTrack PT
	ON P.PlaylistId = PT.PlaylistId
INNER JOIN dbo.Track T
	ON T.TrackId = PT.TrackId
INNER JOIN dbo.Album AL
	ON AL.AlbumId = T.AlbumId
INNER JOIN dbo.Artist AR
	ON AR.ArtistId = AL.ArtistId
WHERE AR.Name = 'AC/DC';


SELECT P.PlaylistId,
P.Name AS PlaylistWithQueenSongs,
COUNT(*) AS QueenSongs
FROM dbo.Playlist P
INNER JOIN dbo.PlaylistTrack PT
	ON P.PlaylistId = PT.PlaylistId
INNER JOIN dbo.Track T
	ON T.TrackId = PT.TrackId
INNER JOIN dbo.Album AL
	ON AL.AlbumId = T.AlbumId
INNER JOIN dbo.Artist AR
	ON AR.ArtistId = AL.ArtistId
WHERE AR.Name = 'Queen'
GROUP BY 
P.PlaylistId, P.Name;

SELECT *
FROM dbo.Track T
LEFT JOIN dbo.PlaylistTrack PT
	ON T.TrackId = PT.TrackId
WHERE PT.TrackId IS NULL;

SELECT A.Name AS ArtistsWithoutAlbum
FROM dbo.Artist A
LEFT JOIN dbo.Album AL
	ON A.ArtistId = AL.ArtistId
WHERE AL.AlbumId IS NULL;


SELECT
    A.ArtistId,
	A.Name,
    COUNT(AL.AlbumId) AS NumberOfAlbums
FROM
    dbo.Artist A
LEFT JOIN
    dbo.Album AL ON A.ArtistId = AL.ArtistId
GROUP BY
    A.ArtistId, A.Name;











	
	





	






