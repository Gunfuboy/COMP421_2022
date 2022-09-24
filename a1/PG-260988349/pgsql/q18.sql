WITH cinebuff(average, genre) as (SELECT AVG(rating), genre
FROM review JOIN moviegenres m on review.movid = m.movid
WHERE userid = (SELECT userid FROM users WHERE email = 'cinebuff@movieinfo.com')
GROUP BY genre)
SELECT genre
FROM cinebuff
WHERE average = (SELECT MAX(average) FROM cinebuff)
ORDER BY genre
;