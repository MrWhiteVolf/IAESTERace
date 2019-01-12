USE IAESTE_RACE;
DELIMITER //

DROP PROCEDURE IF EXISTS AddCuriosity;
CREATE PROCEDURE AddCuriosity
(
    IN _Title nvarchar(256),
    IN _Text nvarchar(2048),
    IN _PhotoId integer
)
BEGIN
    INSERT INTO CURIOSITY(Title, Cur_Text, PhotoId) VALUES (_Title, _Text, _PhotoId);
END //

DROP PROCEDURE IF EXISTS GetCuriosity;
CREATE PROCEDURE GetCuriosity
(
    IN CurId integer
)
BEGIN
    select * from CURIOSITY where Id = CurId;
END //

DROP PROCEDURE IF EXISTS GetCuriosityList;
CREATE PROCEDURE GetCuriosityList
(
)
BEGIN
    select Id,Title from CURIOSITY;
END //
DELIMITER ;
--