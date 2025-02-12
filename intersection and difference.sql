use automat;
select * from automat
where automat.model_name = 'WR880' and exists (select sticker from automat as s1
where s1.sticker = automat.sticker and automat.production_department_number = '3' 
and not exists(select sticker from automat as s2
where s2.sticker = s1.sticker and s1.sticker = 'Ozon'));
