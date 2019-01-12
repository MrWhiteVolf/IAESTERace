USE IAESTE_RACE;
DELIMITER //

DROP PROCEDURE IF EXISTS AddContact;
CREATE PROCEDURE AddContact
(
    IN _Name nvarchar(256),
    IN _PhoneNum integer
)
BEGIN
    insert into CONTACT (Name, PhoneNum) VALUES (_Name, _PhoneNum);
END //

DROP PROCEDURE IF EXISTS GetContactList;
CREATE PROCEDURE GetContactList()
BEGIN
    select * from CONTACT;
END //

DELIMITER ;