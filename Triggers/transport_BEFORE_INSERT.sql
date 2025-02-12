CREATE DEFINER=`root`@`localhost` TRIGGER `transport_BEFORE_INSERT` BEFORE INSERT ON `transport` FOR EACH ROW BEGIN
DECLARE quantity int;
DECLARE gar_num int;
SET quantity = (select count(*) from transport where garage_number = NEW.garage_number);
IF quantity > 5
THEN
SET gar_num = (select max(garage_number) from garage) + 1;
insert into garage values (gar_num, 'Moscow, str., h., index');

#SIGNAL SQLSTATE '45000'
#SET message_text = 'Garage is full';
END IF;
END