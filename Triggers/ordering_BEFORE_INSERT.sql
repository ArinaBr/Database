CREATE DEFINER=`root`@`localhost` TRIGGER `ordering_BEFORE_INSERT` BEFORE INSERT ON `ordering` FOR EACH ROW BEGIN
IF NEW.ordering_date > CURDATE()
THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Such a date has not yet arrived';
END IF;
END