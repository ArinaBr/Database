CREATE DEFINER=`root`@`localhost` PROCEDURE `add_price`(in number varchar(10), in price int)
BEGIN
update automat set automat_price = automat_price + price
where serial_number = number;
select * from automat where serial_number = number;
END