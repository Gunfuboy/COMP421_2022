-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.
CREATE TABLE MOTHER
(
  MomRAMQ BIGINT NOT NULL --SIMPLIFY RAMQ AND ASSUME THEY ARE BIGINTS
 ,Name VARCHAR(30)
 ,Address VARCHAR(50)
 ,Phone BIGINT
 ,dob DATE
 ,Email VARCHAR(50)
 ,Profession VARCHAR(50)
 ,Bloodtype VARCHAR(3)
 ,DueDate DATE
 ,PRIMARY KEY(MomRAMQ)
);


CREATE TABLE FATHER
(
    DadRAMQ BIGINT NOT NULL
    ,Name VARCHAR(50)
    ,Address VARCHAR(50)
    ,Phone BIGINT
    ,dob DATE
    ,Email VARCHAR(50)
    ,Profession VARCHAR(50)
    ,Bloodtype VARCHAR(3)
    ,PRIMARY KEY(DadRAMQ)
);

CREATE TABLE COUPLE
(
    LoginID      BIGINT NOT NULL,
    PregnancyExp DATE,
    MomRAMQ BIGINT,
    DadRAMQ BIGINT,
    FOREIGN KEY (MomRAMQ) REFERENCES MOTHER,
    FOREIGN KEY (DadRAMQ) REFERENCES FATHER,
    PRIMARY KEY(LoginID)
);

CREATE TABLE INSTITUTIONS
(
    Email VARCHAR(50) NOT NULL,
    Name VARCHAR(50),
    ADDRESS VARCHAR(50),
    Phone BIGINT,
    Website VARCHAR(50),
    PRIMARY KEY (Email)
);

CREATE TABLE LOCATION_OF_BIRTH
(
    Email VARCHAR(50) NOT NULL,
    FOREIGN KEY (Email) REFERENCES INSTITUTIONS,
    PRIMARY KEY (Email)
);

CREATE TABLE HOME
(
    Email VARCHAR(50) NOT NULL,
    FOREIGN KEY (Email) REFERENCES INSTITUTIONS,
    PRIMARY KEY (Email)
);

CREATE TABLE BIRTHING_CENTER
(
    Email VARCHAR(50) NOT NULL,
    FOREIGN KEY (Email) REFERENCES INSTITUTIONS,
    PRIMARY KEY (Email)
);

CREATE TABLE COMMUNITY_CLINIC
(
    Email VARCHAR(50) NOT NULL,
    FOREIGN KEY (Email) REFERENCES INSTITUTIONS,
    PRIMARY KEY (Email)
);

CREATE TABLE FACILITY
(
    Email VARCHAR(50) NOT NULL,
    FOREIGN KEY (Email) REFERENCES INSTITUTIONS,
    PRIMARY KEY (Email)
);

CREATE TABLE MIDWIFE
(
    PractID BIGINT NOT NULL,
    Name VARCHAR(50),
    mEmail VARCHAR(50),
    PhoneNum BIGINT,
    Email VARCHAR(50),
    FOREIGN KEY (Email) REFERENCES INSTITUTIONS,
    PRIMARY KEY (PractID)
);

CREATE TABLE TECHNICIAN
(
    TechID BIGINT NOT NULL,
    PhoneNum BIGINT,
    TechName VARCHAR(50),
    PRIMARY KEY (TechID)
);

CREATE TABLE PREGNANCY_RESULT
(
    ResultID BIGINT NOT NULL ,
    BloodType VARCHAR(3),
    NumberPregancy BIGINT,
    ExpectDueDate DATE,
    DatingUltraDueDate DATE,
    MenstrualDueDate DATE,
    BabyGender VARCHAR(50),
    NumOfBabies BIGINT,
    IronLevel VARCHAR(10),
    loginID BIGINT,
    practID BIGINT,
    bPractID BIGINT,
    Email VARCHAR(50),
    PRIMARY KEY (ResultID),
    FOREIGN KEY (loginID) REFERENCES COUPLE,
    FOREIGN KEY (practID) REFERENCES MIDWIFE,
    FOREIGN KEY (bPractID) REFERENCES MIDWIFE,
    FOREIGN KEY (Email) REFERENCES INSTITUTIONS
);

CREATE TABLE BABY (
    MomRAMQ BIGINT NOT NULL,
    TIMEOB TIME NOT NULL,
    DATEOB DATE NOT NULL,
    Gender VARCHAR(50),
    Name VARCHAR(50),
    Bloodtype VARCHAR(50),
    FOREIGN KEY  (MomRAMQ) REFERENCES MOTHER,
    PRIMARY KEY (MomRAMQ, TIMEOB, DATEOB)
);

CREATE TABLE TESTS
(
    SampleID BIGINT NOT NULL,
    Type VARCHAR(50),
    DatePresc DATE,
    DateTaken DATE,
    DateDone DATE ,
    PractID BIGINT,
    ResultID BIGINT,
    TechID BIGINT,
    PRIMARY KEY (SampleID),
    FOREIGN KEY (PractID) REFERENCES MIDWIFE,
    FOREIGN KEY (ResultID) REFERENCES PREGNANCY_RESULT,
    FOREIGN KEY (TechID) REFERENCES TECHNICIAN,
    CHECK ( DateDone >= DatePresc )
);

CREATE TABLE ONLINE_INFO_SESSION
(
    SessionID BIGINT NOT NULL,
    Language VARCHAR(50),
    Date DATE,
    Time TIME,
    PractID BIGINT,
    PRIMARY KEY (SessionID),
    FOREIGN KEY (PractID) REFERENCES MIDWIFE
);

CREATE TABLE APPOINTMENTS
(
    ApptID BIGINT NOT NULL,
    aDate DATE,
    aTime TIME,
    PractID BIGINT,
    MomRAMQ BIGINT,
    PRIMARY KEY (ApptID),
    FOREIGN KEY (PractID) REFERENCES MIDWIFE,
    FOREIGN KEY (MomRAMQ) REFERENCES MOTHER
);

CREATE TABLE NOTES
(
    NoteID BIGINT NOT NULL,
    DateCreated DATE,
    TimeCreated TIME,
    ApptID BIGINT,
    PRIMARY KEY (NoteID),
    FOREIGN KEY (ApptID) REFERENCES APPOINTMENTS
);

CREATE TABLE INFOSESSION_ATTENDANCE
(
    SessionID BIGINT NOT NULL,
    LoginID BIGINT NOT NULL,
    attended VARCHAR(10),
    PRIMARY KEY (SessionID, LoginID),
    FOREIGN KEY (SessionID) REFERENCES ONLINE_INFO_SESSION,
    FOREIGN KEY (LoginID) REFERENCES COUPLE
);


