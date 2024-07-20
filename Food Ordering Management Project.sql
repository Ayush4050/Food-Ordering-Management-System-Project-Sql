create database projects;
use projects;
-- CREATE FOOD ODEREING APP
-- CREARE TABLE
create table customer(
fname varchar(20),
lname varchar(20),
custid integer primary key,
emailid varchar(20),
pwd varchar(20),
address varchar(20),
street varchar(20),
pincode integer,
gender varchar(20),
phoneno long,
allergy varchar(20));
INSERT INTO customer (fname, lname, custid, emailid, pwd, address, street, pincode, gender, 
phoneno, allergy)
VALUES
 ('John', 'Doe', 1, 'johndoe@email.com', 'password1', '123 Main St', 'Apt 4B', 12345, 'Male', 5551234, 
'None'),
 ('Alice', 'Smith', 2, 'alice@email.com', 'password2', '456 Elm St', 'Unit 7', 54321, 'Female', 5555678, 
'Peanuts'),
 ('Bob', 'Johnson', 3, 'bob@email.com', 'password3', '789 Oak St', 'Suite 3A', 98765, 'Male', 5559876, 
'Dairy'),
 ('Sarah', 'Williams', 4, 'sarah@email.com', 'password4', '567 Pine St', 'Unit 5D', 65432, 'Female', 
5554321, 'Gluten'),
 ('Mike', 'Brown', 5, 'mike@email.com', 'password5', '101 Oak St', 'Apt 2C', 45678, 'Male', 5558765, 
'Shellfish'); 

select * from customer ;

create table cuisine(
cuisineid integer primary key,
cuisinename varchar(20));

INSERT INTO cuisine (cuisineid, cuisinename)
VALUES
 (1, 'Italian'),
 (2, 'Chinese'),
 (3, 'Mexican'),
 (4, 'Indian'),
 (5, 'Japanese');
 
 select * from cuisine ;
 
 create table employee(
empid integer primary key,
fname varchar(20),
lname varchar(20),
dob varchar(20),
emailid varchar(20),
pwd varchar(20),
address varchar(20),
phoneno long,
gender varchar(20),
salary int);

INSERT INTO employee (empid, fname, lname, dob, emailid, pwd, address, phoneno, gender, salary)
VALUES
 (1, 'Michael', 'Johnson', '1990-05-15', 'mike@email.com', 'emp_pass1', '789 Oak St', 5558765, 
'Male', 50000),
(2, 'Emily', 'Wilson', '1985-02-20', 'emily@email.com', 'emp_pass2', '567 Pine St', 5554321, 
'Female', 45000),
 (3, 'David', 'Lee', '1988-09-10', 'david@email.com', 'emp_pass3', '654 Elm St', 5557890, 'Male', 
48000),
 (4, 'Anna', 'Garcia', '1993-03-25', 'anna@email.com', 'emp_pass4', '789 Oak St', 5551234, 'Female', 
52000),
 (5, 'Robert', 'Brown', '1987-12-12', 'robert@email.com', 'emp_pass5', '101 Oak St', 5553456, 'Male', 
55000);

select * from  employee ;
  
  create table chef(
chefid integer primary key,
chefname varchar(20),
address varchar(20),
street varchar(20),
phoneno varchar(20),
cuisineid integer,
empid integer,
CONSTRAINT `fk_chef_cusine`
FOREIGN KEY (`cuisineid`)
references cuisine(cuisineid) on delete cascade,
FOREIGN KEY (`empid`)
references employee(empid) on delete cascade,
emailid varchar(20),
pwd varchar(20),
salary int);



INSERT INTO chef (chefid, chefname, address, street, phoneno, cuisineid, empid, emailid, pwd, 
salary)
VALUES
 (1, 'Chef Mario', '123 Chef Way', 'Apt 2C', '555-9876', 1, 1, 'mario@email.com', 'chef_pass1', 55000),
 (2, 'Chef Lily', '456 Chef Lane', 'Unit 5D', '555-2345', 2, 2, 'lily@email.com', 'chef_pass2', 52000),
 (3, 'Chef Carlos', '789 Chef St', 'Suite 1B', '555-7890', 3, 3, 'carlos@email.com', 'chef_pass3', 53000),
 (4, 'Chef Priya', '101 Chef Rd', 'Apt 3A', '555-4321', 4, 4, 'priya@email.com', 'chef_pass4', 51000),
 (5, 'Chef Kenji', '456 Chef Ave', 'Unit 4C', '555-3456', 5, 5, 'kenji@email.com', 'chef_pass5', 54000);

select * from chef;

create table ingredient(
ingid integer primary key,
ingname varchar(20));

INSERT INTO ingredient (ingid, ingname)
VALUES
 (1, 'Tomato'),
 (2, 'Chicken'),
 (3, 'Beef'),
 (4, 'Rice'),
 (5, 'Noodles');
 
 select * from ingredient;	
 
 create table food(
foodid integer primary key,
foodname varchar(20),
price integer,
quantity integer,
foodavail varchar(20),
cuisineid integer,
ingid integer,
chefid integer,
CONSTRAINT `fk_food_cusine`
FOREIGN KEY (`cuisineid`)
references cuisine(cuisineid) on delete cascade,
CONSTRAINT `fk_food_ingredient`
FOREIGN KEY (`ingid`)
references ingredient(ingid) on delete cascade,
CONSTRAINT `fk_food_chef`
FOREIGN KEY (`chefid`)
references chef(chefid) on delete cascade);

INSERT INTO food (foodid, foodname, price, quantity, foodavail, cuisineid, ingid, chefid)
VALUES
 (1, 'Margherita Pizza', 12, 20, 'Available', 1, 1, 1),
 (2, 'Kung Pao Chicken', 15, 15, 'Available', 2, 2, 2),
 (3, 'Taco', 10, 30, 'Available', 3, 3, 3),
 (4, 'Chicken Biryani', 14, 25, 'Available', 4, 4, 4),
 (5, 'Sushi Rolls', 18, 20, 'Available', 5, 5, 5);
 
 select * from food ;


create table drink(
drinkid integer primary key,
drinkname varchar(20),
price long,
quantity varchar(20),
drinkavail varchar(20));

INSERT INTO drink (drinkid, drinkname, price, quantity, drinkavail)
VALUES
 (1, 'Coca-Cola', 2, 'In Stock', 'Available'),
 (2, 'Sprite', 2, 'In Stock', 'Available'),
 (3, 'Lemonade', 2, 'In Stock', 'Available'),
 (4, 'Iced Tea', 2, 'In Stock', 'Available'),
 (5, 'Orange Juice', 3, 'In Stock', 'Available');
 
  select * from drink ;

create table delivery(
delid integer primary key,
delname varchar(20),
vehicleno varchar(20),
delcharge integer,
deldate date,
deltime varchar(20),
custid integer,
empid integer,
CONSTRAINT `fk_delivery_customer`
FOREIGN KEY (`custid`)
references customer(custid) on delete cascade,
CONSTRAINT `fk_delivery_employee`
FOREIGN KEY (`empid`)
references employee(empid) on delete cascade);

INSERT INTO delivery (delid, delname, vehicleno, delcharge, deldate, deltime, custid, empid)
VALUES
 (1, 'Fast Delivery', 'DEL123', 5, '2023-10-13', '12:00 PM', 1, 1),
 (2, 'Express Delivery', 'DEL456', 7, '2023-10-14', '2:30 PM', 2, 2),
 (3, 'Standard Delivery', 'DEL789', 6, '2023-10-15', '3:45 PM', 3, 3),
 (4, 'Late Night Delivery', 'DEL987', 8, '2023-10-16', '9:00 PM', 4, 4),
 (5, 'Weekend Delivery', 'DEL654', 7, '2023-10-17', '10:30 AM', 5, 5);
 
 
   select * from delivery ;

 create table orders(
ordid integer primary key,
totalcost integer,
foodid integer,
drinkid integer,
delid integer,
CONSTRAINT `fk_orders_food`
FOREIGN KEY (`foodid`)
references food(foodid) on delete cascade,
CONSTRAINT `fk_orders_drink`
FOREIGN KEY (`drinkid`)
references drink(drinkid) on delete cascade,
CONSTRAINT `fk_orders_delivery`
FOREIGN KEY (`delid`)
references delivery(delid) on delete cascade);


INSERT INTO orders (ordid, totalcost, foodid, drinkid, delid)
VALUES
 (1, 27, 1, 1, 1),
 (2, 30, 2, 2, 2),
 (3, 25, 3, 3, 3),
(4, 32, 4, 4, 4),
 (5, 35, 5, 5, 5);
 
    select * from orders ;


create table payment(
payid integer primary key,
paymethod varchar(20),
custid integer,
ordid integer,
CONSTRAINT `fk_payment_customer`
FOREIGN KEY (`custid`)
references customer(custid)on delete cascade,
CONSTRAINT `fk_payment_orders`
FOREIGN KEY (`ordid`)
references orders(ordid) on delete cascade);

INSERT INTO payment (payid, paymethod, custid, ordid)
VALUES
 (1, 'Credit Card', 1, 1),
 (2, 'PayPal', 2, 2),
 (3, 'Cash', 3, 3),
 (4, 'Credit Card', 4, 4),
 (5, 'Cash', 5, 5);
 
 select * from payment;
 
 
 -- Retrieve the names of all customers who have allergies.
SELECT fname, lname
FROM customer
WHERE allergy IS NOT NULL;

-- Find the cuisines offered by a specific chef.
SELECT c.cuisinename
FROM cuisine c
JOIN chef ch ON c.cuisineid = ch.cuisineid
WHERE ch.chefname = 'Chef Mario';

-- List the total number of ingredients for each cuisine
SELECT c.cuisinename, COUNT(i.ingid) AS ingredient_count
FROM cuisine c
LEFT JOIN food f ON c.cuisineid = f.cuisineid
LEFT JOIN ingredient i ON f.ingid = i.ingid
GROUP BY c.cuisineid, c.cuisinename;

-- Calculate the total cost of each order, including food and drinks.
SELECT o.ordid, SUM(f.price + d.price) AS total_cost
FROM orders o
LEFT JOIN food f ON o.foodid = f.foodid
LEFT JOIN drink d ON o.drinkid = d.drinkid
GROUP BY o.ordid;
-- Retrieve the names of customers who have placed orders through the "Express Delivery" service.
SELECT c.fname, c.lname
FROM customer c
JOIN delivery d ON c.custid = d.custid
WHERE d.delname = 'Express Delivery';
-- List the chefs who have not prepared any food.
SELECT ch.chefname
FROM chef ch
LEFT JOIN food f ON ch.chefid = f.chefid
WHERE f.foodid IS NULL;

-- Retrieve the names of all customers who are allergic to eggs
select fname,lname
From customer
Where allergy="Peanuts";
-- Find the ingredients added in Margherita Pizza
select ingname
From ingredient
Where ingid in (select ingid from food Where foodname="Margherita Pizza");