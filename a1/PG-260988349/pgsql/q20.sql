WITH data (language, genre, count) as (
SELECT language, genre, COUNT(genre)
FROM releaselanguages r LEFT OUTER JOIN moviegenres m ON r.movid = m.movid
GROUP BY language, genre
),

maximum (language, max) as (
SELECT language, MAX(count)
FROM data
GROUP BY language)

SELECT language, genre
FROM data
WHERE count = (SELECT max FROM maximum WHERE data.language = maximum.language)
ORDER BY language, genre
;