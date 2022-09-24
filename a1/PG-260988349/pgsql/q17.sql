
-- -- CINEBUFF REVIEWED MOVIE
WITH cinebuff (rating, movid) as (SELECT rating, movid
FROM review
WHERE movid IN (SELECT movid WHERE userid = (SELECT userid FROM users WHERE email = 'cinebuff@movieinfo.com'))
ORDER BY movid)

SELECT distinct email
FROM users u RIGHT OUTER JOIN review r on u.userid = r.userid
WHERE movid IN (SELECT movid FROM cinebuff)
AND rating IN (SELECT c.rating FROM cinebuff c JOIN review r ON r.movid = c.movid WHERE
    ABS(c.rating - r.rating) <= 1)
AND email != 'cinebuff@movieinfo.com'

ORDER BY email
;