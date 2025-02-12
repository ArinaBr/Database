CREATE DEFINER=`root`@`localhost` PROCEDURE `provider`(in name varchar(20), in number varchar(15))
BEGIN
insert into provider (provider_name, phone_number) values (name, number);
select * from provider;
END