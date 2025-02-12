use automat;

select * from driver;
select * from transport;
select * from driver as a1 where not exists(
select distinct a2.name, a3.transport_number from driver as a2, driver as a3 where not exists(
select * from driver as a4 where a4.name = a2.name and a4.transport_number = a3.transport_number
) and a1.name = a2.name);
