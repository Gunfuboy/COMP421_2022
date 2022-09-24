SELECT distinct uname, email
FROM users , review, releaselanguages
WHERE language = 'French' AND
      review.movid NOT IN ( select movid from releaselanguages b where b.movid = review.movid AND b.language != 'French')
AND (users.userid = review.userid)
ORDER BY email
;

-- SELECT movid FROM releaselanguages a
-- WHERE language = 'French'
-- AND movid NOT IN ( select movid from releaselanguages b where b.movid = a.movid AND b.language != 'French')
--
-- ;