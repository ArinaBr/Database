CREATE DEFINER=`root`@`localhost` TRIGGER `delivery_BEFORE_UPDATE` BEFORE UPDATE ON `delivery` FOR EACH ROW BEGIN
IF NEW.delivery_date > OLD.delivery_date
THEN
SET NEW.delivery_price = 0.85 * OLD.delivery_price;
END IF;
END