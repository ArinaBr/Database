CREATE DEFINER=`root`@`localhost` PROCEDURE `delivery_participants`()
BEGIN
SELECT installer.name, installer.surname, driver.name, driver.surname, delivery.delivery_code
FROM delivery 
INNER JOIN driver
ON delivery.driver_sequence_number = driver.driver_sequence_number
INNER JOIN installer
ON delivery.installer_sequence_number = installer.installer_sequence_number;
END