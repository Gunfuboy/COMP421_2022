
SELECT title, releasedate, language
 FROM movies JOIN releaselanguages r on movies.movid = r.movid
 WHERE language = 'French'
    OR language = 'Italian'
ORDER BY releasedate, title;



