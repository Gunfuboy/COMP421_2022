WITH number (movid, count) as (
SELECT movid, COUNT(movid)
FROM review
GROUP BY movid),

maximum (max) as (
SELECT MAX(count)
FROM number)

SELECT title, releasedate
FROM movies
WHERE movid IN (SELECT movid FROM number WHERE count IN (SELECT max FROM maximum))
ORDER BY releasedate, title
;
