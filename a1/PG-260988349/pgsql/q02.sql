SELECT userid
FROM review
WHERE movid = (SELECT movid FROM movies WHERE title = 'Casablanca')
ORDER BY userid
;