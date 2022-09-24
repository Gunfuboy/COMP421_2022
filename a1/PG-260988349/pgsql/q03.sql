SELECT userid
FROM review JOIN movies
ON review.movid = movies.movid
WHERE title = 'Ben-Hur' AND (releasedate >= '1959-01-01' AND releasedate < '1960-01-01') AND rating >= 7

EXCEPT

SELECT userid
FROM review JOIN movies
                 ON review.movid = movies.movid
WHERE title = 'Ben-Hur' AND (releasedate >= '2016-01-01' AND releasedate < '2017-01-01') AND rating <= 4

ORDER BY userid
;
