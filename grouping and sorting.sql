use automat;

select installer.name, count(*) as quantity
from delivery inner join installer
on delivery.installer_sequence_number = installer.installer_sequence_number
group by installer.name order by quantity desc;
