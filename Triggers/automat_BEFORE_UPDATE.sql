CREATE DEFINER=`root`@`localhost` TRIGGER `automat_BEFORE_UPDATE` BEFORE UPDATE ON `automat` FOR EACH ROW BEGIN
IF NEW.automat_price > 1000000
THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Price is too expensive';
END IF;
END