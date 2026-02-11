
CREATE TABLE customers (
    cust_id BIGINT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(100) NOT NULL
);
CREATE TABLE products (
    product_id BIGINT PRIMARY KEY,
    prod_name VARCHAR(100) UNIQUE NOT NULL,
    prod_price DECIMAL(10,2) NOT NULL,
    model_year int 
);
CREATE TABLE orders (
    ord_id BIGINT PRIMARY KEY,
    cust_id BIGINT NOT NULL,
    date_ordered DATE NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (cust_id)
        REFERENCES customers(cust_id)
);

select * from orders;
select * from customers;

CREATE TABLE order_items (
    ord_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (ord_id, product_id),
    CONSTRAINT fk_oi_order
        FOREIGN KEY (ord_id)
        REFERENCES orders(ord_id),
    CONSTRAINT fk_oi_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

Insert into customers values(10001,'vishnu','vishnu@gmail.com','Nizamabad');
Insert into customers values(10002,'koushik','koushik@gmail.com','Hyderabad');
Insert into customers values(10003,'rishikesh','rishikesh@gmail.com','Karimnagar');
Insert into customers values(10004,'revanth','revanth@gmail.com','Warangal');
Insert into customers values(10005,'Sairaj','priya@gmail.com','Adilabad');
Insert into customers values(10006,'Vivek','Vivek@gmail.com','Nizamabad');
Insert into customers values(10007,'Vishal','Vishal@gmail.com','Mumbai');
Insert into customers values(10008,'Ramesh','ramesh@gmail.com','Vikarabad');
Insert into customers values(10009,'raghav','raghav@gmail.com','Khammam');

Insert into products values(1001,'Chair',50000,2004);
Insert into products values(1002,'Table',65000,2022);
Insert into products values(1003,'Bottle',30000,2021);
Insert into products values(1004,'Bag',15000,2023);
Insert into products values(1005,'shoes',4000,2020);
Insert into products values(1006,'Refrigerator',3500,2024);
Insert into products values(1007,'TV',45000,2022);
Insert into products values(1008,'egg boiler',450000,2030);

Insert into orders values(100001,10001,'2026-02-06');
Insert into orders values(100008,10001,'2026-02-06');
Insert into orders values(100002,10002,'2020-04-20');
Insert into orders values(100003,10004,'2015-09-13');
Insert into orders values(100004,10003,'1999-11-29');
Insert into orders values(100005,10006,'1880-12-19');
Insert into orders values(100006,10005,'2022-06-28');
Insert into orders values(100007,10007,'2000-01-18');


Insert into order_items values(100001,1001,1);
Insert into order_items values(100002,1002,1);
Insert into order_items values(100003,1003,3);
Insert into order_items values(100004,1004,2);
Insert into order_items values(100005,1005,10);
Insert into order_items values(100006,1006,6);
Insert into order_items values(100007,1007,8);

select * from customers;
select * from products;
select * from orders;
select * from order_items;

--task - 1

select cust_name from customers c join orders o
on c.cust_id = o.cust_id;

select o.ord_id, c.cust_name, c.city,o.date_ordered  from customers c join orders o
on c.cust_id = o.cust_id;

CREATE TABLE Department(
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255) NOT NULL,
    emp_email VARCHAR(255) UNIQUE,
    dep_id INT NOT NULL,
    salary DECIMAL(10,2),
    manager_id INT null,
    FOREIGN KEY(dep_id) REFERENCES Department(dep_id),
    FOREIGN KEY(manager_id) REFERENCES Employees(emp_id)
);
Insert into Department values(101,'cse');
Insert into Department values(102,'Ece');
Insert into Department values(103,'IT');
Insert into Department values(104,'EEE');
Insert into Department values(105,'Mech');

Insert into Employees values(10001,'vishnu','vishnu@gmail.com',101,45000.00,null);
Insert into Employees values(10002,'koushik','koushik@gmail.com',101,450000.50,null);
Insert into Employees values(10003,'rishikesh','rishikesh@gmail.com',102,8000.00,null);
Insert into Employees values(100020,'revanth','revanth@gmail.com',103,10000.00,null);
Insert into Employees values(100021,'Sairaj','sairaj@gmail.com',104,5000.00,null);

select * from customers;
select * from products;
select * from orders;
select * from order_items;
select * from Department;
select * from Employees;

select	emp_id,emp_name,d.dep_name from employees e join Department d
on e.dep_id = d.dep_id;


SELECT o.ord_id,p.prod_name,oi.quantity,o.date_ordered
from orders o
JOIN order_items oi
    on o.ord_id = oi.ord_id
JOIN products p
    on oi.product_id = p.product_id;


select e.emp_id, e.emp_name,d.dep_id,d.dep_name from Employees e join Department d
on e.dep_id = d.dep_id;

select e.emp_id, e.emp_name,d.dep_name,e.salary from Employees e join Department d
on e.dep_id = d.dep_id where e.salary > 40000;


select e.emp_id, e.emp_name,d.dep_name from Employees e join Department d
on e.dep_id = d.dep_id where d.dep_name like 'E%';

--task 2 ,left join

select * from customers;
select * from products;
select * from orders;
select * from order_items;
select * from Department;
select * from Employees;

select * from customers;
select * from orders;

select c.cust_id, c.cust_name, o.ord_id, o.date_ordered from customers c left join orders o
on c.cust_id = o.cust_id;

select c.cust_id,c.cust_name,o.date_ordered from customers c left join orders o 
on c.cust_id = o.cust_id where date_ordered is null;

select d.dep_id,d.dep_name,e.emp_name from Employees e left join  Department d on
d.dep_id = e.dep_id;
 
select d.dep_id,d.dep_name,e.emp_name from  Department d left join  Employees e  on
d.dep_id = e.dep_id;

SELECT d.dep_id,d.dep_name FROM Department d
LEFT JOIN Employees e
ON d.dep_id = e.dep_id
WHERE e.emp_name IS NULL;

SELECT 
p.product_id,p.prod_name FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id WHERE oi.product_id IS NULL;

SELECT d.dep_name, e.emp_name FROM Department d LEFT JOIN Employees e ON d.dep_id = e.dep_id AND e.emp_name = 'vishnu';

SELECT d.dep_name, e.emp_name FROM Department d LEFT JOIN Employees e ON d.dep_id = e.dep_id AND e.emp_name LIKE 'v%';

SELECT *
FROM orders o RIGHT JOIN customers c ON c.cust_id = o.cust_id
WHERE o.ord_id IS NULL;

SELECT *
FROM Employees e RIGHT JOIN Department d ON d.dep_id = e.dep_id;

SELECT p.prod_name, COUNT(*)
FROM products p RIGHT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.prod_name;

SELECT *
FROM customers c FULL OUTER JOIN orders o ON c.cust_id = o.cust_id;

SELECT *
FROM customers c LEFT JOIN orders o ON c.cust_id = o.cust_id
UNION
SELECT *
FROM customers c RIGHT JOIN orders o ON c.cust_id = o.cust_id;

SELECT *
FROM customers c INNER JOIN orders o ON c.cust_id = o.cust_id;

SELECT *
FROM customers c FULL OUTER JOIN orders o ON c.cust_id = o.cust_id
WHERE o.ord_id IS NULL;

SELECT *
FROM Employees e FULL OUTER JOIN Department d ON e.dep_id = d.dep_id;

UPDATE Employees SET manager_id = 10001 WHERE manager_id IS NULL;

INSERT INTO Employees VALUES (10005,'samar','samar@gmail.com',104,45080.00,10002);

SELECT e.emp_id,e.emp_name AS employee_name,m.emp_name AS manager_name
FROM Employees e JOIN Employees m ON e.manager_id = m.emp_id;

SELECT e.emp_id,m.emp_name AS manager_name
FROM Employees e JOIN Employees m ON e.manager_id = m.emp_id
ORDER BY e.manager_id;

SELECT DISTINCT e.emp_name AS manager_name
FROM Employees e JOIN Employees m ON e.emp_id = m.manager_id;

SELECT e.emp_name,m.emp_name
FROM Employees e JOIN Employees m ON e.manager_id = m.emp_id;

SELECT *
FROM customers CROSS JOIN products;

SELECT e1.emp_name AS employee1,e2.emp_name AS employee2
FROM Employees e1 CROSS JOIN Employees e2
WHERE e1.emp_id <> e2.emp_id;

SELECT *
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
JOIN order_items oi ON o.ord_id = oi.ord_id;

SELECT *
FROM products p JOIN order_items oi ON p.product_id = oi.product_id
JOIN Suppliers s ON s.supplier_id = p.supplier_id;

SELECT *
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
JOIN order_items oi ON oi.ord_id = o.ord_id
JOIN products p ON p.product_id = oi.product_id
JOIN Suppliers s ON s.supplier_id = p.supplier_id;

SELECT c.cust_id,COUNT(*)
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_id;

SELECT c.cust_id,SUM(oi.quantity*p.prod_price)
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
JOIN order_items oi ON o.ord_id = oi.ord_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.cust_id;

SELECT d.dep_id,COUNT(e.emp_id)
FROM Department d LEFT JOIN Employees e ON d.dep_id = e.dep_id
GROUP BY d.dep_id;

SELECT p.product_id,COUNT(oi.product_id)
FROM products p LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;

SELECT d.dep_id,SUM(e.salary)
FROM Department d LEFT JOIN Employees e ON d.dep_id = e.dep_id
GROUP BY d.dep_id;

SELECT c.cust_id,COUNT(o.ord_id)
FROM customers c LEFT JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_id
HAVING COUNT(o.ord_id) > 1;

SELECT d.dep_id,COUNT(e.emp_id)
FROM Department d JOIN Employees e ON d.dep_id = e.dep_id
GROUP BY d.dep_id
HAVING COUNT(e.emp_id) > 1;

SELECT p.product_id,p.prod_name,COUNT(*) AS times_ordered
FROM order_items oi JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id,p.prod_name
HAVING COUNT(*) > 0;

SELECT c.cust_id,SUM(p.prod_price*oi.quantity)
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
JOIN order_items oi ON o.ord_id = oi.ord_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.cust_id
HAVING SUM(p.prod_price*oi.quantity) > 10000;

SELECT c.city,COUNT(o.ord_id)
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.city;

SELECT c.cust_id,c.cust_name,c.email,o.date_ordered,o.ord_id
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
WHERE o.date_ordered > '2016-09-12';

SELECT e.emp_id,d.dep_id,e.emp_name
FROM Employees e JOIN Department d ON e.dep_id = d.dep_id
WHERE d.dep_name = 'cse';

SELECT c.cust_id,c.cust_name,c.city
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
WHERE c.city = 'warangal';

SELECT p.product_id,p.prod_name,p.prod_price
FROM orders o JOIN order_items oi ON o.ord_id = oi.ord_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.prod_price > 15000;

SELECT c.cust_name,c.cust_id
FROM customers c JOIN orders o ON c.cust_id = o.cust_id
WHERE c.cust_name LIKE 'p%';

SELECT e.emp_name
FROM Employees e JOIN Department d ON e.dep_id = d.dep_id
WHERE e.emp_name LIKE 'P%';

SELECT p.product_id,p.prod_name,oi.quantity
FROM products p JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON o.ord_id = oi.ord_id
WHERE p.prod_name LIKE '%phone%';

SELECT cust_id
FROM customers
WHERE cust_id IN (SELECT cust_id FROM orders);

SELECT cust_id
FROM customers
WHERE cust_id NOT IN (SELECT cust_id FROM orders);

SELECT product_id
FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);

SELECT e.emp_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(e1.salary)
    FROM Employees e1
    WHERE e1.dep_id = e.dep_id
);

SELECT dep_id,dep_name
FROM Department
WHERE dep_id IN (SELECT dep_id FROM Employees);

SELECT c.cust_id,c.cust_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.cust_id = c.cust_id
);

SELECT e.emp_id,e.emp_name,d.dep_name,
CASE WHEN e.salary >= 5000 THEN 'High salary' ELSE 'Low salary' END AS salaryrange
FROM Employees e JOIN Department d ON e.dep_id = d.dep_id;

