use automat;

select serial_number, automat_price, model_name, sticker,
count(*) over(partition by sticker) as 'count' from automat;

select serial_number, automat_price, model_name, sticker,
min(automat_price) over(partition by model_name order by automat_price) as 'min'
from automat;

select serial_number, automat_price, model_name, sticker,
max(automat_price) over(partition by model_name) as 'max'
from automat;
