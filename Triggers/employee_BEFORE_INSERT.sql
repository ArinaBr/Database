CREATE DEFINER=`root`@`localhost` TRIGGER `employee_BEFORE_INSERT` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN
IF NEW.phone_number REGEXP '^\+7[0-9]{10}$'
THEN
SIGNAL SQLSTATE '45000'
SET message_text = 'Phone number is incorrect';
END IF;
END