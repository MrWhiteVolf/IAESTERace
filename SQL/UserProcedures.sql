USE IAESTE_RACE;
DELIMITER //

DROP PROCEDURE IF exists CreateUser;
CREATE PROCEDURE CreateUser(
IN _Name nvarchar(256),
IN _Surname nvarchar(256),
IN _Email nvarchar(256),
IN _Phone integer,
IN _AboutMe nvarchar(2048),
IN _TeamId integer
)
BEGIN
    INSERT INTO USER (Name,Surname,Email, Phone, AboutMe, TeamId)
    VALUES (_Name,_Surname,_Email,_Phone,_AboutMe,_TeamId);
END //

DROP PROCEDURE IF EXISTS GetUser;
CREATE PROCEDURE GetUser
(
    IN _Id integer
)
BEGIN
    select * from USER where Id = _Id;
END //
DELIMITER ;