SELECT
  p.PlaylistId,
  p.Name AS PlaylistName,
  ROUND(SUM(t.Milliseconds) / 1000.0 / 60.0 / 60.0, 2) AS LengthHours
FROM playlists p
JOIN playlist_track pt ON p.PlaylistId = pt.PlaylistId
JOIN tracks t ON pt.TrackId = t.TrackId
WHERE p.Name IS NOT NULL
  AND t.Milliseconds IS NOT NULL
GROUP BY p.PlaylistId, p.Name
HAVING (SUM(t.Milliseconds) / 1000.0 / 60.0 / 60.0) > 2
ORDER BY LengthHours DESC;
