CREATE DEFINER=`root`@`localhost` PROCEDURE `number_of_transport`()
BEGIN
SELECT garage.garage_number, COUNT(*) AS quantity
FROM garage 
INNER JOIN transport
ON garage.garage_number = transport.garage_number
GROUP BY garage.garage_number;
END