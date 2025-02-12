CREATE DEFINER=`root`@`localhost` PROCEDURE `change_colour`(in word varchar(50))
BEGIN
declare tint varchar(50);
set tint = (select colour from appearance where sticker = word);
if (word = 'Ozon' AND tint != 'blue')
then
update appearance set colour = 'blue' where sticker = word;
end if;
if (word = 'PickPoint' AND tint != 'orange')
then
update appearance set colour = 'orange' where sticker = word;
end if;
if (word = 'Yandex Market' AND tint != 'yellow')
then
update appearance set colour = 'yellow' where sticker = word;
end if;
if (word = 'Wildberries' AND tint != 'purple')
then
update appearance set colour = 'purple' where sticker = word;
end if;
if (word = 'Sberbank' AND tint != 'green')
then
update appearance set colour = 'green' where sticker = word;
end if;
select * from appearance;
END