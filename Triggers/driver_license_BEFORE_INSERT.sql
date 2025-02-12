CREATE DEFINER=`root`@`localhost` TRIGGER `driver_license_BEFORE_INSERT` BEFORE INSERT ON `driver_license` FOR EACH ROW BEGIN
IF NEW.category NOT LIKE 'B' AND NEW.category NOT LIKE 'C'
THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Invalid category of license';
END IF;
END