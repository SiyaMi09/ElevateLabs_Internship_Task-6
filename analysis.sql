CREATE TABLE public.orders_superstore (
    row_id         INT,
    order_id       TEXT,
    order_date     DATE,
    ship_date      DATE,
    ship_mode      TEXT,
    customer_id    TEXT,
    customer_name  TEXT,
    segment        TEXT,
    country        TEXT,
    city           TEXT,
    state          TEXT,
    postal_code    TEXT,
    region         TEXT,
    product_id     TEXT,
    category       TEXT,
    sub_category   TEXT,
    product_name   TEXT,
    sales          NUMERIC(10,2),
    quantity       INT,
    discount       NUMERIC(5,2),
    profit         NUMERIC(10,2)
);

INSERT INTO public.orders_superstore
(row_id, order_id, order_date, ship_date, ship_mode, customer_id, customer_name, segment, country, city, state, postal_code, region, product_id, category, sub_category, product_name, sales, quantity, discount, profit)
VALUES
(1, 'CA-2024-1001', '2024-01-05', '2024-01-10', 'Second Class', 'C001', 'Alice Smith', 'Consumer', 'United States', 'New York', 'New York', '10001', 'East', 'FUR-CH-1001', 'Furniture', 'Chairs', 'Office Chair', 250.00, 2, 0.10, 50.00),
(2, 'CA-2024-1002', '2024-01-15', '2024-01-18', 'Standard Class', 'C002', 'Bob Lee', 'Corporate', 'United States', 'Chicago', 'Illinois', '60601', 'Central', 'TEC-MO-1002', 'Technology', 'Monitors', '27-inch Monitor', 300.00, 1, 0.05, 80.00),
(3, 'CA-2024-1003', '2024-02-05', '2024-02-09', 'First Class', 'C003', 'Charlie Davis', 'Home Office', 'United States', 'San Francisco', 'California', '94105', 'West', 'OFF-PA-1003', 'Office Supplies', 'Paper', 'Printer Paper', 50.00, 5, 0.00, 15.00),
(4, 'CA-2024-1004', '2024-02-20', '2024-02-25', 'Second Class', 'C004', 'Dana Miller', 'Consumer', 'United States', 'Boston', 'Massachusetts', '02108', 'East', 'FUR-TA-1004', 'Furniture', 'Tables', 'Conference Table', 500.00, 1, 0.15, 120.00),
(5, 'CA-2024-1005', '2024-03-01', '2024-03-06', 'Standard Class', 'C005', 'Ethan Clark', 'Corporate', 'United States', 'Houston', 'Texas', '77001', 'South', 'TEC-PH-1005', 'Technology', 'Phones', 'Smartphone', 700.00, 2, 0.20, 200.00),
(6, 'CA-2024-1006', '2024-03-15', '2024-03-20', 'First Class', 'C006', 'Fiona White', 'Home Office', 'United States', 'Seattle', 'Washington', '98101', 'West', 'OFF-ST-1006', 'Office Supplies', 'Storage', 'Filing Cabinet', 150.00, 1, 0.05, 40.00);

select * from orders_superstore;

CREATE TABLE public.orders_task6 AS
SELECT
    order_id,
    order_date,
    sales AS amount,
    product_id
FROM public.orders_superstore;

select * from orders_task6;

--Monthly revenue & order volume
SELECT
    EXTRACT(YEAR FROM order_date)::INT  AS year,
    EXTRACT(MONTH FROM order_date)::INT AS month,
    SUM(COALESCE(amount, 0))            AS monthly_revenue,
    COUNT(DISTINCT order_id)            AS order_volume
FROM public.orders_task6
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

--Top 3 months by revenue
WITH monthly AS (
    SELECT
        EXTRACT(YEAR FROM order_date)::INT  AS year,
        EXTRACT(MONTH FROM order_date)::INT AS month,
        SUM(COALESCE(amount, 0))            AS monthly_revenue,
        COUNT(DISTINCT order_id)            AS order_volume
    FROM public.orders_task6
    GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
)
SELECT *
FROM monthly
ORDER BY monthly_revenue DESC
LIMIT 3;

--Shows yearly performance
SELECT
    EXTRACT(YEAR FROM order_date)::INT  AS year,
    SUM(COALESCE(amount, 0))            AS yearly_revenue,
    COUNT(DISTINCT order_id)            AS yearly_order_volume
FROM public.orders_task6
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;

--Average Order Value (AOV) Per Month
SELECT
    EXTRACT(YEAR FROM order_date)::INT  AS year,
    EXTRACT(MONTH FROM order_date)::INT AS month,
    ROUND(SUM(COALESCE(amount, 0)) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM public.orders_task6
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

--Top 5 Products by Total Sales
SELECT
    product_id,
    SUM(COALESCE(amount, 0)) AS total_sales
FROM public.orders_task6
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;

