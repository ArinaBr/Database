CREATE DEFINER=`root`@`localhost` FUNCTION `execution_time`() RETURNS int
    DETERMINISTIC
BEGIN
DECLARE execution int;
SET execution = (select TIMESTAMPDIFF(MONTH, ordering.ordering_date, delivery.delivery_date) as execution
FROM ordering INNER JOIN delivery ON delivery.delivery_code = ordering.delivery_code limit 1, 1);
RETURN execution;
END