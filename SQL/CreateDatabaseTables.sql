CREATE DATABASE IF NOT EXISTS IAESTE_RACE;

USE IAESTE_RACE;

CREATE TABLE IF NOT EXISTS USER
(
  Id integer NOT NULL AUTO_INCREMENT,
  Name nvarchar(256) NOT NULL,
  Surname nvarchar(256) NOT NULL,
  Email nvarchar(256) NOT NULL,
  Phone integer NOT NULL,
  AboutMe nvarchar(2048) NULL,
  TeamId integer NOT NULL,
  PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS TEAM
(
  Id integer NOT NULL AUTO_INCREMENT,
  Name nvarchar(256) NOT NULL,
  Description nvarchar(2048) NULL,
  PRIMARY KEY (Id)
);

SELECT
    COUNT(*)
INTO
    @num
FROM
    `information_schema`.`table_constraints`
WHERE
    `table_schema` = 'IAESTE_RACE'
    AND `table_name` = 'USER'
    AND `constraint_name` = 'FK_TeamId'
    AND `constraint_type` = 'FOREIGN KEY';

SET @statement := IF(
    @num > 0,
    'ALTER TABLE USER ADD CONSTRAINT FK_TeamId FOREIGN KEY (TeamId) REFERENCES TEAM(Id);',
    'ALTER TABLE USER;'
);
PREPARE statement FROM @statement;
EXECUTE statement;

CREATE TABLE IF NOT EXISTS CONTACT
(
  Id integer NOT NULL AUTO_INCREMENT,
  Name nvarchar(256),
  PhoneNum integer,
  PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS CURIOSITY
(
  Id integer NOT NULL AUTO_INCREMENT,
  Title nvarchar(256),
  Cur_Text nvarchar(2048),
  PhotoId integer,
  PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS LOCALIZATION
(
  Id integer NOT NULL AUTO_INCREMENT,
  UserId integer NOT NULL,
  Lat float(8,5),
  Lon float(8,5),
  Time DATETIME,
  PRIMARY KEY (Id),
  FOREIGN KEY (UserId) REFERENCES USER (Id)
);

CREATE TABLE IF NOT EXISTS CONVERSATION
(
  Id integer NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Id)
);

CREATE TABLE IF NOT EXISTS MESSAGE
(
  Id integer NOT NULL AUTO_INCREMENT,
  UserId integer NOT NULL,
  Mes_Text nvarchar(2048),
  Time DATETIME,
  ConvId integer,
  PRIMARY KEY (Id),
  FOREIGN KEY (UserId) REFERENCES USER(Id),
  FOREIGN KEY (ConvId) REFERENCES CONVERSATION(Id)
);

CREATE TABLE IF NOT EXISTS TEAM_CONV_ASOC
(
  ConvId integer,
  TeamId integer,
  FOREIGN KEY (ConvId) REFERENCES CONVERSATION(Id),
  FOREIGN KEY (TeamId) REFERENCES TEAM(Id)
);
