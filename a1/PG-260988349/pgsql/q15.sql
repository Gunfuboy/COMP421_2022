SELECT title, COUNT(r.movid) as numreviews
FROM movies LEFT OUTER JOIN review r on movies.movid = r.movid
WHERE releasedate = (SELECT MAX(releasedate)
                     FROM movies)
GROUP BY title
ORDER BY title
;

