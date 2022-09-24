-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.

SELECT * FROM MOTHER;
SELECT * FROM FATHER;
SELECT * FROM COUPLE;
SELECT * FROM INSTITUTIONS;
SELECT * FROM MIDWIFE;
SELECT * FROM PREGNANCY_RESULT;
SELECT * FROM BABY;
SELECT * FROM TECHNICIAN;
SELECT * FROM TESTS;
SELECT * FROM ONLINE_INFO_SESSION;
SELECT * FROM APPOINTMENTS;
SELECT * FROM NOTES;
SELECT * FROM INFOSESSION_ATTENDANCE;

-- A more complex syntax that saves you typing effort.
INSERT INTO MOTHER (MomRAMQ,Name,Address,Phone,dob,Email,Profession,Bloodtype,DueDate)
VALUES
(1001,'Jane Chen', '10550 place de lAcadie', 5140001111, '2000-01-01', 'mariongirard@gmail.com', 'Unemployed', 'A-', '2022-10-10'),
(1002,'Victoria Gutierrez', '3945 Godfrey Road', 2498380553, '1969-04-20', 'victoriagutierrez@gmail.com', 'Cook', 'B+', '2023-01-01'),
(1003,'Stella Payne', '3052 Reynolds Alley', 9987016879, '1996-03-17', 's.payne@randatmail.com', 'Economist', 'AB-', '2022-09-27'),
(1004,'Rebeca Pineda', '2949 Stockert Hollow Road', 3990719187, '1999-09-13', 'r.pineda@gmail.com', 'Interpreter', 'A+', '2022-11-08'),
(1005,'April Mccormick', '4157 Roy Alley', 0128489393, '1999-10-04', 'a.mcormick@gmail.com', 'Stripper', 'B-', '2023-01-12'),
(1006,'Ivie Guzman', '1041 Aaron Smith Drive', 7600034250, '2000-02-24', 'i.guzman@gmail.com', 'Stripper', 'O+', '2022-09-10')
;



INSERT INTO FATHER (DadRAMQ,Name,Address,Phone,dob,Email,Profession,Bloodtype)
VALUES
(1011,'Subhan Espinosa', '101 xyz street', 5140001111, '1986-01-27', 's.espinoza@gmail.com', 'Unemployed', 'O'),
(1012,'Syed Gough', '3945 Godfrey Road', 9781504741, '1987-07-18', 's.gough@gmail.com', 'Programmer', 'B+'),
(1013,'Richard Dolan', '3052 Reynolds Alley', 2542835886, '2000-11-05', 'r.dolan@randatmail.com', 'Agronomist','A+'),
(1014,'Zidane Villa', '961 Shingleton Road', 5140001111, '1996-06-18', 'r.pineda@gmail.com', 'Accountant', 'A'),
(1015,'Kacper Cain', '1326 Sarah Drive', 0128489393, '1994-03-19', 'ak.cain@gmail.com', 'Electrician', 'B-')
;



INSERT INTO COUPLE (LOGINID, PREGNANCYEXP, MOMRAMQ, DADRAMQ) VALUES
(1101,'2022-10-11',1001,1011),
(1102,'2023-01-02',1002,1012),
(1103,'2022-09-29',1003,1013),
(1104,'2022-11-10',1004,1014),
(1105,'2023-01-14',1005,1015),
(1106,'2022-09-13',1006,NULL)
;

INSERT INTO INSTITUTIONS (Email,Name,Address,Phone,Website) VALUES
('GeneralHospital@gmail.com', 'General Hospital', '3006 Hillcrest Lane', 2602815264, 'GeneralHospital.com'),
('JewishHospital@gmail.com', 'Jewish Hospital', '1675 Short Street', 1618043026, 'JewishHospital.com'),
('HavanaCenter@gmail.com', 'Havana Center', '3903 Rogers Street', 3736259595, 'HavanaCenter.com'),
('Centerable@gmail.com', 'Centerable', '2135 Rosewood Court', 8409914107, 'Centerable.com'),
('JaneHome@gmail.com', 'Jane Home', '2765 Counts Lane', 5711526415, 'JaneHome.com'),
('Danielclinic@gmail.com', 'Daniel Clinic', '870 Coal Road', 7506952635, 'Danielclinic.com'),
('clinicGarnet@gmail.com', 'Clinic Garnet', '701 Norman Street', 7762310090, 'clinicGarnet.com'),
('lsl@gmail.com', 'Lac-Saint-Louis', '111 LSL Street', 4386900087, 'lsl.com')
;

INSERT INTO LOCATION_OF_BIRTH (Email) VALUES
('GeneralHospital@gmail.com'),
('JewishHospital@gmail.com'),
('HavanaCenter@gmail.com'),
('Centerable@gmail.com'),
('JaneHome@gmail.com')
;

INSERT INTO HOME (Email) VALUES
('JaneHome@gmail.com')
;

INSERT INTO BIRTHING_CENTER (Email)
VALUES
('GeneralHospital@gmail.com'),
('JewishHospital@gmail.com'),
('HavanaCenter@gmail.com'),
('Centerable@gmail.com'),
('lsl@gmail.com')
;

INSERT INTO COMMUNITY_CLINIC (Email)
VALUES
('Danielclinic@gmail.com'),
('clinicGarnet@gmail.com')
;

INSERT INTO FACILITY (Email)
VALUES
    ('GeneralHospital@gmail.com'),
    ('JewishHospital@gmail.com'),
    ('HavanaCenter@gmail.com'),
    ('Centerable@gmail.com'),
    ('lsl@gmail.com'),
    ('Danielclinic@gmail.com'),
    ('clinicGarnet@gmail.com')
;

INSERT INTO MIDWIFE (PRACTID, NAME, MEMAIL, PHONENUM, EMAIL)
VALUES
    (2001, 'Marion Girard', 'm.girard@gmail.com', '7371924230', 'JewishHospital@gmail.com'),
    (2002, 'Harlow Frost', 'HarlowFrost@gmail.com', '2742029979', 'GeneralHospital@gmail.com'),
    (2003, 'Rebeca Thornton', 'RebecaThornton@gmail.com', '1084514837', 'Centerable@gmail.com'),
    (2004, 'Sherry Iles', 'SherryIles@gmail.com', '2479575577', 'HavanaCenter@gmail.com'),
    (2005, 'Gwen Hood', 'GwenHood@gmail.com', '5908639191', 'JewishHospital@gmail.com'),
    (2006, 'Keri Hayward', 'KeriHayward@gmail.com', '9991619958', 'lsl@gmail.com')
;

INSERT INTO TECHNICIAN (TECHID, PHONENUM, TECHNAME)
VALUES
    (3001, 2575426078, 'Shola Walton'),
    (3002, 5335233088, 'Elif Glover'),
    (3003, 6582529554, 'Solomon Pacheco'),
    (3004, 2372680501, 'Jonah Jimenez'),
    (3005, 1656522729, 'Salahuddin Boyer'),
    (3006, 5189496997, 'Tre Rankin'),
    (3007, 1053326939, 'Anabelle Allen')
;

INSERT INTO PREGNANCY_RESULT (RESULTID, BLOODTYPE, NumberPregancy, EXPECTDUEDATE, DATINGULTRADUEDATE, MENSTRUALDUEDATE, BABYGENDER, NUMOFBABIES, IRONLEVEL, LOGINID, PRACTID, bPractID, EMAIL)
VALUES
    (4001, 'A+', 1, '2022-10-10', '2022-10-10', '2022-10-10', 'FEMALE', 3, 'LOW',1101, 2001, 2001, 'GeneralHospital@gmail.com'),
    (4002, 'B-', 1, '2023-01-01', '2023-01-01', '2023-01-05', 'MALE', NULL,'MEDIUM', 1102, 2002, 2001, 'JewishHospital@gmail.com'),
    (4011, 'B',  2,'2023-01-01', '2023-01-01', '2023-01-05', 'MALE', NULL,'MEDIUM', 1102, 2002, 2001, 'JewishHospital@gmail.com'),
    (4012, 'A+', 3, '2023-01-01', '2023-01-01', '2023-01-05', 'MALE', NULL,'MEDIUM', 1102, 2002, 2001, 'JewishHospital@gmail.com'),
    (4003, 'O',  1,'2022-07-27','2022-07-27', '2022-07-27', NULL, 3, 'HIGH',1103, 2003, 2001, 'HavanaCenter@gmail.com'),
    (4004, 'A+', 1, '2022-02-09', '2022-02-08', '2022-02-09', 'MALE', 2,'MEDIUM', 1104, 2006, 2001, 'Centerable@gmail.com'),
    (4005, 'B-', 1, '2023-01-12', '2023-01-12', '2023-01-12', NULL, NULL, NULL, 1105, 2006, 2001, 'Centerable@gmail.com'),
    (4006, 'O',  1,'2022-07-10', '2022-07-10', '2022-07-10', 'MALE', 1,'HIGH', 1106, 2006, 2001, 'HavanaCenter@gmail.com'),
    (4007, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 1102, 2004, 2001, 'JaneHome@gmail.com'),
    (4008, NULL, 1, NULL, NULL, NULL, 'FEMALE', NULL, NULL, 1105, 2002, 2001, 'JaneHome@gmail.com'),
    (4009, NULL, 1, NULL, NULL, NULL, NULL, 3, NULL, 1105, 2002, 2001, 'Centerable@gmail.com'),
    (4010, NULL, 1, NULL, NULL, NULL, 'MALE', NULL, NULL, 1103, 2002, 2001, 'HavanaCenter@gmail.com')
;

INSERT INTO BABY (MOMRAMQ, TIMEOB, DATEOB, GENDER, NAME, BLOODTYPE)
VALUES
    ('1001', '14.30.10', '2022-10-10', 'MALE', 'Eden Fox', 'B+'),
    ('1002', '08.55.20', '2023-01-01', 'FEMALE', 'Killian Sharpe', 'A+'),
    ('1003', '09.20.20', '2022-09-27', 'MALE', 'NULL', 'B-'),
    ('1005', '03.01.00', '2023-01-12', 'FEMALE', 'Makenzie Baldwin', 'O+'),
    ('1006', '20.20.20', '2022-09-10', 'MALE', 'Hallam Bowers', 'AB-')
;

INSERT INTO TESTS (SAMPLEID, TYPE, DATEPRESC, DATETAKEN, DATEDONE, PRACTID, RESULTID, TECHID)
VALUES
    ('5001', 'Blood Test', '2022-03-10', '2022-03-15', '2022-03-16', 2001, 4001, 3001),
    ('5002', 'Ultra Sound', '2022-03-10', '2022-03-16', '2022-03-16', 2001, 4001, 3001),
    ('5003', 'Ultra Sound', '2022-03-15', '2022-03-20', '2022-03-21', 2001, 4001,3001),
    ('5006', 'Blood Test', '2022-03-10', '2022-03-15', '2022-03-16', 2002, 4002, 3002),
    ('5007', 'Ultra Sound', '2022-03-10', '2022-03-13', '2022-03-14', 2002, 4002, 3002),
    ('5008', 'Blood Test', '2022-01-01', '2022-01-04', '2022-01-20', 2003, 4003, 3003),
    ('5009', 'Ultra Sound', '2022-01-01', '2022-01-20', '2022-01-21', 2003, 4003, 3004),
    ('5010', 'Blood Test', '2022-02-10', '2022-02-14', '2022-02-15', 2004, 4004, 3005),
    ('5011', 'Ultra Sound', '2022-02-11', '2022-02-15', '2022-02-16', 2004, 4004, 3005),
    ('5012', 'Blood Test', '2022-05-10', '2022-05-10', '2022-05-10', 2005, 4005, 3001),
    ('5013', 'Ultra Sound', '2021-12-12', '2022-01-01', '2022-01-30', 2006, 4006, 3002),
    ('5014', 'Blood Test', '2021-12-13', '2022-01-02', '2022-01-30', 2006, 4006, 3002),
    ('5015', 'Ultra Sound', '2022-05-05', '2022-05-09', '2022-05-20',2004, 4007, 3007),
    ('5016', 'Ultra Sound', '2022-05-05', '2022-05-09', '2022-05-20',2002, 4008, 3007),
    ('5017', 'Ultra Sound', '2022-05-05', '2022-05-09', '2022-05-20',2002, 4009, 3007),
    ('5018', 'Ultra Sound', '2022-05-05', '2022-05-09', '2022-05-20', 2002, 4010, 3007),
    ('5019', 'Blood Test', '2022-10-10', '2022-10-15', '2022-10-16', 2001, 4011, 3001),
    ('5020', 'Blood Test', '2023-03-10', '2023-03-16', '2023-03-16', 2001, 4012, 3001)
;

INSERT INTO ONLINE_INFO_SESSION (SESSIONID, LANGUAGE, DATE, TIME, PRACTID)
VALUES
    ('6001', 'English', '2021-10-10', '09.00.00', '2001'),
    ('6002', 'French', '2022-01-01', '10.00.00', '2004'),
    ('6003', 'Mandarin', '2021-12-25', '12.00.00', '2005'),
    ('6004', 'English', '2022-03-15', '09.30.00', '2001'),
    ('6005', 'English', '2022-06-20', '09.30.00', '2001')
;

INSERT INTO APPOINTMENTS (APPTID, ADATE, ATIME, PRACTID, MOMRAMQ)
VALUES
    ('7001', '2022-03-24', '09.00.00', '2001', '1001'),
    ('7002', '2022-03-21', '10.30.00', '2001', '1001'),
    ('7003', '2022-01-10', '10.30.00', '2001', '1001'),
    ('7004', '2022-03-10', '12.00.00', '2002', '1002'),
    ('7005', '2022-01-01', '12.00.00', '2003', '1003'),
    ('7006', '2022-02-10', '12.00.02', '2004', '1004'),
    ('7007', '2022-05-10', '12.00.03', '2005', '1005'),
    ('7008', '2021-12-12', '9.00.00', '2006', '1006'),
    ('7009', '2022-05-05', '9.00.00', '2004', '1002'),
    ('7010', '2022-05-05', '9.00.00', '2002', '1005'),
    ('7011', '2022-05-05', '9.00.00', '2002', '1005'),
    ('7012', '2022-05-05', '9.00.00', '2002', '1003')
;

INSERT INTO NOTES (NOTEID, DATECREATED, TIMECREATED, APPTID)
VALUES
    ('8001', '2022-03-24', '09.05.00', '7001'),
    ('8002', '2022-03-21', '11.00.00', '7002'),
    ('8003', '2022-01-10', '10.32.00', '7003'),
    ('8004', '2022-03-10', '12.05.00', '7004'),
    ('8005', '2022-01-01', '12.00.00', '7005'),
    ('8006', '2022-02-10', '12.00.02', '7006'),
    ('8007', '2022-05-10', '12.00.03', '7007'),
    ('8008', '2021-12-12', '9.00.00', '7008'),
    ('8009', '2022-05-05', '9.00.00', '7009'),
    ('8010', '2022-05-05', '9.00.00', '7010'),
    ('8011', '2022-05-05', '9.00.00', '7011'),
    ('8012', '2022-05-05', '9.00.00', '7012')
;

INSERT INTO INFOSESSION_ATTENDANCE
VALUES
    (6001, 1101, 'NO'),
    (6002, 1102, 'YES'),
    (6001, 1103, 'YES'),
    (6004, 1104, 'YES'),
    (6005, 1105, 'YES'),
    (6001, 1106, 'YES'),
    (6003, 1101, 'YES');
;