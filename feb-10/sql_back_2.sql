use shop;
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

--sup table
create table suppliers (supplier_id int primary key, supplier_name varchar(50),
contact_email varchar(50), phone bigint, country varchar(30));

insert into suppliers values (1,'Google','google@gmail.com',9182938267,'India');
insert into suppliers values (2,'Amazon','amazon@gmail.com',6281857512,'USA');
insert into suppliers values (3,'Microsoft','microsoft@gmail.com',9345403336,'Canada');

alter table products add supplier_id int;
alter table products add constraint fk_supplier foreign key (supplier_id) references suppliers(supplier_id);

update products set supplier_id = 1 where product_id = 1001;
update products set supplier_id = 1 where product_id = 1002;
update products set supplier_id = 1 where product_id = 1003;
update products set supplier_id = 2 where product_id = 1004;
update products set supplier_id = 2 where product_id = 1005;


-- TASK 3 : RIGHT JOIN

select * from orders o right join customers c on o.cust_id = c.cust_id;

select * from orders o right join customers c on o.cust_id = c.cust_id where o.ord_id is null;

select p.prod_name, count(oi.product_id) from products p right join order_items oi 
on p.product_id = oi.product_id group by p.prod_name;

select * from employees e right join department d on e.dep_id = d.dep_id;
select * from employees e right join department d on e.dep_id = d.dep_id where e.emp_id is null;


-- TASK 4 : FULL OUTER JOIN

select * from customers c full outer join orders o 
on c.cust_id = o.cust_id;

select * from customers c full outer join orders o 
on c.cust_id = o.cust_id where o.ord_id is null;

select * from customers c full outer join orders o 
on c.cust_id = o.cust_id where c.cust_id is null;

select * from employees e full outer join department d 
on e.dep_id = d.dep_id;

select * from customers c left join orders o on c.cust_id = o.cust_id 
union 
select * from customers c right join orders o on c.cust_id = o.cust_id;


-- TASK 5 : SELF JOIN

select e.emp_id, e.emp_name, m.emp_name from employees e join employees m 
on e.manager_id = m.emp_id;

select e1.emp_name, e2.emp_name from employees e1 join employees e2 
on e1.manager_id = e2.manager_id where e1.emp_id <> e2.emp_id;

select distinct m.emp_name from employees e join employees m 
on e.manager_id = m.emp_id;

select e.emp_name, m.emp_name from employees e join employees m 
on e.manager_id = m.emp_id;

select e.emp_name, m.emp_name from employees e join employees m 
on e.manager_id = m.emp_id;


-- TASK 6 : CROSS JOIN

select * from customers cross join products;

select e1.emp_name, e2.emp_name from employees e1 
cross join 
employees e2 where e1.emp_id <> e2.emp_id;

select d.dep_name, e.emp_name from department d 
cross join employees e;


-- TASK 7 : MULTI TABLE JOINS

select * from customers c join orders o 
on c.cust_id = o.cust_id 
join order_items oi on o.ord_id = oi.ord_id;

select * from orders o join order_items oi 
on o.ord_id = oi.ord_id join products p 
on oi.product_id = p.product_id join suppliers s 
on p.supplier_id = s.supplier_id;

select e.emp_name, d.dep_name from employees e join department d 
on e.dep_id = d.dep_id;

select c.cust_name, o.ord_id, p.prod_name, oi.quantity from customers c join orders o 
on c.cust_id = o.cust_id join order_items oi 
on o.ord_id = oi.ord_id join products p 
on oi.product_id = p.product_id;

select c.cust_name, o.ord_id, oi.quantity, p.prod_name, p.prod_price from customers c 
join orders o on c.cust_id = o.cust_id 
join order_items oi on o.ord_id = oi.ord_id 
join products p on oi.product_id = p.product_id;


-- TASK 8 : JOIN + GROUP BY

select c.cust_id, count(o.ord_id) from customers c join orders o 
on c.cust_id = o.cust_id group by c.cust_id;

select c.cust_id, sum(oi.quantity * p.prod_price) from customers c 
join orders o on c.cust_id = o.cust_id 
join order_items oi on o.ord_id = oi.ord_id 
join products p on oi.product_id = p.product_id group by c.cust_id;

select d.dep_id, count(e.emp_id) from department d 
left join employees e on d.dep_id = e.dep_id group by d.dep_id;

select p.prod_name, count(oi.product_id) from products p 
join order_items oi on p.product_id = oi.product_id group by p.prod_name;

select d.dep_name, sum(e.salary) from department d 
join employees e on d.dep_id = e.dep_id group by d.dep_name;


-- TASK 9 : JOIN + HAVING

select c.cust_id, count(o.ord_id) from customers c 
join orders o on c.cust_id = o.cust_id group by c.cust_id having count(o.ord_id) > 3;

select d.dep_id, count(e.emp_id) from department d join 
employees e on d.dep_id = e.dep_id group by d.dep_id having count(e.emp_id) > 5;

select p.prod_name, sum(oi.quantity) from products p 
join order_items oi on p.product_id = oi.product_id group by p.prod_name having sum(oi.quantity) > 10;

select c.cust_id, sum(oi.quantity * p.prod_price) from customers c 
join orders o on c.cust_id = o.cust_id 
join order_items oi on o.ord_id = oi.ord_id 
join products p on oi.product_id = p.product_id 
group by c.cust_id having sum(oi.quantity * p.prod_price) > 50000;


-- TASK 10 : JOIN + WHERE

select c.cust_name, o.ord_id, o.date_ordered from customers c 
join orders o on c.cust_id = o.cust_id where o.date_ordered > '2016-09-12';

select e.emp_name, d.dep_name from employees e 
join department d on e.dep_id = d.dep_id where d.dep_name = 'IT';

select c.cust_name, c.city, o.ord_id from customers c 
join orders o on c.cust_id = o.cust_id where c.city = 'Hyderabad';

select p.prod_name, p.prod_price from products p 
join order_items oi on p.product_id = oi.product_id where p.prod_price > 30000;


-- TASK 11 : SUBQUERIES

select cust_id, cust_name from customers 
where cust_id in (select cust_id from orders);

select cust_id, cust_name from customers c 
where not exists (select 1 from orders o where o.cust_id = c.cust_id);

select product_id from products 
where product_id not in (select product_id from order_items);

select e.emp_id, e.emp_name from employees e 
where e.salary > (select avg(e1.salary) from employees e1 where e1.dep_id = e.dep_id);

select * from customers c join (select cust_id from orders) t on c.cust_id = t.cust_id;

select * 
from (select ord_id, sum(quantity) as total_qty from order_items group by ord_id) t 
where t.total_qty > 5;


-- TASK 12 Multi select joins

select e.emp_name, 
case 
	when e.salary >= 50000 then 'Very High'
	when e.salary >= 10000 then 'Medium' 
	else 'Low' 
	end from employees e;

select e.emp_name, e.salary, e.salary * 12 from employees e;

select e.emp_name, d.dep_name, 
	case
	when e.salary > 20000 then 'Senior' 
	else 'Junior' 
	end 
from employees e join department d on e.dep_id = d.dep_id;

select * from customers;
select * from products;
select * from orders;
select * from order_items;
select * from suppliers;


