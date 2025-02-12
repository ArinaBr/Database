use automat;

select name, surname from installer
join badge on installer.badge_number = badge.badge_number
where validity_period < '2024-10-24' and issue_date > '2018-01-01' 
and (installer.badge_number = '21' or installer.badge_number = '22');