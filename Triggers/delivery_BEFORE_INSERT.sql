CREATE DEFINER=`root`@`localhost` TRIGGER `delivery_BEFORE_INSERT` BEFORE INSERT ON `delivery` FOR EACH ROW BEGIN
IF NEW.delivery_address NOT LIKE 'Moscow,%'
THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Delivery is possible only in Moscow';
END IF;
END