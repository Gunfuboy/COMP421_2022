SELECT title, releasedate
FROM movies JOIN releaselanguages r on movies.movid = r.movid
WHERE r.movid = (SELECT movid FROM review WHERE movies.movid = review.movid
    GROUP BY review.movid HAVING count(movid) >= 5)
     AND language IN ('English', 'French')
GROUP BY movies.movid,releasedate,title
HAVING count(distinct language) >= 2
ORDER BY releasedate, title
;