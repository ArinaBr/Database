CREATE DEFINER=`root`@`localhost` FUNCTION `experience`(issue_date date) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE experience int;
SET experience = TIMESTAMPDIFF(YEAR, issue_date, CURDATE());
RETURN experience;
END