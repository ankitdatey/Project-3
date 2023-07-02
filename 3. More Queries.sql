/* 
Join 
SalesPerson column from people table
and Amount column from sales table 
using common column SPID
and show in ascending order by SalesPerson
*/

SELECT p.SPID, p.Salesperson, s.Amount
FROM people as p
JOIN sales s
ON p.SPID= s.SPID
WHERE s.Amount >20000
ORDER BY p.SPID;

-- Join Using WHERE 
SELECT p.SPID, p.Salesperson, s.Amount
FROM people as p, sales s
WHERE p.SPID= s.SPID
AND s.Amount >20000
ORDER BY p.SPID;

SELECT s.SaleDate, s.Amount, pr.Product
FROM sales s
JOIN products pr
ON pr.pid= s.pid;

/* Multiple Joins */
SELECT p.SPID, p.Salesperson, pr.Product, s.Amount
FROM people as p
JOIN sales s ON p.SPID= s.SPID
JOIN products pr ON pr.pid= s.pid
WHERE s.Amount >20000
ORDER BY p.SPID;

SELECT p.SPID, p.Salesperson, pr.Product, g.Geo, s.Amount
FROM people as p
JOIN sales s ON p.SPID= s.SPID
JOIN products pr ON pr.pid= s.pid
JOIN geo g ON g.geoid=s.geoid
WHERE s.Amount >20000 
ORDER BY p.SPID;

/* 
GROUP BY and Aggregations 
*/
SELECT g.GeoID, g.Geo, SUM(Amount) AS Amount, SUM(Boxes) AS Boxes
FROM sales AS s
JOIN geo AS G
ON s.GeoID= g.GeoID
GROUP BY GeoID
ORDER BY GeoID;



