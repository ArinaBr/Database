CREATE DEFINER=`root`@`localhost` PROCEDURE `brand`()
BEGIN
SELECT automat.sticker, COUNT(*) AS quantity
FROM automat 
GROUP BY automat.sticker;
END