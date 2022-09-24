SELECT title, releasedate, rating
FROM movies, review
WHERE userid = (SELECT userid FROM users WHERE email = 'talkiesdude@movieinfo.com')
ORDER BY rating DESC, releasedate, title
;
