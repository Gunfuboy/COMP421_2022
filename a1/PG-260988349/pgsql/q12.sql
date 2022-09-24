SELECT title, releasedate, COUNT(r.movid) as numreviews
FROM movies m LEFT JOIN review r ON m.movid = r.movid
WHERE releasedate >= '2021-01-01' AND releasedate < '2022-01-01'
GROUP BY title, releasedate
ORDER BY numreviews DESC,releasedate,title



