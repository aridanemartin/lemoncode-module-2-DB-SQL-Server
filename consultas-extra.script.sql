SELECT  
T.TrackId,
T.Name,
COUNT(PT.PlaylistId) as numberOfPlaylist	
FROM dbo.Track T
INNER JOIN dbo.PlaylistTrack PT
	ON T.TrackId = PT.TrackId
GROUP BY
T.TrackId, T.Name
ORDER BY
numberOfPlaylist DESC


SELECT 
T.TrackId,
T.Name,
COUNT(IL.InvoiceId) AS numberOfPurchases
FROM dbo.Track T
INNER JOIN dbo.InvoiceLine IL
	ON IL.TrackId = T.TrackId
GROUP BY
T.TrackId,
T.Name
ORDER BY numberOfPurchases DESC;


SELECT AR.Name,
COUNT(IL.InvoiceLineId) AS purchasesByArtist
FROM dbo.Artist AR
INNER JOIN dbo.Album AL
	ON AR.ArtistId = AL.ArtistId
INNER JOIN dbo.Track T
	ON AL.AlbumId = T.TrackId
INNER JOIN dbo.InvoiceLine IL
	ON T.TrackId = IL.TrackId
GROUP BY 
AR.Name
ORDER BY purchasesByArtist DESC


SELECT *
FROM dbo.Track T
LEFT JOIN dbo.InvoiceLine IL
	ON T.TrackId = IL.TrackId
WHERE IL.InvoiceLineId IS NULL;


SELECT AR.name
FROM dbo.Artist AR
LEFT JOIN dbo.Album AL
	ON AR.ArtistId = AL.ArtistId
LEFT JOIN dbo.Track T
	ON AL.AlbumId = T.TrackId
LEFT JOIN dbo.InvoiceLine IL
	ON T.TrackId = IL.TrackId
GROUP BY AR.Name HAVING COUNT(il.InvoiceId) = 0;














	
	





	






