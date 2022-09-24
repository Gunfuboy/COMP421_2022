psql cs421 --echo-all <<-END 2>&1 | tee delNdrop.log

DROP TABLE review;
DROP TABLE moviegenres;
DROP TABLE releaselanguages;
DROP TABLE users;
DROP TABLE movies;

END
