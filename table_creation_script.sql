-- CREATE TABLES
-- example HR_JOBS
CREATE TABLE cs_jobClass
( job_id        NUMBER(3)   CONSTRAINT jobPK        PRIMARY KEY
, job_title     VARCHAR(35) CONSTRAINT jobTitleNN   NOT NULL
, salary_min    NUMBER(6,0)
, salary_max    NUMBER(6,0)
);

-- example hr_employees
CREATE TABLE cs_employees
( employee_id   NUMBER(5)   CONSTRAINT empPK            PRIMARY KEY
, job_id        NUMBER(3)   CONSTRAINT empJobIDFK       REFERENCES cs_jobclass(job_id)
                            CONSTRAINT empJobIDNN       NOT NULL -- FK doesn't guarentee NotNull
, first_name    VARCHAR(30) 
, last_name     VARCHAR(30) CONSTRAINT empLnameNN       NOT NULL
, email         VARCHAR(40) CONSTRAINT empEmailNN       NOT NULL
                            CONSTRAINT empEmailU        UNIQUE
, status        VARCHAR(8)  CONSTRAINT empStatusNN      NOT NULL 
                            CONSTRAINT empStatus        CHECK (status in ('active','inactive'))
, hire_date     DATE        DEFAULT    SYSDATE
                            CONSTRAINT empHireDateNN    NOT NULL 
, salary        NUMBER(8,2) CONSTRAINT empSalary        CHECK (salary > 0) -- no way anyone getting paid 1m+
, manager_id    NUMBER(5)   CONSTRAINT empManagerFK     REFERENCES cs_employees(employee_id)
--                            CONSTRAINT empManagerNN     NOT NULL
);

CREATE TABLE cs_address
( address_id    NUMBER(6)   CONSTRAINT addPK            PRIMARY KEY
, street_num    NUMBER(5)   CONSTRAINT addStreetNumNN   NOT NULL
, street_name   VARCHAR(30) CONSTRAINT addStreetNameNN  NOT NULL
, city_name     VARCHAR(30) CONSTRAINT addCityeNN       NOT NULL
, province      VARCHAR(30) CONSTRAINT addProvinceNN    NOT NULL
, postal_code   VARCHAR(6)  CONSTRAINT addPostalCodeNN  NOT NULL
, country_code  VARCHAR(2)  DEFAULT 'CA'-- assumption is canada
);
-- you cant derive either postal code nor address from each other 100% of the time
-- assumption you dont get combined total of 999,999 customers and manufacturers addresses

CREATE TABLE cs_customers
( customer_id   NUMBER(6)   CONSTRAINT custPK       PRIMARY KEY
, address_id    NUMBER(6)   CONSTRAINT custAddFK    REFERENCES cs_address(address_id) 
                                                    ON DELETE SET NULL
, first_name    VARCHAR(30) 
, last_name     VARCHAR(30) 
, email         VARCHAR(40) CONSTRAINT custEmailU   UNIQUE                            
, phone         NUMBER(9)   CONSTRAINT custPhonelU  UNIQUE 
);
 -- address, customer names, and contact info aren't NotNull since if paid incash, no info pulled

CREATE TABLE cs_manufacturer
( manu_id       NUMBER(4)   CONSTRAINT manuPK       PRIMARY KEY
, address_id    NUMBER(6)   CONSTRAINT manuAddFK    REFERENCES cs_address(address_id)
                            CONSTRAINT manuAddNN    NOT NULL -- as per the 1:M
, manu_name     VARCHAR(30) CONSTRAINT manuNameNN   NOT NULL 
, email         VARCHAR(40) CONSTRAINT manuEmailU   UNIQUE 
                            CONSTRAINT manuEmailNN  NOT NULL
, phone         NUMBER(9)   CONSTRAINT manuPhoneU   UNIQUE 
                            CONSTRAINT manuPhoneNN  NOT NULL
, status        VARCHAR(8)  DEFAULT 'active'
                            CONSTRAINT manuStatus   CHECK (status in ('active','inactive'))
);

CREATE TABLE cs_brand  
( brand_id      NUMBER(5)   CONSTRAINT brandPK          PRIMARY KEY
, manu_id       NUMBER(4)   CONSTRAINT brandManuFK      REFERENCES cs_manufacturer(manu_id)
                            CONSTRAINT brandManuNN      NOT NULL 
, brand_name    VARCHAR(30) CONSTRAINT brandNameNN      NOT NULL
, status        VARCHAR(8)  DEFAULT 'active'
                            CONSTRAINT brandStatus      CHECK (status in ('active','inactive'))
-- , updated_by    NUMBER(5)   CONSTRAINT brandUpdateEmp   REFERENCES cs_employees(employee_id)   
);

CREATE TABLE cs_product
( product_id    NUMBER(6)   CONSTRAINT prodPK           PRIMARY KEY
, brand_id      NUMBER(5)   CONSTRAINT prodBrandFK      REFERENCES cs_brand(brand_id)
                            CONSTRAINT prodBrandNN      NOT NULL
, product_name  VARCHAR(30) CONSTRAINT prodNameNN       NOT NULL
, creation_date DATE        DEFAULT    SYSDATE
, type          VARCHAR(11) CONSTRAINT prodTypeCheck    CHECK (type in ('top','bottom','dress','accessories','innerwear')) -- add more
  -- no description since simpler to just keep a type
);

CREATE TABLE cs_productVariant
( variant_id    NUMBER(6)   CONSTRAINT varPK            PRIMARY KEY
, product_id    NUMBER(6)   CONSTRAINT varProdFK        REFERENCES cs_product(product_id)
                            CONSTRAINT varProdNN        NOT NULL
, main_colour   VARCHAR(7)  CONSTRAINT varColourCheck   CHECK (main_colour in ('red','orange','yellow','green','blue','purple','white','grey','black','rainbow'))
, gender        VARCHAR(1)  CONSTRAINT varGenderCheck   CHECK (gender in ('f','m','u')) -- female, male, unisex
, prod_size     VARCHAR(3)  CONSTRAINT varSizeCheck     CHECK (prod_size in ('xs','s','m','l','xl','xxl')) 
, cost_per      NUMBER(6,2) CONSTRAINT varCostCheck     CHECK (cost_per > 0) 
                            CONSTRAINT varCostNN        NOT NULL 
, weight_g      NUMBER(4)   CONSTRAINT varWeightCheck   CHECK (weight_g > 0) -- if something is > 9,999g i.e. 9.999kg just what?!
);
--ALTER TABLE cs_productVariant MODIFY cost_per NUMBER(6,2)

CREATE TABLE cs_inventory
( variant_id    NUMBER(6)   CONSTRAINT invVarFK         REFERENCES cs_productVariant(variant_id)
                            CONSTRAINT invPK            PRIMARY KEY -- isnt the variant_id enough for uniqueness? since it tracks per each variant
--inventory_id  NUMBER(6)   CONSTRAINT invIDPK          PRIMARY KEY
--                          CONSTRAINT invVarNN         NOT NULL -- remove this if variant_id becomes PK
, quantity      NUMBER(4)   CONSTRAINT invQuantityCheck CHECK (quantity > 0) 
                            CONSTRAINT invQuantityNN    NOT NULL 
, status        VARCHAR(8)  DEFAULT 'active'
                            CONSTRAINT invStatus        CHECK (status in ('active','inactive'))
, last_updated  DATE        DEFAULT    SYSDATE
, updated_by    NUMBER(5)   CONSTRAINT invUpdateEmpFK   REFERENCES cs_employees(employee_id) 
);

CREATE TABLE cs_salesOrder
( sales_id      NUMBER(7)   CONSTRAINT salesPK              PRIMARY KEY
, customer_id   NUMBER(6)   CONSTRAINT salesCustFK          REFERENCES cs_customers(customer_id)
                            CONSTRAINT salesCustNN          NOT NULL
, employee_id   NUMBER(5)   CONSTRAINT salesEmpFK           REFERENCES cs_employees(employee_id) 
                            CONSTRAINT salesEmpNN           NOT NULL
, order_date    DATE        DEFAULT    SYSDATE
                            CONSTRAINT salesDateNN          NOT NULL
, total_cost    NUMBER(8,2) CONSTRAINT salesCostCheck       CHECK (total_cost > 0) 
                            CONSTRAINT salesCostNN          NOT NULL
, payment_type  VARCHAR(6)  CONSTRAINT salesPayTypeCheck    CHECK (payment_type in ('cash','credit','debit')) -- not storing info, so nullable
);
--ALTER TABLE cs_salesOrder MODIFY payment_type VARCHAR(6)

CREATE TABLE cs_salesOrderLine
( sales_orderline_id    NUMBER(7)   CONSTRAINT salesOLPK            PRIMARY KEY
, sales_id              NUMBER(7)   CONSTRAINT salesOLSalesFK       REFERENCES cs_salesOrder(sales_id)
                                    CONSTRAINT salesOLSalesNN       NOT NULL
, variant_id            NUMBER(6)   CONSTRAINT salesOLVarFK         REFERENCES cs_productVariant(variant_id)
                                    CONSTRAINT salesOLVarNN         NOT NULL
, quantity              NUMBER(2)   CONSTRAINT salesOLQuantityNN    NOT NULL
                                    CONSTRAINT salesOLQuantityCheck CHECK (quantity > 0) -- no way more than 99 items each 
);

CREATE TABLE cs_supplyOrder
( supply_order_id   NUMBER(6)   CONSTRAINT supplyPK             PRIMARY KEY
, manu_id           NUMBER(4)   CONSTRAINT supplyManuFK         REFERENCES cs_manufacturer(manu_id)
                                CONSTRAINT supplyManuNN         NOT NULL
, employee_id       NUMBER(5)   CONSTRAINT supplyEmpFK          REFERENCES cs_employees(employee_id) 
                                CONSTRAINT supplyEmpNN          NOT NULL
, order_date        DATE        DEFAULT    SYSDATE  -- can be null bc not yet (confirmed) ordered
, receive_date      DATE        DEFAULT    SYSDATE  -- can be null bc not received yet
, last_updated      DATE
, total_cost        NUMBER(8,2) CONSTRAINT supplyCostCheck      CHECK (total_cost > 0) 
                                CONSTRAINT supplyCostNN         NOT NULL
, payment_type      VARCHAR(6)  CONSTRAINT supplyPayTypeCheck   CHECK (payment_type in ('credit','debit'))
, paid_status       VARCHAR(1)  CONSTRAINT supplyPaidCheck      CHECK (paid_status in ('Y','N')) -- is it paid?
);
--ALTER TABLE cs_supplyOrder MODIFY payment_type VARCHAR(6)

CREATE TABLE cs_supplyOrderLine
( supply_orderline_id   NUMBER(6)   CONSTRAINT supplyOLPK               PRIMARY KEY
, supply_order_id       NUMBER(6)   CONSTRAINT supplyOLorderFK          REFERENCES cs_supplyOrder(supply_order_id)
                                    CONSTRAINT supplyOLorderNN          NOT NULL
, variant_id            NUMBER(6)   CONSTRAINT supplyOLVarFK            REFERENCES cs_productVariant(variant_id)
                                    CONSTRAINT supplyOLVarNN            NOT NULL
, quantity              NUMBER(4)   CONSTRAINT supplyOLQuantityNN       NOT NULL
                                    CONSTRAINT supplyOLQuantityCheck    CHECK (quantity > 0)
);




