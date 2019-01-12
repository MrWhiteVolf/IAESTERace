USE IAESTE_RACE;
DELIMITER //

-- GetCurrentLocalization
DROP PROCEDURE IF EXISTS GetCurrentLocalization;
CREATE PROCEDURE GetCurrentLocalization
(
    IN _UserId integer
)
BEGIN
    select Lat,Lon,Time from LOCALIZATION l where UserId = _UserId ORDER BY Time DESC LIMIT 1;
END //

-- GetUsersTrace
DROP PROCEDURE IF EXISTS GetUsersTrace;
CREATE PROCEDURE GetUsersTrace
(
IN _UserId integer
)
BEGIN
    select Lat,Lon,Time from localization l where UserId = _UserId ORDER BY Time DESC;
END //
-- AddUsersLocalization
DROP PROCEDURE IF EXISTS AddUsersLocalization;
CREATE PROCEDURE AddUsersLocalization
(
IN _UserId integer,
IN _Lat float(8,5),
IN _Lon float(8,5)
)
BEGIN
insert into localization (UserId, Lat, Lon, Time)
select (_UserId, _Lat, _Lon, CURRENT_TIMESTAMP());
END //
DELIMITER ;