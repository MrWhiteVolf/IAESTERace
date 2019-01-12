USE IAESTE_RACE;
DELIMITER //
-- CreateConversation
DROP PROCEDURE IF EXISTS CreateConversation;
CREATE PROCEDURE CreateConversation
(
    IN User1 integer,
    IN User2 integer
)
BEGIN
    insert into CONVERSATION () VALUES ();
    INSERT INTO UserConvAssoc (ConvId, UserId) (select Id, User1 from CONVERSATION ORDER BY Id DESC LIMIT 1) ;
    INSERT INTO UserConvAssoc (ConvId, UserId) (select Id, User2 from CONVERSATION ORDER BY Id DESC LIMIT 1) ;
END //
-- AddMessage
DROP PROCEDURE IF EXISTS AddMessage;
CREATE PROCEDURE AddMessage
(
    IN _ConvId integer,
    IN _UserId integer,
    IN _Text nvarchar(2048)
)
BEGIN
INSERT INTO MESSAGE (UserId, Mes_Text, Time, ConvId)
select (_UserId, _Text, current_timestamp(), _ConvId);
END //
-- GetMessages
DROP PROCEDURE IF EXISTS GetMessages;
CREATE PROCEDURE GetMessages
(
    IN ConvId integer,
    IN Top integer,
    IN Skip integer
)
BEGIN
    select * from MESSAGE m ORDER BY Time DESC LIMIT Top, Skip;
END //
DELIMITER ;