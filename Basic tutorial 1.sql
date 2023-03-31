# creating database
create database sql_workbench;

# Connecting to the database
use sql_workbench; 

#numeric functions

# absolute values
select abs(-22);
select abs(-22);

# division
select mod(10, 4);
select mod(10, 4) as remainder;
select mod(50.2 , 2) as remainder;

# Power function
select power(4,2);

# square root
select sqrt(4);

#greatest or least
select greatest(2,5,3,48,99,56);
select least(2,5,3,48,99,56);

#truncate
select truncate(22.85654163516546,3);

# round off
select round(22.897);
select round(22.897,2);

# create table

create table students
(stu_id int primary key,
stu_name varchar(25),
age int, gender char(1),
doa date, city varchar(10));


# inserting records into the table

insert into students values
(101 ,"aoe", 54,"M", "2016-11-23", "pune"),
(102 ,"boe", 54,"M","2016-11-24", "pune"),
(103 ,"coe", 54,"M", "2016-11-25", "pune"),
(104 ,"doe", 54,"F", "2016-11-26", "mumbai"),
(105 ,"eoe", 54,"M", "2016-11-27", "mumbai"),
(106 ,"foe", 54,"M", "2016-11-28", "mumbai"),
(107 ,"goe", 54,"M", "2016-11-29", "pune"),
(108 ,"hoe", 54,"F", "2016-11-30", "mumbai"),
(109 ,"ioe", 54,"F", "2016-11-01", "pune"),
(110 ,"joe", 54,"F", "2016-11-02", "mumbai"),
(111 ,"koe", 54,"F", "2016-11-03", "pune"),
(112 ,"loe", 54,"M", "2016-11-04", "pune"),
(113 ,"moe", 54,"F", "2016-11-05", "pune"),
(114 ,"noe", 54,"M", "2016-11-06", "patna"),
(115 ,"ooe", 54,"F", "2016-11-07", "pune"),
(116 ,"poe", 54,"M", "2016-11-08", "patna"),
(117 ,"qoe", 54,"F", "2016-11-09", "pune"),
(118 ,"roe", 54,"M", "2016-11-10", "patna"),
(119 ,"soe", 54,"F", "2016-11-11", "pune"),
(120 ,"toe", 54,"M", "2016-11-12", "patna");

# Displaying the whole columns students table using *
select * from students;

# Displaying specific columns students table
select stu_name, age, city from students;

# Where
select * from students where city = "patna";
select * from students where not city = "patna";
select * from students where city = "patna" or city =  "mumbai";
select * from students where city = "mumbai" and  gender = 'M';

# Group By
select city, count(stu_id) as total_students
from students group by city;

# Having
select city, count(stu_id) as total_students
from students group by city
having count(stu_id) >4;

# order by
select * from students order by city;
select * from students order by city desc;

# string functions
# string casing
select upper('india') as upper_case;
select lower('INDIA') as lower_case;
select lcase('INDINDIAIA') as lower_case;

# character length
select character_length('india') as c_length;
select stu_name, character_length(stu_name) as total_len from students;

# concat
select concat("india ",  "is " ,"in " , "asia");
select stu_id, stu_name , concat(stu_id, " ", stu_name) as id_name from students;
 
# reverse
 select reverse("india");
 select reverse(stu_name) as rev_name from students;
 
# replace
select replace("tomato is a vegetable","vegetable","fruit");

# trim
select char_length("     india       ");
select ltrim("     india       ");
select length(ltrim("     india       "));
select length(rtrim("     india       "));
 
# position
select position("fruit" in "tomato is a fruit") as name;
select ascii("a");
select ascii("4");