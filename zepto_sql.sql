drop table if exists zepto;


CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

--COUNTING THE ROWS
SELECT COUNT(*) FROM zepto;


--SAMPLE DATA
SELECT * FROM zepto 
LIMIT 10;


--NULL VALUES
SELECT * FROM zepto
WHERE category IS NULL
OR 
name IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
availablequantity IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
outofstock IS NULL
OR
name IS NULL
OR
quantity IS NULL;


-- different products 
SELECT DISTINCT category 
FROM zepto
ORDER BY CATEGORY;



--PRODUCTS IN SOCK VS OUT OF STOCK
SELECT outOfstock, COUNT(sku_id)
FROM zepto
GROUP BY outOfstock;

--PRODUCT NAME OCCURING MULTIPLE TIME

SELECT name, COUNT(sku_id) AS "NUMBER OF OCCURENCE"
FROM zepto
GROUP BY name 
HAVING COUNT(sku_id)>1
ORDER BY COUNT(sku_id) DESC;


--data cleaning

--products with price 0
SELECT name FROM zepto 
WHERE mrp = 0 
OR discountedSellingPrice = 0;


--delete the values

DELETE FROM zepto
WHERE mrp = 0;


--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

--business QUESTION
-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, discountedSellingPrice 
FROM zepto
ORDER BY discountedSellingPrice DESC
LIMIT 10;

-- Q2. What are the products with High MRP but Out of Stock?
SELECT name, mrp, outofstock 
FROM zepto
WHERE outofstock = true
ORDER BY mrp DESC;

-- Q3. Calculate Estimated Revenue for each category.

SELECT category, SUM(discountedsellingprice * quantity) AS total_revenue
FROM zepto
GROUP BY category;


-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT name, mrp, discountpercent
FROM zepto
WHERE mrp > 500
AND 
discountpercent < 10;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, AVG(discountpercent) 
FROM zepto
GROUP BY category
ORDER BY AVG(discountpercent) DESC
LIMIT 5;


-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT name, mrp, ROUND(mrp / weightInGms, 2) 
AS "mrppergram"
FROM zepto
WHERE weightingms> 100
ORDER BY mrppergram ASC;

-- Q7. Group the products into categories like Low, Medium, Bulk.
SELECT 
    name,
    "weightingms",
    CASE 
        WHEN "weightingms" < 1000 THEN 'LOW'
        WHEN "weightingms" < 5000 THEN 'MEDIUM'
        ELSE 'BULK'
    END AS weight_category
FROM zepto;


-- Q8. What is the Total Inventory Weight Per Category.
SELECT category, 
SUM(weightingms * availablequantity) AS "total_weight"
FROM zepto
GROUP BY category
ORDER BY total_weight;

