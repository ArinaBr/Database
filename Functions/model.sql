CREATE DEFINER=`root`@`localhost` FUNCTION `model`(model varchar(10)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
if exists (select * from automat where model_name = model)
then
return true;
end if;
RETURN false;
END