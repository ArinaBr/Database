use automat;

select serial_number, automat_price, model_name, sticker,
avg(automat_price) over(partition by model_name) as 'avg' from automat;

select serial_number, automat_price, model_name, sticker,
sum(automat_price) over(partition by model_name order by serial_number) as 'sum' 
from automat;

select serial_number, automat_price, model_name, sticker, sum(automat_price) 
over(partition by model_name order by serial_number rows between current row and 1 following) 
as 'sum' from automat;
