SELECT title, releasedate, movies.movid
FROM movies  JOIN moviegenres
ON movies.movid = moviegenres.movid
WHERE (releasedate >= '2021-01-01' AND releasedate < '2022-01-01')
AND (genre IN ('Comedy', 'Sci-Fi'))
GROUP BY movies.movid,releasedate,title
HAVING count(distinct genre) = 2
ORDER BY releasedate, title
;