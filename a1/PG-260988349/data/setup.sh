#!/bin/bash

BASEDIR=`eval basename $(dirname $PWD)`

if [[ $BASEDIR == 'PG-342567987' ]] || [[ $BASEDIR == 'PG-XXXXXXXXX' ]]
then
	echo "Fatal error !! Please rename your directory $BASEDIR to include your student id as per the instructions given with the assignment!"
	exit 1
fi

if ! [[ $BASEDIR =~ PG-[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9] ]]
then
	echo "Fatal error !! Please rename your directory $BASEDIR to include your student id as per the instructions given with the assignment!"
	exit 1
fi

psql cs421 --echo-all <<-END 2>&1 | tee setup.log

CREATE TABLE movies
(
  movid       INTEGER      NOT NULL
 ,title       VARCHAR(50)  NOT NULL
 ,country     VARCHAR(30)  NOT NULL
 ,duration    INTEGER      NOT NULL
 ,releasedate DATE         NOT NULL
 ,description VARCHAR(150) NOT NULL
 ,UNIQUE(title,releasedate)
 ,PRIMARY KEY(movid)
);

CREATE TABLE users
(
  userid      VARCHAR(20) NOT NULL
 ,uname       VARCHAR(50) NOT NULL
 ,email       VARCHAR(75) NOT NULL UNIQUE
 ,dateofbirth DATE
 ,PRIMARY KEY(userid)
);

CREATE TABLE releaselanguages
(
  movid    INTEGER     NOT NULL
 ,language VARCHAR(20) NOT NULL
 ,FOREIGN KEY(movid) REFERENCES movies(movid)
 ,PRIMARY KEY(movid, language)
);

CREATE TABLE moviegenres
(
  movid    INTEGER     NOT NULL
 ,genre    VARCHAR(20) NOT NULL
 ,FOREIGN KEY(movid) REFERENCES movies(movid)
 ,PRIMARY KEY(movid, genre)
);

CREATE TABLE review
(
 userid      VARCHAR(20)   NOT NULL
 ,movid      INTEGER       NOT NULL
 ,reviewdate DATE          NOT NULL
 ,rating     INTEGER       NOT NULL
 ,reviewtxt  VARCHAR(2000)
 ,FOREIGN KEY(movid) REFERENCES movies(movid)
 ,FOREIGN KEY(userid) REFERENCES users(userid)
 ,PRIMARY KEY(movid, userid)
);

INSERT INTO movies(movid, title, country, duration, releasedate, description) VALUES
 (1001, 'Casablanca', 'United States', 102, DATE'1942-11-26', '')
,(1002, 'Ben-Hur', 'United States', 212, DATE'1959-11-18', '')
,(1003, 'Luca', 'United States', 95, DATE'2021-06-18', '')
,(1004, 'The Dig', 'United Kingdom', 112, DATE'2021-01-29', '')
,(1005, 'Ben-Hur', 'United States', 123, DATE'2016-08-19', '')
,(1006, 'Psycho Goreman', 'Canada', 95, DATE'2021-01-22', '')
,(1007, 'The Tomorrow War', 'United States', 138, DATE'2021-07-02', '')
,(1008, 'Space Jam: A New Legacy', 'United States', 115, DATE'2021-07-16', '')
,(1009, 'Les maitres du temps', 'France', 78, DATE'1984-07-20', '')
,(1010, 'Gandahar', 'France', 78, DATE'1989-09-20', '')
,(1011, 'Under the Tuscan Sun', 'United States', 113, DATE'2003-09-26', '')
,(1012, 'Life Is Beautiful', 'Italy', 116, DATE'1997-12-20', '')
,(1013, 'Pig', 'United Kingdom', 92, DATE'2021-07-16', '')
,(1014, 'The Rocky Horror Picture Show', 'United Kingdom', 100, DATE'1975-08-31', '')
;

INSERT INTO releaselanguages(movid, language) VALUES
 (1001, 'English')
,(1001, 'French')
,(1001, 'German')
,(1001, 'Italian')
,(1002, 'English')
,(1003, 'English')
,(1003, 'Italian')
,(1004, 'English')
,(1005, 'English')
,(1005, 'Persian')
,(1005, 'Greek')
,(1005, 'Arabic')
,(1005, 'Latin')
,(1006, 'English')
,(1007, 'English')
,(1008, 'English')
,(1009, 'French')
,(1010, 'French')
,(1011, 'English')
,(1011, 'Italian')
,(1011, 'Polish')
,(1011, 'French')
,(1011, 'Spanish')
,(1011, 'German')
,(1012, 'Italian')
,(1012, 'German')
,(1012, 'English')
,(1013, 'English')
,(1014, 'English')
;

INSERT INTO moviegenres(movid, genre) VALUES
 (1001, 'Drama')
,(1002, 'Romance')
,(1002, 'War')
,(1002, 'Adventure')
,(1002, 'Drama')
,(1002, 'History')
,(1003, 'Animation')
,(1003, 'Adventure')
,(1003, 'Comedy')
,(1003, 'Family')
,(1003, 'Fantasy')
,(1004, 'Biography')
,(1004, 'Drama')
,(1004, 'History')
,(1005, 'Action')
,(1005, 'Adventure')
,(1005, 'Drama')
,(1005, 'History')
,(1006, 'Comedy')
,(1006, 'Horror')
,(1006, 'Sci-Fi')
,(1007, 'Action')
,(1007, 'Adventure')
,(1007, 'Drama')
,(1007, 'Sci-Fi')
,(1007, 'Thriller')
,(1008, 'Animation')
,(1008, 'Adventure')
,(1008, 'Comedy')
,(1008, 'Family')
,(1008, 'Fantasy')
,(1008, 'Sci-Fi')
,(1008, 'Sport')
,(1009, 'Animation')
,(1009, 'Adventure')
,(1009, 'Sci-Fi')
,(1010, 'Animation')
,(1010, 'Adventure')
,(1010, 'Fantasy')
,(1010, 'Sci-Fi')
,(1011, 'Comedy')
,(1011, 'Drama')
,(1011, 'Romance')
,(1012, 'Comedy')
,(1012, 'Drama')
,(1012, 'Romance')
,(1012, 'War')
,(1013, 'Drama')
,(1013, 'Thriller')
,(1014, 'Comedy')
,(1014, 'Musical')
;

INSERT INTO users(userid, uname, email, dateofbirth) VALUES
 ('jack23ss', 'Jack Kessler', 'kjack@movieinfo.com', DATE'1982-04-22')
,('veronica4', 'Veronica Burn', 'vburn33@movieinfo.com', DATE'1986-06-11')
,('jill33', 'Jill Lega', 'lega2@movieinfo.com', DATE'1976-02-01')
,('lillian56', 'Elizabeth Petri', 'eli22@movieinfo.com', DATE'1981-02-16')
,('jbasil', 'Jamie Basil', 'basil9@movieinfo.com', DATE'1996-01-04')
,('pdueller', 'Penny Drego', 'cinebuff@movieinfo.com', DATE'1983-07-08')
,('tdude', 'Amir Dessan', 'talkiesdude@movieinfo.com', DATE'1985-02-13')
,('melpop', 'Melanie Sears', 'mesk34@movieinfo.com', DATE'1982-12-19')
,('rabbit9', 'Robert Hall', 'rhall9@movieinfo.com', DATE'1974-11-29')
,('movgirl', 'Jane Roe', 'jane888@movieinfo.com', DATE'1988-01-09')
;

INSERT INTO review(userid, movid, reviewdate, rating, reviewtxt)VALUES
 ('jack23ss', 1001, DATE'2018-03-22', 7, '')
,('jack23ss', 1002, DATE'2010-11-12', 9, '')
,('jack23ss', 1009, DATE'2019-10-02', 6, '')
,('jack23ss', 1010, DATE'2018-11-17', 7, '')
,('jack23ss', 1011, DATE'2019-11-27', 7, '')
,('veronica4', 1001, DATE'2020-05-12', 8, '')
,('veronica4', 1002, DATE'2019-10-26', 8, '')
,('veronica4', 1003, DATE'2021-07-20', 6, '')
,('veronica4', 1005, DATE'2020-04-19', 3, '')
,('veronica4', 1009, DATE'2021-02-12', 7, '')
,('veronica4', 1011, DATE'2021-01-02', 8, '')
,('veronica4', 1012, DATE'2011-11-23', 8, '')
,('jill33', 1001, DATE'2020-03-22', 7, '')
,('jill33', 1002, DATE'2020-04-02', 8, '')
,('jill33', 1005, DATE'2021-02-22', 4, '')
,('lillian56', 1001, DATE'2014-01-03', 8, '')
,('lillian56', 1002, DATE'2014-02-13', 7, '')
,('lillian56', 1011, DATE'2017-12-23', 7, '')
,('lillian56', 1005, DATE'2021-11-21', 7, '')
,('jbasil', 1001, DATE'2013-03-01', 6, '')
,('jbasil', 1002, DATE'2010-06-21', 5, '')
,('jbasil', 1008, DATE'2021-07-25', 4, '')
,('jbasil', 1011, DATE'2018-04-25', 8, '')
,('pdueller', 1001, DATE'2019-02-03', 6, '')
,('pdueller', 1002, DATE'2018-12-23', 5, '')
,('pdueller', 1003, DATE'2021-07-23', 7, '')
,('pdueller', 1006, DATE'2021-07-30', 5, '')
,('pdueller', 1005, DATE'2020-11-21', 7, '')
,('pdueller', 1010, DATE'2019-10-11', 8, '')
,('pdueller', 1013, DATE'2021-07-19', 6, '')
,('tdude', 1001, DATE'2018-03-12', 8, '')
,('tdude', 1002, DATE'2019-04-23', 8, '')
,('tdude', 1003, DATE'2021-09-30', 4, '')
,('tdude', 1004, DATE'2021-05-20', 7, '')
,('tdude', 1010, DATE'2021-02-26', 6, '')
,('tdude', 1011, DATE'2020-12-16', 6, '')
,('tdude', 1013, DATE'2021-07-18', 7, '')
,('melpop', 1013, DATE'2021-07-20', 4, '')
,('rabbit9', 1014, DATE'2018-04-10', 8, '')
,('movgirl', 1014, DATE'2021-05-18', 3, '')
 ;

END
