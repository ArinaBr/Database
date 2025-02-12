use automat;

select * from automat;
select * from automat_model;
select * from production_department;

select serial_number, automat_price, model_name, sticker,
count(*) over (partition by model_name) as sticker_count 
from automat;

select serial_number, automat_price,
count(*) over (partition by department_address) as department_count
from automat right join production_department on automat.production_department_number = production_department.production_department_number;

select distinct
automat_model.model_name,
avg(automat.automat_price) over (partition by model_name) as avg_price
from automat_model join automat on automat_model.model_name = automat.model_name;

select
automat_model.model_name, automat.automat_price,
max(automat.automat_price) over (partition by model_name) as avg_price
from automat_model join automat on automat_model.model_name = automat.model_name;
