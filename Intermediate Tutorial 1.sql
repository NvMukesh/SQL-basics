# MIN nad MAX
# The MIN() function returns the smallest value of the selected column.
# SELECT MIN(column_name) FROM table_name WHERE condition;
# The MAX() function returns the largest value of the selected column.
# SELECT MIN(column_name) FROM table_name WHERE condition;

use mkdb;
select * from products;
select min(unitPrice) as smallest_price from products;
select max(unitPrice) as largest_price from products;
select min(unitPrice) as smallest_price, max(unitPrice) as largest_price from products;

# Count, AVG, SUM functions

# The COUNT() function returns the number of rows that matches a specified criterion.
select count(productID) from products;
select count(*) from products where unitPrice = 18;
# The AVG() function returns the average value of a numeric column. 
select avg(unitPrice) from products;
# The SUM() function returns the total sum of a numeric column. 
select sum(quantity) from orderdetails;

# LIKE operator
#The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
# There are two wildcards often used in conjunction with the LIKE operator:
# The percent sign (%) represents zero, one, or multiple characters
# The underscore sign (_) represents one, single character
# The percent sign and the underscore can also be used in combinations!

# SELECT column1, column2, ... FROM table_name WHERE columnN LIKE pattern;

# LIKE Operator	Description
# WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
# WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
# WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
# WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
# WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
# WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
# WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"

select * from cust;
select * from cust where contactName like'a%';
select * from cust where contactName like'%a';
select * from cust where contactName like'%or%';
select * from cust where contactName like'_r%';
select * from cust where contactName not like'%a';

# A wildcard character is used to substitute one or more characters in a string.

select * from cust where city like '_ondon';
select * from cust where city like '_o_d_n';

# In operator
# The IN operator allows you to specify multiple values in a WHERE clause.
# The IN operator is a shorthand for multiple OR conditions.
# SELECT column_name(s) FROM table_name WHERE column_name IN (value1, value2, ...);

# SELECT column_name(s) FROM table_name WHERE column_name IN (SELECT STATEMENT);
select * from cust;
select * from cust where country in ('Germany','india','Mexico');
select * from cust where country not in ('Germany','india','Mexico');
select * from suppliers;
select * from cust where country in (select country from suppliers);

# BETWEEN Operator
# The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
# The BETWEEN operator is inclusive: begin and end values are included.
# SELECT column_name(s) FROM table_name WHERE column_name BETWEEN value1 AND value2;

select * from products where unitPrice between 10 and 20;
select * from products where unitPrice not between 10 and 20;
select * from products where unitPrice not between 10 and 20  and categoryID in (1,2);

select * from products where productName between 'Northwoods Cranberry Sauce' and 'Vegie-spread' order by productName;
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

# Aliases
# Aliases are used to give a table, or a column in a table, a temporary name.
# Aliases are often used to make column names more readable.
# An alias only exists for the duration of that query.
# An alias is created with the AS keyword.
# SELECT column_name AS alias_name FROM table_name;
# SELECT column_name(s) FROM table_name AS alias_name;
use mkdb;
select * from customers;
SELECT customerID AS ID, contactName AS customer from customers;

SELECT contactName AS customer, contactName AS "Contact Person" FROM customers;

SELECT contactName, CONCAT_WS(', ', address, postalCode, city, country) AS Address FROM customers;

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

# JOIN clause
# A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

# The INNER JOIN keyword selects records that have matching values in both tables.
# SELECT column_name(s) FROM table1 INNER JOIN table2 ON table1.column_name = table2.column_name;

select orders.OrderID, Customers.CustomerName, orders.OrderDate
from orders 
inner join Customers on orders.CustomerID = Customers.CustomerID;

select o.OrderID, Customers.CustomerName, o.OrderDate from orders as o inner join customers on o.CustomerID = customers.CustomerID;

# inner join more than 2 table
select orders.OrderID, customers.CustomerName, shippers.ShipperName
from ((orders
inner join customers on orders.CustomerID = customers.CustomerID)
inner join shippers on orders.shipperID = shippers.ShipperID);

# The LEFT JOIN keyword returns all records from the left table (table1), 
# and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.
# # SELECT column_name(s) FROM table1 left JOIN table2 ON table1.column_name = table2.column_name;

select customers.CustomerName, orders.OrderID
from customers
left join orders on customers.CustomerID = orders.CustomerID
order by customers	.CustomerName;

# Right Join
# The RIGHT JOIN keyword returns all records from the right table (table2), 
# and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.
# # SELECT column_name(s) FROM table1 right JOIN table2 ON table1.column_name = table2.column_name;

select  orders.OrderID, employees.LastName, employees.FirstName
from orders
right join employees on orders.EmployeeID = employees.EmployeeID
order by orders.OrderID;

# Full Join 
# The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.
# Tip: FULL OUTER JOIN and FULL JOIN are the same.
## SELECT column_name(s) FROM table1 FULL OUTER JOIN table2 ON table1.column_name = table2.column_name WHERE condition;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

# Self Join
# A self join is a regular join, but the table is joined with itself.
## SELECT column_name(s) FROM table1 T1, table1 T2 WHERE condition;

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

# The UNION operator is used to combine the result-set of two or more SELECT statements.

#Every SELECT statement within UNION must have the same number of columns
#The columns must also have similar data types
#The columns in every SELECT statement must also be in the same order
## SELECT column_name(s) FROM table1 UNION SELECT column_name(s) FROM table2;
## SELECT column_name(s) FROM table1 UNION all SELECT column_name(s) FROM table2;

select City from Customers
union
select City from Suppliers order by City;
select City from Customers
union all
select City from Suppliers;

select City, Country from Customers
where Country = "Germany"
union
select City, Country from Suppliers
where Country = "Germany";

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;

# GROUP BY
# The GROUP BY statement groups rows that have the same values into summary rows,
# like "find the number of customers in each country".
# The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) 
# to group the result-set by one or more columns.
## SELECT column_name(s) FROM table_name WHERE condition GROUP BY column_name(s) ORDER BY column_name(s);

select count(CustomerID), Country from Customers group by Country;
select count(CustomerID), Country from Customers group by Country order by count(CustomerID) desc;

select shippers.ShipperName, count(orders.OrderId) from orders
left join shippers on orders.ShipperID = orders.ShipperID
group by ShipperName;

# HAVING 
# The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
 select count(CustomerID), Country from Customers group by Country having count(CustomerID)>5 order by count(CustomerID);
 
 select employees.LastName, count(orders.OrderID) as numberoforders
 from (orders inner join employees on orders.EmployeeID = employees.EmployeeID)
 group by LastName
 having count(orders.OrderID) > 10;
 
 # EXIST
 # The EXISTS operator is used to test for the existence of any record in a subquery.
 # The EXISTS operator returns TRUE if the subquery returns one or more records.
## SELECT column_name(s) FROM table_name WHERE EXISTS (SELECT column_name FROM table_name WHERE condition);

select SupplierName from suppliers
where exists(select ProductName from products where products.SupplierID = suppliers.supplierID and Price < 20);

select ProductName, price from products where Price < 20;

# ANY and ALL operator
# The ANY operator:
# returns a boolean value as a result
# returns TRUE if ANY of the subquery values meet the condition
# ANY means that the condition will be true if the operation is true for any of the values in the range.
## SELECT column_name(s) FROM table_name WHERE column_name operator ANY (SELECT column_name FROM table_name WHERE condition);\\
SELECT ProductName
FROM Products
WHERE ProductID = ANY
  (SELECT ProductID
  FROM Order_Details
  WHERE Quantity = 10);

SELECT ProductName
FROM Products
WHERE ProductID = ALL
  (SELECT ProductID
  FROM Order_Details
  WHERE Quantity = 10);
  
# SELECT INTO
# The SELECT INTO statement copies data from one table into a new table.
## SELECT * INTO newtable [IN externaldb] FROM oldtable WHERE condition;
## SELECT column1, column2, column3, ... INTO newtable [IN externaldb] FROM oldtable WHERE condition;

select * into customerbackup2017 from customers;
SELECT * INTO CustomersBackup2017
FROM Customers;
 create table CustomersBackup2017;
SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers;

# INSERT INTO SELECT
# The INSERT INTO SELECT statement copies data from one table and inserts it into another table.
# The INSERT INTO SELECT statement requires that the data types in source and target tables match.
## INSERT INTO table2 SELECT * FROM table1 WHERE condition;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;
select * from customers;

# The CASE expression goes through conditions and returns a value when the first condition is met 
# (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result.
# If no conditions are true, it returns the value in the ELSE clause.
# If there is no ELSE part and no conditions are true, it returns NULL.
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM Order_Details;

# SQL IFNULL(), ISNULL(), COALESCE(), and NVL() Functions
SELECT ProductName, Unit * (Price  + Unit)
FROM Products;

SELECT ProductName, Price * (Unit + IFNULL(Unit, 0))
FROM Products;

/*
SQL Arithmetic Operators
Operator	Description	Example
+	Add	
-	Subtract	
*	Multiply	
/	Divide	
%	Modulo	
SQL Bitwise Operators
Operator	Description
&	Bitwise AND
|	Bitwise OR
^	Bitwise exclusive OR
SQL Comparison Operators
Operator	Description	Example
=	Equal to	
>	Greater than	
<	Less than	
>=	Greater than or equal to	
<=	Less than or equal to	
<>	Not equal to	
SQL Compound Operators
Operator	Description
+=	Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals
&=	Bitwise AND equals
^-=	Bitwise exclusive equals
|*=	Bitwise OR equals
SQL Logical Operators
Operator	Description	Example
ALL	TRUE if all of the subquery values meet the condition	
AND	TRUE if all the conditions separated by AND is TRUE	
ANY	TRUE if any of the subquery values meet the condition	
BETWEEN	TRUE if the operand is within the range of comparisons	
EXISTS	TRUE if the subquery returns one or more records	
IN	TRUE if the operand is equal to one of a list of expressions	
LIKE	TRUE if the operand matches a pattern	
NOT	Displays a record if the condition(s) is NOT TRUE	
OR	TRUE if any of the conditions separated by OR is TRUE	
SOME	TRUE if any of the subquery values meet the condition
*/