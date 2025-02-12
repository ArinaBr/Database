use automat;

SELECT serial_number, final_price(automat_price) AS 'final_price' FROM automat;
SELECT license_number, experience(issue_date) AS 'experience in years' FROM driver_license;
SELECT order_price() AS 'order_price';
SELECT general_price() AS 'general_price';
SELECT max_weight() AS 'max_weight';
SELECT warranty_number, warranty(validity_period) AS 'remaining warranty in months' FROM warranty;
SELECT execution_time() AS 'execution_time';
SELECT department() AS 'quantity';
SELECT driver(3) AS 'quantity';
SELECT model('WR880') AS '1 - yes; 0 - no';
