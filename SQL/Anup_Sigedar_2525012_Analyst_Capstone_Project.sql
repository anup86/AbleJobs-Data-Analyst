-- Capstone Project.

--##############################################################################################################################

-- Session 2: Creating a Database.

-- 1.

-- a.Create a database with the name: AbleJobs

create database AbleJobs;

-- b.Create the following Table with the name: Sales1
create table Sales1
(
salesman_id int,
name varchar(100),
city varchar (100),
commission float
);


insert into Sales1 
values (
5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5003,'Lauson Hen','San Jose',0.12),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13);

-- c.Display all the data in the above table

select * from Sales1;

-- 2.

-- a.Create a database with the name: AbleJobs

--task already done above

-- b. Create the following Table with the name: Sales2

create table Sales2
(
customer_id int,
cust_name varchar(100),
city varchar (100),
grade int,
salesman_id int
);

insert into Sales2
values (
3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007);

-- c. Display all the data in the above table

select * from Sales2;

--######################################################################################################################

-- Session 3: Other Basic Queries.

-- 1.

-- a.Create a database with the name: AbleJobs

-- Task already done above.

-- b.Create the following Table with the name: Sales1

-- Task already done above.

-- c. In the above table, write a SQL query to change the following data:

--   i. Change commission of salesman with name of ‘Pit Alex’ to 0.22

update Sales1 set commission=0.22 where name='Pit Alex'

--   ii. Change city of salesman with salesman_id of ‘5003’ to Paris

update Sales1 set city='Paris' where salesman_id='5003'

-- d. Display all the data in the above table

select * from Sales1

-- 2.

-- a.Create a database with the name: AbleJobs

-- Task already done above.

-- b.Create the following Table with the name: Sales2

-- Task already done above.

-- c. In the above table, write a SQL query to change the following data:

--   i. Change grade of customer with name of ‘Graham Zusi’ to 300

update Sales2 set grade=300 where cust_name='Graham Zusi'

--   ii. Change city of customer with cust_id of ‘3009’ to London

update Sales2 set city='London' where customer_id='3009'

--d. Display all the data in the above table

select * from Sales2

--######################################################################################################################

--Session 4.Functions and Wildcards.

-- 1.

-- a.Create a database with the name: AbleJobs

-- Task already done above.

-- b.Create the following Table with the name: Sales1

-- Task already done above.

-- c.From the above table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City.
--Return salesman_id, name, city, commission.

select salesman_id, name, city, commission from Sales1 where city in ('Paris','Rome')


-- d.From the following table, write a SQL query to find the details of those salespeople who live in cities apart from 'Paris' and 'Rome'.
--Return salesman_id, name, city, commission.

select salesman_id, name, city, commission from Sales1 where city not in ('Paris','Rome')


-- e.From the following table, write a SQL query to find the details of salespeople who get the commission in the range
--from 0.12 to 0.14 (begin and end values are included).
--Return salesman_id, name, city, and commission.

select salesman_id, name, city, commission from Sales1 where commission between 0.12 and 0.14

-- f.From the following table, write a SQL query to find the details of those salespeople whose name starts with any letter
--within 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.

select salesman_id, name, city, commission from Sales1 where name BETWEEN 'A' and 'L'

-- g.From the following table, write a SQL query to find the details of the customers whose name begins with
--the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.

select salesman_id, name, city, commission from Sales1 where name like 'B%'

-- h.From the following table, write a SQL query to find the details of the customers whose names end with 
--the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.

select salesman_id, name, city, commission from Sales1 where name like '%n'

-- i.From the following table, write a SQL query to find the details of those salespeople whose name starts with
--‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission.

select salesman_id, name, city, commission from Sales1 where name like 'N__l%'

--2.

-- a. Create a database with the name: AbleJobs

-- Task already done above.

-- b. Create the following Table with the name: Nobel

create table Nobel(
YEAR int,
SUBJECT varchar(100),
WINNER varchar(100),
COUNTRY varchar(100),
CATEGORY varchar(100)
)

bulk insert Nobel from 'C:\Users\`hp\OneDrive\Documents\Able\SQL\Nobel.csv'
with
(
rowterminator='\n',
fieldterminator=','
)

-- c. From the above table, write a SQL query to find the Nobel Prize winner(s) in the following years (Return year, subject and winner) :

-- i. 1970

select year,subject,winner from Nobel where year=1970

-- ii. 1987

select year,subject,winner from Nobel where year=1987

-- d.From the above table, write a SQL query to find the Nobel Prize winner in 'Literature' in the year 1971. Return winner.

select winner from Nobel where subject='Literature' and year='1971';

-- e.From the following table, write a SQL query to find the Nobel Prize winner 'Dennis Gabor'. Return year, subject.

select year,subject from Nobel where winner='Dennis Gabor';

-- f.From the following table, write a SQL query to find the Nobel Prize winners in 'Physics' since the year 1950. Return winner.

select winner from Nobel where subject='Physics' and year>=1950;

-- g.From the following table, write a SQL query to find the Nobel Prize winners in 'Chemistry' between the years 1965 to 1975. Begin and end values are included. Return year, subject, winner, and country

select winner from Nobel where subject='Chemistry' and year between 1965 and 1975;

-- h.Write a SQL query to show all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.

SELECT * FROM Nobel WHERE year >1972 AND winner IN ('Menachem Begin','Yitzhak Rabin');

-- i.From the following table, write a SQL query to find the details of the winners whose first name matches with the string 'Louis'. Return year, subject, winner, country, and category.

select year, subject, winner, country, category from Nobel where winner like 'Louis %'

-- j.From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.

select year, subject, winner, country, category from Nobel where winner='Johannes Georg Bednorz'

--3

-- a. Create a database with the name: AbleJobs

-- Task already done above.

-- b. Create the following Table with the name: Orders

create table Orders(
ord_no int,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int
)

bulk insert Orders from 'C:\Users\`hp\OneDrive\Documents\Able\SQL\Orders.csv'
with
(
rowterminator='\n',
fieldterminator=','
)


-- c.From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.

select sum(purch_amt) as Total_Purchase_Amount from Orders;

-- d.From the following table, write a SQL query to calculate average purchase amount of all orders. Return average purchase amount.

select avg(purch_amt) as Average_Purchase_Amount from Orders;

-- e.From the following table, write a SQL query to count the number of unique salespeople. Return number of salespeople.

select distinct salesman_id from Orders;

-- f.From the following table, write a SQL query to count the number of customers. Return number of customers.

select count(customer_id) as no_of_customers from Orders;

-- ###################################################################################################################################

-- Session 5: Union and Join

-- 1

-- a.Create a database with the name: AbleJobs

-- Task already done above.

-- b.Create the following Table with the name: Nobel

-- Task already done above.

-- c.From the above table, write a SQL query to combine the winners in Physics, 1970 and in Economics, 1971. 
--Return year, subject, winner, country, and category.

select year, subject, winner, country, category from Nobel where subject='Physics' and year=1970
union
select year, subject, winner, country, category from Nobel where subject='Economics' and year=1971


--2 

-- a.Create a database with the name: AbleJobs

-- Task already done above.

-- b.Create the following Table with the name: Sales2

-- Task already done above.

-- c.Create the following Table with the name: Sales1

-- Task already done above.

-- d. From the above tables write a SQL query to find the salesperson and customer who belongs to same city. Return Salesman, cust_name and city.

select s1.name as Salesman , s2.cust_name, s1.city from Sales1 s1 inner join Sales2 s2 on s1.city=s2.city;

 -- e.From the above tables write a SQL query to find the salesperson(s) and the customer(s) he handle. Return Customer Name, city, Salesman, commission.

 select s2.cust_name, s2.city, s1.name as Salesman, s1.commission from Sales1 s1 inner join Sales2 s2 on s1.salesman_id=s2.salesman_id;

-- f.From the above tables write a SQL query to find those salespersons who received a commission from the company more than 12%.

SELECT a.cust_name AS "Customer Name", a.city, b.name AS "Salesman", b.commission FROM Sales2 a INNER JOIN Sales1 b ON a.salesman_id=b.salesman_id WHERE b.commission>.12;

-- g.From the following tables write a SQL query to find those salespersons do not live in the same city where their customers live and received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, salesman city, commission.

SELECT a.cust_name AS "Customer Name", a.city as "customer_city", b.name AS "Salesman", b.city as "salesman_city" ,b.commission FROM Sales2 a INNER JOIN Sales1 b ON a.salesman_id=b.salesman_id WHERE b.commission>.12 AND a.city<>b.city;

-- Session 6 & 7: Nested Queries & Normalization

-- Consider a database for an online bookstore. The database consists of two tables: Customers and Orders. Here are the structures of the tables:

--Customers Table:

--CustomerID		CustomerName		City
--1			John Smith			New York
--2			Jane Doe			Los Angeles
--3			Bob Johnson			Chicago


create table Customers
(
CustomerID int,
CustomerName varchar(100),
city varchar(100)
);

insert into Customers
values
(1,'John Smith','New York'),
(2,'Jane Doe','Los Angeles'),
(3,'Bob Johnson','Chicago');

--Orders Table:

--OrderID	CustomerID	Product	Quantity	Price
--1			1	Laptop		2		340
--2			1	Printer		1		240		
--3			2	Smartphone	3		70
--4			3	Tablet		2		80

create table Orders1
(
OrderID int,
CustomerID int,
Product varchar(100),
Quantity int,
Price float
);


insert into Orders1
values
(1,1,'Laptop',2,340),
(2,1,'Printer',1,240),
(3,2,'Smartphone',3,70),
(4,3,'Tablet',2,80)

--Question 1:
--Retrieve the names of all customers who have placed an order for a product with a price greater than $100.

select CustomerName from Customers c inner join Orders1 o on c.CustomerID=o.CustomerID and o.Price>100;

--Question 2:
--List the products that have been ordered by customers from the same city as customer 'John Smith'.

select o.Product from Customers c inner join Orders1 o on c.CustomerID=o.CustomerID where c.city =(select city from Customers where CustomerName='John Smith');

--Question 3:
--Find the order IDs and total order amounts for orders that contain at least one product with a quantity greater than 2.

select OrderID, Quantity*Price as Total_Amount from Orders1 where Quantity>2;