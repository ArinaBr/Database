CREATE DEFINER=`root`@`localhost` PROCEDURE `installer`()
BEGIN
select installer_sequence_number, count(*) as 'quantity' from delivery group by installer_sequence_number 
order by count(*) desc;
END