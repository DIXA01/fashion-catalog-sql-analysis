SELECT name FROM sqlite_master WHERE type='table';
DROP VIEW IF EXISTS product_items_fixed;
CREATE VIEW product_items_fixed AS
SELECT
  field1              AS product_id,
  field2              AS product_name,
  field3              AS category,
  field4              AS brand,
  field5              AS color,
  field6              AS size,
  CAST(field7 AS REAL) AS catalog_price,
  CAST(field8 AS REAL) AS cost_price,
  field9              AS gender
FROM product_items;

SELECT * FROM product_items_fixed LIMIT 5;

SELECT
  category,
  COUNT(*) AS num_products
FROM product_items_fixed
GROUP BY category
ORDER BY num_products DESC;

SELECT
  category,
  ROUND(AVG(catalog_price), 2) AS avg_catalog_price,
  ROUND(AVG(cost_price),  2)   AS avg_cost,
  ROUND(AVG(catalog_price - cost_price), 2) AS avg_abs_margin
FROM product_items_fixed
GROUP BY category
ORDER BY avg_abs_margin DESC;

SELECT
  gender,
  COUNT(*) AS num_products
FROM product_items_fixed
GROUP BY gender
ORDER BY num_products DESC;

SELECT
  brand,
  COUNT(*) AS num_products
FROM product_items_fixed
GROUP BY brand
ORDER BY num_products DESC
LIMIT 10;

WITH src AS (
  SELECT catalog_price FROM product_items_fixed
)
SELECT
  CASE
    WHEN catalog_price < 20 THEN '<20'
    WHEN catalog_price < 40 THEN '20–39.99'
    WHEN catalog_price < 60 THEN '40–59.99'
    WHEN catalog_price < 80 THEN '60–79.99'
    ELSE '80+'
  END AS price_band,
  COUNT(*) AS sku_count
FROM src
GROUP BY price_band
ORDER BY
  CASE price_band
    WHEN '<20' THEN 1
    WHEN '20–39.99' THEN 2
    WHEN '40–59.99' THEN 3
    WHEN '60–79.99' THEN 4
    ELSE 5
  END;
  
  SELECT
  category,
  ROUND(AVG(
    CASE WHEN catalog_price > 0
         THEN 100.0 * (catalog_price - cost_price) / catalog_price
    END
  ), 2) AS avg_margin_pct
FROM product_items_fixed
GROUP BY category
ORDER BY avg_margin_pct DESC;
