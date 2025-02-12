use automat;

select * from automat;
select * from appearance;

select * from automat as a1 where not exists(
select distinct a2.model_name, a3.sticker from automat as a2, automat as a3 where not exists(
select * from automat as a4 where a4.model_name = a2.model_name and a4.sticker = a3.sticker
) and a1.model_name = a2.model_name);
