CREATE DEFINER=`root`@`localhost` FUNCTION `department`() RETURNS int
    DETERMINISTIC
BEGIN
RETURN (select count(*) from automat where production_department_number = 1);
END