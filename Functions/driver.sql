CREATE DEFINER=`root`@`localhost` FUNCTION `driver`(driver int) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE driver_number int; 
SET driver_number = (select count(*) from delivery where driver_sequence_number = driver);
RETURN driver_number;
END