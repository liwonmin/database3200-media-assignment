SELECT DISTINCT ar.Name
FROM albums a
JOIN artists ar ON a.ArtistId = ar.ArtistId
WHERE a.Title IS NOT NULL
  AND ar.Name IS NOT NULL
  AND LOWER(a.Title) LIKE '%symphony%';
