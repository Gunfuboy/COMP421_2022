SELECT title, releasedate, movid
FROM movies
WHERE movid = (SELECT movid FROM review WHERE
    review.movid = movies.movid GROUP BY movid HAVING count(review.movid) < 2)

UNION

SELECT title, releasedate, movid
FROM movies
WHERE movid = (SELECT movid FROM movies WHERE movid NOT IN (SELECT movid FROM review))

ORDER BY releasedate, title
;
