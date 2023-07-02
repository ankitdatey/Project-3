-- To use particular database, double click on it in the schemas box 
-- Insert text values in single/ double quotes 
-- Press ctrl+Enter to run the query
-- To list all the tables
SHOW TABLES;

-- To check columns, data types,info about a particular table
DESCRIBE people;

-- To select the complete data in a table
SELECT *FROM people;

-- To select particular columns in a table
SELECT Salesperson, Team FROM people;

/* Calculations in Queries */
SELECT SaleDate, Amount, Boxes, Amount/Boxes FROM sales;

/*
allias - change the name of column in output
1. use AS
2. use ' column_name '
*/
SELECT SaleDate, Amount, Boxes, Amount/Boxes AS AmountPerBox FROM sales;
SELECT SaleDate, Amount, Boxes, Amount/Boxes 'AmountPerBox' FROM sales;

-- ROUND() is to round up decimal points 
SELECT SaleDate, Amount, Boxes, ROUND(Amount/Boxes,2) 'AmountPerBox' FROM sales;

-- 	WHERE  : used for filtering data
SELECT SaleDate, Amount, Boxes, ROUND(Amount/Boxes,2) AS AmountPerBox FROM sales
WHERE Amount/Boxes > 30; 

SELECT SaleDate, Amount, Boxes FROM sales
WHERE Amount >20000;

/*
ORDER BY : Sorting data in ascending/ descending order
Data will be ordered in ascending order by default
To arrange it in descending order - specify DESC after column name
*/
SELECT SaleDate, Amount, Boxes FROM sales
WHERE Amount >20000
ORDER BY Amount;

SELECT SaleDate, Amount, Boxes FROM sales
WHERE Amount <30
ORDER BY Amount DESC;

/*
multiple conditions can be used in WHERE clause using AND, OR, BETWEEN, IN 
*/

SELECT *FROM sales
WHERE boxes >0 AND boxes<= 5
ORDER BY boxes DESC;

SELECT *FROM sales
WHERE boxes BETWEEN 1 AND  5
ORDER BY boxes DESC;							-- BETWEEN IS INCLUSIVE

SELECT *FROM people
WHERE Team = 'Yummies' OR Team = 'Delish';

SELECT *FROM people
WHERE Team IN ('Yummies','Delish');

SELECT *FROM sales
WHERE Amount> 20000 AND SaleDate >='2022-01-01'
ORDER BY Amount;

-- To select from [particular year
SELECT *FROM sales
WHERE Amount> 20000 AND year(SaleDate) =2022
ORDER BY Amount; 	

-- To select particular weekday
SELECT SaleDate, WEEKDAY(SaleDate) AS SaleOnFriday, Amount FROM sales
WHERE year(SaleDate) =2022 AND WEEKDAY(SaleDate) = 4 AND Amount> 5000
ORDER BY Amount;

/* 
Pattern Matching - LIKE
% for string
_ for single character
*/

SELECT *FROM people 
WHERE Salesperson LIKE '%e';

SELECT *FROM people 
WHERE Salesperson LIKE '_r%';

/* 
Case Statement - For Categarisation 
*/		
SELECT SaleDate, Amount,
	CASE	WHEN Amount< 1000 THEN 'Under 1k'
			WHEN Amount< 5000 THEN 'Under 5k'
			WHEN Amount< 10000 THEN 'Under 10k'
			ELSE '>=10k'
	END AS AmountCategory
FROM sales;


        



