-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.
DROP TABLE MOTHER;
DROP TABLE FATHER;
DROP TABLE COUPLE;
DROP TABLE INSTITUTIONS;
DROP TABLE LOCATION_OF_BIRTH;
DROP TABLE HOME;
DROP TABLE BIRTHING_CENTER;
DROP TABLE COMMUNITY_CLINIC;
DROP TABLE FACILITY;
DROP TABLE MIDWIFE;
DROP TABLE TECHNICIAN;
DROP TABLE PREGNANCY_RESULT;
DROP TABLE BABY;
DROP TABLE TESTS;
DROP TABLE ONLINE_INFO_SESSION;
DROP TABLE APPOINTMENTS;
DROP TABLE NOTES;
DROP TABLE INFOSESSION_ATTENDANCE;

