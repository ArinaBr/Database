use automat;

# агрегатная функция
select distinct
automat_model.model_name,
avg(automat.automat_price) over (partition by model_name) as avg_price
from automat_model join automat on automat_model.model_name = automat.model_name;

# ранжирующая функция
select automat.serial_number, automat_price, ordering_date,
dense_rank() over (order by automat_price desc) as rang
from automat join ordering on automat.serial_number = ordering.serial_number;

# функция смещения
select
delivery.delivery_code, delivery_address, provider_name, ordering_code, delivery_date,
lag(delivery.delivery_code) over (partition by provider_name order by delivery_date) as previous_delivery
from delivery join ordering on delivery.delivery_code = ordering.delivery_code;
