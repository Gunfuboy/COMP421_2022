
WITH Temp (title, releasedate, avgrating) AS (
SELECT title, releasedate, AVG(rating) AS avgrating
FROM movies LEFT OUTER JOIN review ON movies.movid = review.movid
WHERE movies.movid IN (SELECT movid FROM moviegenres WHERE genre = 'Comedy')
AND movies.movid NOT IN (SELECT movid FROM review WHERE userid = (SELECT userid FROM users WHERE email = 'cinebuff@movieinfo.com'))
GROUP BY title, releasedate)

SELECT title, releasedate, avgrating
FROM Temp
WHERE avgrating >= (
SELECT AVG(rating)
FROM review
WHERE userid = (SELECT userid FROM users WHERE email = 'cinebuff@movieinfo.com')
AND movid IN (SELECT movid FROM moviegenres WHERE genre = 'Comedy' ))
ORDER BY avgrating DESC, releasedate, title
;