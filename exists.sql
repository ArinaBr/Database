use automat;
select * from automat;
select * from ordering;

SELECT * FROM automat
WHERE EXISTS
(SELECT * FROM ordering WHERE ordering.serial_number = automat.serial_number);
