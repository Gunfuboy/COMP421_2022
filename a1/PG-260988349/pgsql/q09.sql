SELECT COUNT(genre) AS nummovies
FROM movies JOIN moviegenres m ON movies.movid = m.movid
WHERE m.genre = 'Comedy' AND (releasedate >= '2021-01-01' AND releasedate < '2022-01-01')
;