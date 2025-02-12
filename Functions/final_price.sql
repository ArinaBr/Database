CREATE DEFINER=`root`@`localhost` FUNCTION `final_price`(automat_price int) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE final_price int;
SET final_price = automat_price + 0.15 * automat_price;
RETURN final_price;
END