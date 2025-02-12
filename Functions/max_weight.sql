CREATE DEFINER=`root`@`localhost` FUNCTION `max_weight`() RETURNS int
    DETERMINISTIC
BEGIN
DECLARE max_weight int;
SET max_weight = (select max(weight) from automat_model);
RETURN max_weight;
END