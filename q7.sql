SELECT COUNT(*) AS NumArtists
FROM (
  SELECT ar.ArtistId
  FROM artists ar
  JOIN albums al ON ar.ArtistId = al.ArtistId
  JOIN tracks t ON al.AlbumId = t.AlbumId
  JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
  WHERE ar.ArtistId IS NOT NULL
    AND mt.Name IS NOT NULL
    AND mt.Name LIKE '%MPEG%'
  GROUP BY ar.ArtistId
  HAVING COUNT(t.TrackId) >= 10
) AS ArtistWith10Mpeg;
