use automat;

#insert into automat_model values ('sd555', 50, 200);
#select * from automat_model;

#insert into automat values(5555, 350000, 'SD555', 'Ozon', 1);
#select * from automat;
#delete from automat_model where model_name = 'SD555';
#select * from automat_model;
#select * from automat;

#insert into employee values(4, 'Petr', 'Sidorov', '9458', 201, 1);

#insert into delivery values(2020, 10000, 'Oren', '2024-01-01', 'Mail', 1, 1);

#insert into ordering values(5555, '2024-01-01', 3459, 3735);

#select * from automat;
#update automat set automat_price = 2000000 where serial_number = 3457;

#update delivery set delivery_date = '2024-10-11' where delivery_code = 1551;
#select * from delivery;

#insert into transport values('B325LR', 'Kia', 1000, 2);
#select count(*) from transport where garage_number = 2;

#select * from provider;
#insert into provider values('Fyuihyufrts', '89995254114');

#select * from driver_license;
#insert into driver_license values('59874', 'A', '2027-10-05', '2017-10-05');

#show triggers;