USE IAESTE_RACE;
DELIMITER //
DROP PROCEDURE IF EXISTS TEAMCREATE;
CREATE PROCEDURE TEAMCREATE
(
    IN _Name nvarchar(256),
    IN _Description nvarchar(2048)
)
    BEGIN
      INSERT INTO TEAM (Name, Description)
      VALUES (_Name,_Description);
    END //

DROP PROCEDURE IF EXISTS TEAMGET;
CREATE PROCEDURE TEAMGET()
    BEGIN
      select * from TEAM;
    END //

DROP PROCEDURE IF EXISTS GetTeamUsers;
CREATE PROCEDURE GetTeamUsers
(IN TeamId integer)
    BEGIN
        select * from USER u where u.TeamId = TeamId;
    END //

DROP PROCEDURE IF EXISTS GetTeamsList;
CREATE PROCEDURE GetTeamsList()
    BEGIN
        select Id, Name from TEAM;
    END //
DELIMITER ;