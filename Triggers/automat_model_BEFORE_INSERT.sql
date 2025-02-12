CREATE DEFINER=`root`@`localhost` TRIGGER `automat_model_BEFORE_INSERT` BEFORE INSERT ON `automat_model` FOR EACH ROW BEGIN
SET NEW.model_name = UPPER(NEW.model_name);
END