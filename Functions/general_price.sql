CREATE DEFINER=`root`@`localhost` FUNCTION `general_price`() RETURNS int
    DETERMINISTIC
BEGIN
DECLARE price int;
SET price = (select sum(automat_price) from automat);
RETURN price;
END