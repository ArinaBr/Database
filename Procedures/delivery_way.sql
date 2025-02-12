CREATE DEFINER=`root`@`localhost` PROCEDURE `delivery_way`()
BEGIN
SELECT driver.name, driver.surname,
production_department.department_address,
delivery.delivery_address
FROM driver 
INNER JOIN delivery
ON driver.driver_sequence_number = delivery.driver_sequence_number
INNER JOIN ordering
ON delivery.delivery_code = ordering.delivery_code
INNER JOIN automat
ON ordering.serial_number = automat.serial_number
INNER JOIN production_department
ON automat.production_department_number = production_department.production_department_number;
END