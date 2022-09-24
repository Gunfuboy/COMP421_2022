WITH number (movid, count) as (
SELECT movid, COUNT(movid)
FROM review
GROUP BY movid),

twoReview(movid, avgrating) as (
SELECT n.movid, AVG(rating)
FROM number n LEFT OUTER JOIN  review r ON n.movid = r.movid
WHERE count >= 2
GROUP BY n.movid)

SELECT title, releasedate, avgrating
FROM movies m JOIN twoReview t ON m.movid = t.movid
ORDER BY avgrating DESC, releasedate, title
;
