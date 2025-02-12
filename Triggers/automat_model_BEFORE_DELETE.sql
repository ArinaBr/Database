CREATE DEFINER=`root`@`localhost` TRIGGER `automat_model_BEFORE_DELETE` BEFORE DELETE ON `automat_model` FOR EACH ROW BEGIN
DELETE FROM automat WHERE model_name = OLD.model_name;
END