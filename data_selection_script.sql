-- Show all employees that are store managers
SELECT first_name, last_name, job_title
FROM cs_employees e
JOIN cs_jobClass j
ON e.job_id = j.job_id
WHERE j.job_title = 'Store Manager';

-- Show all active employees that have been working since March 1, 2024.
-- Sorted in ascending order by date.
SELECT first_name, last_name, status, hire_date
FROM cs_employees
WHERE status = 'active' AND hire_date > TO_DATE('2024-03-01','YYYY-MM-DD')
ORDER BY hire_date ASC;

-- Show the quantity of each product in the inventory
SELECT p.product_name, pv.main_colour, pv.gender, pv.prod_size, i.quantity
FROM cs_inventory i
JOIN cs_productVariant pv
ON i.variant_id = pv.variant_id
JOIN cs_product p
ON pv.product_id = p.product_id;

-- Show information about each order between Nov 1, 2024 and Nov 8, 2024
SELECT c.first_name, c.last_name, so.order_date, p.product_name,
pv.main_colour, pv.gender, pv.prod_size, sol.quantity, so.total_cost, so.payment_type
FROM cs_salesOrder so
JOIN cs_customers c
ON so.customer_id = c.customer_id
JOIN cs_salesOrderLine sol
ON so.sales_id = sol.sales_id
JOIN cs_productVariant pv
ON sol.variant_id = pv.variant_id
JOIN cs_product p
ON pv.product_id = p.product_id
WHERE so.order_date BETWEEN TO_DATE('2024-11-01','YYYY-MM-DD') AND TO_DATE('2024-11-08','YYYY-MM-DD')
ORDER BY so.order_date ASC;

-- Show the manufacturer of each brand
SELECT brand_name, manu_name, email, phone
FROM cs_manufacturer m
JOIN cs_brand b
ON m.manu_id = b.manu_id;


-- For each month, show the sales received, supply paid, and the net revenue
SELECT 
    NVL(s.month, p.month) AS month,
    NVL(s.sales_received, 0) AS sales_received,
    NVL(p.supply_paid, 0) AS supply_paid,
    NVL(s.sales_received, 0) - NVL(p.supply_paid, 0) AS net_revenue
FROM (
    SELECT TO_CHAR(order_date, 'YYYY-MM') AS month,
           SUM(total_cost) AS sales_received
    FROM cs_salesOrder
    GROUP BY TO_CHAR(order_date, 'YYYY-MM')
) s
FULL OUTER JOIN (
    SELECT TO_CHAR(order_date, 'YYYY-MM') AS month,
           SUM(total_cost) AS supply_paid
    FROM cs_supplyOrder
    GROUP BY TO_CHAR(order_date, 'YYYY-MM')
) p
ON s.month = p.month
ORDER BY month;
