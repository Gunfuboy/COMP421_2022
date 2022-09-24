
WITH before (average, movid) as (
SELECT AVG(rating), movid
FROM review
WHERE (reviewdate < '2019-01-01')
GROUP BY movid),

starting (average, movid) as (
SELECT AVG(rating), m.movid
FROM movies m LEFT JOIN review r on m.movid = r.movid
WHERE (reviewdate >= '2019-01-01')
GROUP BY m.movid)

SELECT title, releasedate
FROM movies
WHERE movid IN (SELECT movid FROM before WHERE average >= 7)
AND (movid IN (SELECT movid FROM starting WHERE average <= 5)
OR movid NOT IN (SELECT movid FROM starting))
;
