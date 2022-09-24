SELECT title, releasedate
FROM movies JOIN releaselanguages
ON movies.movid = releaselanguages.movid
WHERE language = 'French'

EXCEPT

SELECT title, releasedate
FROM movies JOIN releaselanguages
                 ON movies.movid = releaselanguages.movid
WHERE language = 'English'

ORDER BY releasedate, title
