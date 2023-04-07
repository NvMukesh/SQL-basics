# What is SQL?
# SQL is the standard language for dealing with Relational Databases.

# SQL is used to insert, search, update, and delete database records.

#SELECT - extracts data from a database
#UPDATE - updates data in a database
#DELETE - deletes data from a database
#INSERT INTO - inserts new data into a database
#CREATE DATABASE - creates a new database
#ALTER DATABASE - modifies a database
#CREATE TABLE - creates a new table
#ALTER TABLE - modifies a table
#DROP TABLE - deletes a table
#CREATE INDEX - creates an index (search key)
#DROP INDEX - deletes an index

# Select Database
use mkdb;
show tables;
# SELECT column1, column2, ... FROM table_name;
# SELECT * FROM table_name;
# The SELECT statement is used to select data from a database.
select * from cust;
# slecting specific columnns
select contactName, city, country from cust;

# Distinct
# The SELECT DISTINCT statement is used to return only distinct (different) values.
select distinct country from cust;
select count(distinct country) from cust;

# Where
# The WHERE clause is used to filter records.
# The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!
# SELECT column1, column2, ... FROM table_name WHERE condition;

select * from cust where country = 'mexico';
select * from cust where customerID = 2;

#Operators in The WHERE Clause
#The following operators can be used in the WHERE clause:

#Operator	Description	Example
# =	Equal	
# >	Greater than	
# <	Less than	
# >=	Greater than or equal	
# <=	Less than or equal	
# <>	Not equal. Note: In some versions of SQL this operator may be written as !=	
# BETWEEN	Between a certain range	
# LIKE	Search for a pattern	
# IN	To specify multiple possible values for a column

# The MySQL AND, OR and NOT Operators
# The WHERE clause can be combined with AND, OR, and NOT operators.

# The AND and OR operators are used to filter records based on more than one condition:

# The AND operator displays a record if all the conditions separated by AND are TRUE.
# SELECT column1, column2, ... FROM table_name WHERE condition1 AND condition2 AND condition3 ...;

# The OR operator displays a record if any of the conditions separated by OR is TRUE.
# SELECT column1, column2, ... FROM table_name WHERE condition1 OR condition2 OR condition3 ...;

# The NOT operator displays a record if the condition(s) is NOT TRUE.
# SELECT column1, column2, ... FROM table_name WHERE NOT condition; 

select * from cust where country = 'UK' and city = 'London';
select * from cust;

# OR operator
select * from cust where city = 'mexico' or city = 'London';

# NOT operator
select * from cust where not city = 'mexico';

select * from cust where country = 'Germany' and (city = 'Berlin'  or city = 'Stuggart');

# Order By
# The ORDER BY keyword is used to sort the result-set in ascending or descending order.
# SELECT column1, column2, ... FROM table_name ORDER BY column1, column2, ... ASC|DESC;
use mkdb;
select * from cust order by country;
select * from cust order by country desc;
select * from cust order by country asc, contactName desc;

# insert Into 
# The INSERT INTO statement is used to insert new records in a table.
# INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);
select * from cust;
insert into cust values (92, "IBM", "MK", "anna nagar","chennai", "600002","india");

insert into cust values (93, "gBM", "MK", "anna nagar","chennai", "600002","india");
insert into cust values (94, "hBM", "MK", "anna nagar","chennai", "600002","india");
insert into cust values (95, "IkBM", "MK", "anna nagar","chennai", "600002","india");

insert into cust(customerID,contactName,city) values (97,"km","madurai");

# NULL
# A field with a NULL value is a field with no value.
# SELECT column_names FROM table_name WHERE column_name IS NULL;
use mkdb;
select * from cust where postalCode is not null;
select * from cust where postalCode is null;
select * from cust;

# Update
# The UPDATE statement is used to modify the existing records in a table.
# UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;
# note : turn off the safe mode in Edit > Preferences > SQL Editor for update / delete function to work.
select * from cust;

update cust 
set companyName = 'ibf', city = 'pondy' 
where customerID = 1;

select * from cust;

# use Where clause to update multiple records
update cust set city = 'vellore' where city = 'mexico';

select * from cust;
select * from cust where city = 'vellore';
# Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!

# DELETE
# The DELETE statement is used to delete existing records in a table.
# DELETE FROM table_name WHERE condition;
delete from cust where customerID = 2;
select * from cust;
# to delete all records from the table ( Delete from cust;)


# LIMIT
# The LIMIT clause is used to specify the number of records to return.
# The LIMIT clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.
# SELECT column_name(s) FROM table_name WHERE condition LIMIT number;

select * from cust limit  5;

select * from cust where country = 'germany';
select * from cust where country = 'germany' limit 3;