USE IAESTE_RACE;
DELIMITER //
DROP PROCEDURE IF EXISTS TEAMCREATE;
CREATE PROCEDURE TEAMCREATE
(
    IN _Name nvarchar(256),
    IN _Description nvarchar(2048),
    IN _First_User_Id integer,
    IN _Sec_User_Id integer
)
    BEGIN
      INSERT INTO TEAM (Name, Description, First_User_Id, Sec_User_Id)
      VALUES (_Name,_Description,_First_User_Id,_Sec_User_Id);
    END //
DROP PROCEDURE IF EXISTS TEAMGET;
CREATE PROCEDURE TEAMCREATE1()
    BEGIN
      select * from TEAM;
    END //
DROP PROCEDURE GetTeamUsers;
CREATE PROCEDURE GetTeamUsers
(IN TeamId integer)
BEGIN
    select * from USER u where u.TeamId = TeamId;
END
DELIMITER ;