CREATE DEFINER=`root`@`localhost` FUNCTION `order_price`() RETURNS int
    DETERMINISTIC
BEGIN
DECLARE price int;
SET price = (select (automat.automat_price + delivery.delivery_price) as price
FROM automat INNER JOIN ordering ON automat.serial_number = ordering.serial_number
INNER JOIN delivery ON delivery.delivery_code = ordering.delivery_code limit 2, 1);
RETURN price;
END