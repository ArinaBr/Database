CREATE DEFINER=`root`@`localhost` PROCEDURE `automat_in_order`(in model varchar(10), out naming varchar(10))
BEGIN
declare naming varchar(10);
declare ser_num1 varchar(10);
declare ser_num2 varchar(10);
set ser_num1 = (select serial_number from automat where serial_number = model);
set ser_num2 = (select serial_number from ordering where serial_number = model);
case
when (model = ser_num1 AND ser_num1 = ser_num2)
then
set naming = 'yes';
else
set naming = 'no';
end case;
select naming as 'yes or no';
END