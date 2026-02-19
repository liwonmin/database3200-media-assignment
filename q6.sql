SELECT DISTINCT ar.Name AS ArtistName
FROM playlists p
JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
JOIN tracks t ON pt.TrackId = t.TrackId
JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
JOIN albums al ON t.AlbumId = al.AlbumId
JOIN artists ar ON al.ArtistId = ar.ArtistId
WHERE p.Name IS NOT NULL
  AND mt.Name IS NOT NULL
  AND ar.Name IS NOT NULL
  AND p.Name IN ('Brazilian Music', 'Grunge')
  AND mt.Name LIKE '%MPEG%';
