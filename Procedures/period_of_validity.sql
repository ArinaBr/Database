CREATE DEFINER=`root`@`localhost` PROCEDURE `period_of_validity`()
BEGIN
SELECT employee.name, employee.surname,
DATEDIFF(pass.validity_period, CURDATE()) AS 
number_of_days
FROM employee INNER JOIN pass
ON employee.pass_number = pass.pass_number;
END