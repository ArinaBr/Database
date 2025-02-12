CREATE DEFINER=`root`@`localhost` TRIGGER `provider_BEFORE_INSERT` BEFORE INSERT ON `provider` FOR EACH ROW BEGIN
IF LENGTH(NEW.provider_name) > 10
THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Name is too long';
END IF;
END