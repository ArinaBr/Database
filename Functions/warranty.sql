CREATE DEFINER=`root`@`localhost` FUNCTION `warranty`(validity_period date) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE days int;
SET days = TIMESTAMPDIFF(MONTH, CURDATE(), validity_period);
RETURN days;
END