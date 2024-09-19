--Googl Colab Link: https://colab.research.google.com/drive/1-QUTtOA4gTbP9_g11LLZVvpZxXjGAOil?usp=sharing

-- Write your query for task 1 in this cell
SELECT COUNT(*) AS missing_year
FROM products
WHERE year_added IS NULL


SELECT 
    product_id, 
    COALESCE(product_type, 'Unknown') AS product_type,
    COALESCE(brand, 'Unknown') AS brand,
    coalesce(round(cast(left(weight,position(' ' in weight)-1) as numeric),2),(SELECT round(cast (percentile_disc(0.5) WITHIN GROUP (ORDER BY weight) as numeric),2) FROM products)) as weight,
    COALESCE(round(cast(price as numeric),2),(SELECT round(cast (percentile_disc(0.5) WITHIN GROUP (ORDER BY price) as numeric),2) FROM products)) AS price,
    COALESCE(average_units_sold, 0) AS average_units_sold,
    COALESCE(year_added, 2022) AS year_added,
    COALESCE(UPPER(stock_location), 'Unknown') AS stock_location
FROM 
    products;

-- Write your query for task 3 in this cell
SELECT product_type,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM clean_data
GROUP BY product_type;


-- Write your query for task 4 in this cell
SELECT
  product_id,
  price,
  average_units_sold
FROM products
WHERE (product_type = 'Meat' OR product_type = 'Dairy')
  AND average_units_sold > 10;
