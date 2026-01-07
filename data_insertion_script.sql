-- INSERT DATA
-- - minimum 5 entries per table
-- JOB CLASS TABLE
INSERT INTO cs_jobClass VALUES (101, 'Store Manager', 55000, 80000);
INSERT INTO cs_jobClass VALUES (102, 'Sales Associate', 35000, 50000);
INSERT INTO cs_jobClass VALUES (103, 'Inventory Clerk', 32000, 48000);
INSERT INTO cs_jobClass VALUES (104, 'Buyer', 45000, 65000);
INSERT INTO cs_jobClass VALUES (105, 'Cashier', 30000, 42000);
INSERT INTO cs_jobClass VALUES (106, 'Custodian', 24000, 48000); -- new

-- EMPLOYEES TABLE
-- Manager (manages everyone including themselves)
INSERT INTO cs_employees VALUES 
(1001, 101, 'Alice', 'Johnson', 'alice@store.com', 'active',
 TO_DATE('2024-01-01','YYYY-MM-DD'), 75000, 1001);

-- Other employees
INSERT INTO cs_employees VALUES 
(1002, 102, 'Brian', 'Lee', 'brian@store.com', 'active',
 TO_DATE('2024-06-15','YYYY-MM-DD'), 40000, 1001);

INSERT INTO cs_employees VALUES 
(1003, 103, 'Cindy', 'White', 'cindy@store.com', 'active',
 TO_DATE('2024-01-10','YYYY-MM-DD'), 42000, 1001);

-- EDIT: inactive i.e. used to be employeed. Cashiers are a fast turnover position.
INSERT INTO cs_employees VALUES 
(1004, 105, 'David', 'Ng', 'david@store.com', 'inactive',
 TO_DATE('2024-01-11','YYYY-MM-DD'), 38000, 1001);

INSERT INTO cs_employees VALUES 
(1005, 104, 'Eva', 'Martinez', 'eva@store.com', 'active',
 TO_DATE('2024-02-20','YYYY-MM-DD'), 60000, 1001);
-- new
-- EDIT: inactive i.e. used to be employeed. Cashiers are a fast turnover position.
INSERT INTO cs_employees VALUES 
(1006, 105, 'Flynn', 'McCarthy', 'flynn@store.com', 'inactive',
 TO_DATE('2024-04-05','YYYY-MM-DD'), 60000, 1001);
-- new
-- let's say they didn't need a dedicated custodian until now.
INSERT INTO cs_employees VALUES 
(1007, 106, 'Gregory', 'Gregson', 'gregory@store.com', 'active',
 TO_DATE('2024-03-20','YYYY-MM-DD'), 60000, 1001);
-- new
-- inactive i.e. used to be employeed. Cashiers are a fast turnover position.
INSERT INTO cs_employees VALUES 
(1008, 105, 'Holly', 'Forester', 'holly@store.com', 'inactive',
 TO_DATE('2024-10-03','YYYY-MM-DD'), 60000, 1001);
-- new
-- newest cashier
INSERT INTO cs_employees VALUES 
(1009, 105, 'Iris', 'Zhang', 'iris@store.com', 'active',
 TO_DATE('2024-01-27','YYYY-MM-DD'), 60000, 1001);

-- ADDRESS TABLE
INSERT INTO cs_address VALUES (3001, 55, 'Main St', 'Toronto', 'Ontario', 'M4B1A1', 'CA');
INSERT INTO cs_address VALUES (3002, 21, 'Queen St', 'Toronto', 'Ontario', 'M5V2T6', 'CA');
INSERT INTO cs_address VALUES (3003, 110, 'King St', 'Toronto', 'Ontario', 'M6K3M2', 'CA');
INSERT INTO cs_address VALUES (3004, 88, 'Yonge St', 'Toronto', 'Ontario', 'M2N5S3', 'CA');
INSERT INTO cs_address VALUES (3005, 30, 'Bloor St', 'Toronto', 'Ontario', 'M4W1A8', 'CA');
INSERT INTO cs_address VALUES (3006, 742, 'Dundas St W', 'Toronto', 'Ontario', 'M6J1T7', 'CA');
INSERT INTO cs_address VALUES (3007, 120, 'Spadina Ave', 'Toronto', 'Ontario', 'M5T2C2', 'CA');
INSERT INTO cs_address VALUES (3008, 550, 'Bay St', 'Toronto', 'Ontario', 'M5G2K8', 'CA');
INSERT INTO cs_address VALUES (3009, 95, 'Front St E', 'Toronto', 'Ontario', 'M5E1T4', 'CA');
INSERT INTO cs_address VALUES (3010, 300, 'College St', 'Toronto', 'Ontario', 'M5T1R9', 'CA');

-- CUSTOMERS TABLE
INSERT INTO cs_customers VALUES (4001, 3001, 'John', 'Doe', 'johndoe@mail.com', 416555111);
INSERT INTO cs_customers VALUES (4002, 3002, 'Mary', 'Smith', 'marysmith@mail.com', 416555222);
INSERT INTO cs_customers VALUES (4003, 3003, 'Kevin', 'Brown', 'kevinb@mail.com', 416555333);
-- EDIT: placing null values for names. Let's say all cash customer are treated as one being
INSERT INTO cs_customers VALUES (4004, NULL, NULL, NULL, NULL, NULL);  -- cash customer allowed 
INSERT INTO cs_customers VALUES (4005, 3004, 'Sarah', 'Nguyen', 'snguyen@mail.com', 416555444);

-- MANUFACTURER TABLE
INSERT INTO cs_manufacturer VALUES (5001, 3006, 'Nike Canada', 'contact@nike.com', 416777100, 'active');
INSERT INTO cs_manufacturer VALUES (5002, 3007, 'Adidas Inc', 'service@adidas.com', 416777200, 'active');
INSERT INTO cs_manufacturer VALUES (5003, 3008, 'Zara Ltd', 'support@zara.com', 416777300, 'active');
INSERT INTO cs_manufacturer VALUES (5004, 3009, 'Hollister Co', 'info@hm.com', 416777400, 'active');
INSERT INTO cs_manufacturer VALUES (5005, 3010, 'Uniqlo Japan', 'sales@uniqlo.com', 416777500, 'active');

-- BRAND TABLE
INSERT INTO cs_brand VALUES (6001, 5001, 'Air Jordan', 'active');
INSERT INTO cs_brand VALUES (6002, 5002, 'Adidas Originals', 'active');
INSERT INTO cs_brand VALUES (6003, 5003, 'Zara Basics', 'active');
INSERT INTO cs_brand VALUES (6004, 5004, 'Hollister Studio', 'active');
INSERT INTO cs_brand VALUES (6005, 5005, 'Uniqlo AIRism', 'active');
INSERT INTO cs_brand VALUES (6006, 5005, 'Uniqlo HEATTECH', 'active'); -- new

-- PRODUCT TABLE
INSERT INTO cs_product VALUES 
(7001, 6001, 'Jordan Hoodie', TO_DATE('2024-05-10','YYYY-MM-DD'), 'top');
INSERT INTO cs_product VALUES 
(7002, 6002, 'Adidas Shorts', TO_DATE('2024-06-01','YYYY-MM-DD'), 'bottom');
INSERT INTO cs_product VALUES 
(7003, 6003, 'Zara Dress', TO_DATE('2024-08-15','YYYY-MM-DD'), 'dress');
INSERT INTO cs_product VALUES 
(7004, 6005, 'AIRism T-Shirt', TO_DATE('2024-09-01','YYYY-MM-DD'), 'top');
INSERT INTO cs_product VALUES 
(7005, 6001, 'Jordan Cap', TO_DATE('2024-10-05','YYYY-MM-DD'), 'accessories');
INSERT INTO cs_product VALUES 
(7006, 6005, 'HEATTECH Leggings', TO_DATE('2024-11-09','YYYY-MM-DD'), 'bottom');
-- note that id 6004 i.e. 'Hollister Studio' has no products. we can say store is interested but not selected products yet

-- PRODUCT VARIANT TABLE
-- Jordan Hoodie
INSERT INTO cs_productVariant VALUES (8001, 7001, 'red',   'u', 'm', 45.99, 300);
INSERT INTO cs_productVariant VALUES (8002, 7001, 'red',   'u', 'l', 45.99, 300); -- new
INSERT INTO cs_productVariant VALUES (8003, 7001, 'red',   'u', 'xl', 45.99, 300); --new
-- Adidas Shorts
INSERT INTO cs_productVariant VALUES (8004, 7002, 'black', 'm', 'l', 34.99, 250);
INSERT INTO cs_productVariant VALUES (8005, 7002, 'grey',  'm', 'l', 34.99, 250); -- new
-- Zara Dress
INSERT INTO cs_productVariant VALUES (8006, 7003, 'white', 'f', 's', 59.99, 400);
INSERT INTO cs_productVariant VALUES (8007, 7003, 'white', 'f', 'm', 59.99, 400); -- new
INSERT INTO cs_productVariant VALUES (8008, 7003, 'black', 'f', 's', 59.99, 400); -- new
INSERT INTO cs_productVariant VALUES (8009, 7003, 'black', 'f', 'm', 59.99, 400); -- new
-- AIRism T-Shirt
INSERT INTO cs_productVariant VALUES (8010, 7004, 'blue',  'u', 'm', 19.99, 200);
INSERT INTO cs_productVariant VALUES (8011, 7004, 'orange','u', 'l', 19.99, 200); -- new
INSERT INTO cs_productVariant VALUES (8012, 7004, 'yellow','u', 'xl', 19.99, 200); -- new
INSERT INTO cs_productVariant VALUES (8013, 7004, 'green', 'u', 'xxl', 19.99, 200); -- new
-- Jordan Cap
INSERT INTO cs_productVariant VALUES (8014, 7005, 'black', 'u', 'l', 19.99, 150);
-- HEATTECH Leggings
INSERT INTO cs_productVariant VALUES (8015, 7006, 'black', 'u', 's', 29.99, 150); -- new
INSERT INTO cs_productVariant VALUES (8016, 7006, 'black', 'u', 'm', 29.99, 150); -- new
INSERT INTO cs_productVariant VALUES (8017, 7006, 'black', 'u', 'l', 29.99, 150); -- new

-- INVENTORY TABLE (last_updated after product creation)
-- EDIT: let's have only the inventory clerk and manager update these eh
-- Jordan Hoodie
INSERT INTO cs_inventory VALUES 
(8001, 120, 'active',   TO_DATE('2024-09-01','YYYY-MM-DD'), 1001);
INSERT INTO cs_inventory VALUES 
(8002, 121,  'active',   TO_DATE('2024-09-10','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8003, 129,  'active',   TO_DATE('2024-09-10','YYYY-MM-DD'), 1003);
-- Adidas Shorts
INSERT INTO cs_inventory VALUES 
(8004, 80, 'active',   TO_DATE('2024-10-15','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8005, 99, 'active', TO_DATE('2024-11-01','YYYY-MM-DD'), 1001);
-- Zara Dress
INSERT INTO cs_inventory VALUES 
(8006, 50, 'active',   TO_DATE('2024-10-01','YYYY-MM-DD'), 1001);
INSERT INTO cs_inventory VALUES 
(8007, 68,  'active',   TO_DATE('2024-10-01','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8008, 35,  'active',   TO_DATE('2024-10-01','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8009, 29, 'active',   TO_DATE('2024-10-01','YYYY-MM-DD'), 1003);
-- AIRism T-Shirt
INSERT INTO cs_inventory VALUES 
(8010, 500, 'active', TO_DATE('2024-10-15','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8011, 500, 'active', TO_DATE('2024-10-15','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8012, 500, 'active', TO_DATE('2024-10-15','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8013, 500, 'active', TO_DATE('2024-10-15','YYYY-MM-DD'), 1003);
-- Jordan Cap
INSERT INTO cs_inventory VALUES 
(8014, 500, 'inactive', TO_DATE('2024-11-01','YYYY-MM-DD'), 1001);  -- in stock but not on shop floor yet => inactive
-- HEATTECH Leggings
INSERT INTO cs_inventory VALUES 
(8015, 500, 'active', TO_DATE('2024-10-31','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8016, 500, 'active', TO_DATE('2024-10-31','YYYY-MM-DD'), 1003);
INSERT INTO cs_inventory VALUES 
(8017, 500, 'active', TO_DATE('2024-10-31','YYYY-MM-DD'), 1003);

-- SALES ORDER TABLE (orders in early–mid Nov 2024)
-- EDIT employees are the cashiers, and once the manager
INSERT INTO cs_salesOrder VALUES 
(9001, 4001, 1008, TO_DATE('2024-11-05','YYYY-MM-DD'), 91.98, 'credit');
INSERT INTO cs_salesOrder VALUES 
(9002, 4004, 1008, TO_DATE('2024-11-06','YYYY-MM-DD'), 34.99, 'cash');
INSERT INTO cs_salesOrder VALUES 
(9003, 4002, 1009, TO_DATE('2024-11-07','YYYY-MM-DD'), 80.98, 'credit');
INSERT INTO cs_salesOrder VALUES 
(9004, 4003, 1001, TO_DATE('2024-11-08','YYYY-MM-DD'), 99.97, 'debit');
INSERT INTO cs_salesOrder VALUES 
(9005, 4005, 1009, TO_DATE('2024-11-09','YYYY-MM-DD'), 129.95, 'debit');
INSERT INTO cs_salesOrder VALUES 
(9006, 4004, 1009, TO_DATE('2024-11-09','YYYY-MM-DD'), 19.99, 'cash');

-- SALES ORDER LINE TABLE
INSERT INTO cs_salesOrderLine VALUES (10001, 9001, 8001, 2); -- 2 hoodies
INSERT INTO cs_salesOrderLine VALUES (10002, 9002, 8004, 1); -- 1 shorts
INSERT INTO cs_salesOrderLine VALUES (10003, 9003, 8003, 1); -- 1 hoodie and 1 shorts
INSERT INTO cs_salesOrderLine VALUES (10004, 9003, 8005, 1);
INSERT INTO cs_salesOrderLine VALUES (10006, 9004, 8008, 1); -- 1 dress and 2 leggings (different sizes)
INSERT INTO cs_salesOrderLine VALUES (10007, 9004, 8015, 1); 
INSERT INTO cs_salesOrderLine VALUES (10008, 9004, 8016, 1); 
INSERT INTO cs_salesOrderLine VALUES (10009, 9005, 8010, 2); -- 2 blue/m t-shirts, 1 orange/l t-shirts, 2 shorts of dif colours
INSERT INTO cs_salesOrderLine VALUES (10010, 9005, 8011, 1);
INSERT INTO cs_salesOrderLine VALUES (10011, 9005, 8004, 1);
INSERT INTO cs_salesOrderLine VALUES (10012, 9005, 8005, 1);
INSERT INTO cs_salesOrderLine VALUES (10013, 9006, 8014, 1); -- 1 t-shirt

-- SUPPLY ORDER TABLE
-- order_date, receive_date, last_updated
--EDIT: made it so the Buye employee did most purchases, once by manager
INSERT INTO cs_supplyOrder VALUES 
(11001, 5001, 1005,
 TO_DATE('2024-07-01','YYYY-MM-DD'),   -- ordered
 TO_DATE('2024-07-10','YYYY-MM-DD'),   -- received
 TO_DATE('2024-07-11','YYYY-MM-DD'),   -- last updated
 1000.00, 'credit', 'Y');

INSERT INTO cs_supplyOrder VALUES 
(11002, 5002, 1005,
 TO_DATE('2024-08-15','YYYY-MM-DD'),   -- ordered
 NULL,                                 -- not received yet
 TO_DATE('2024-09-01','YYYY-MM-DD'),   -- last follow-up
 1500.00, 'debit', 'N');

INSERT INTO cs_supplyOrder VALUES 
(11003, 5003, 1005,
 TO_DATE('2024-05-20','YYYY-MM-DD'),   -- ordered
 TO_DATE('2024-06-05','YYYY-MM-DD'),   -- received
 TO_DATE('2024-06-06','YYYY-MM-DD'),   -- last updated
 2200.00, 'credit', 'Y');

INSERT INTO cs_supplyOrder VALUES 
(11004, 5004, 1001,
 TO_DATE('2024-11-01','YYYY-MM-DD'),   -- recently ordered
 NULL,                                 -- still in transit
 NULL,                                 -- no further updates yet
 800.00, 'credit', 'N');

INSERT INTO cs_supplyOrder VALUES 
(11005, 5005, 1005,
 TO_DATE('2024-09-10','YYYY-MM-DD'),   -- ordered
 TO_DATE('2024-09-20','YYYY-MM-DD'),   -- received
 TO_DATE('2024-09-21','YYYY-MM-DD'),   -- last updated
 500.00, 'debit', 'Y');

-- SUPPLY ORDER LINE TABLE
INSERT INTO cs_supplyOrderLine VALUES (12001, 11001, 8001, 100);
INSERT INTO cs_supplyOrderLine VALUES (12002, 11002, 8004, 200);
INSERT INTO cs_supplyOrderLine VALUES (12003, 11003, 8002, 300);
INSERT INTO cs_supplyOrderLine VALUES (12004, 11004, 8003, 150);
INSERT INTO cs_supplyOrderLine VALUES (12005, 11005, 8005, 500);

commit;
