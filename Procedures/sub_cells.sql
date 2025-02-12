CREATE DEFINER=`root`@`localhost` PROCEDURE `sub_cells`(in name varchar(10), in cells int)
BEGIN
update automat_model set cells_amount = cells_amount - cells
where model_name = name;
select * from automat_model where model_name = name;
END