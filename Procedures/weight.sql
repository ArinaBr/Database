CREATE DEFINER=`root`@`localhost` PROCEDURE `weight`()
BEGIN
select avg(weight) as average_weight from automat_model;
END