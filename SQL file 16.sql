create database library;
create table books (
Book_id int, 
book_name varchar(20),
num_pages varchar(20),
author_name varchar(20),
prices varchar(20)
);

use library;
select* from book_id;
use retail;
create table store_dtl(
store_id int,
store_city varchar(20),
store_state varchar(20),
contact_no varchar(20)
);
use school;
alter table student
 Add column city varchar(255);
 select * from student;
 alter table student
 drop column city;
 alter table student
 rename column DOB to DOB_u;
alter table student
add column geoghraphy varchar (255);
 
 
 
 
 
 
 
select * from store_dtl;

create database family;
create table family_dtl (
serial_no int, 
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20),
age varchar(20),
relation_with_yourself varchar(23)
);
drop table family_dtl;
use family;
select * from family_dtl;
drop database family;

create database school;
create table student(
roll_no int,
first_name varchar(20),
last_nmame varchar (20),
DOB varchar(20)
);
use school;
select * from student;
create table marks (
roll_no int,
Math_marks varchar (20),
science_marks varchar(20),
english_marks varchar (20)
);
create database shirleela;
use shirleela;
create table A_wing (
flat_no int,
owner_name varchar (10),
mobile_number varchar (10),
max_flat varchar (10)
);


use shirleela;
alter table a_wing
add column family_mamber varchar(255);
select * from a_wing;
use school;


select * from marks;
alter table marks
rename column roll_no to percentage;

drop database shirleela;
use emp;

select  emp_no,birth_date 
from employees;
use retail;
select * from product;
select product_id,description,category 
from product
where category IN (select distinct category from product group by category);

use retail;

INSERT INTO product
SELECT product_id + 10101 as product_id,
CONCAT(description,"emepty") as description, 
price + 6.99 as price,
 category, max_qty
 FROM product WHERE product_id <1010;
 
 
use retail;
INSERT INTO product
SELECT product_id + 12123 as product_id,
CONCAT(description,"emepty") as description, 
price + 2 as price,
 category, max_qty
 FROM product WHERE product_id <1234;
 
 
 use retail;
 select * from product;

INSERT INTO product
SELECT product_id + 100232340 as product_id,
CONCAT(description,"empty") as description, 
price + 2as price,
 category, max_qty
 FROM product WHERE product_id <15677890;

select product_id,description
from product;
use retail;
select member_id,first_name,last_name
from member_t;
select member_id,reg_store,reg_date
from member_t;
select  departments; from product;
select product_id,description,category
from product;
select * from tran_dtl;

select * from tran_hdr;
select tran_id,member_id,tran_dt
from tran_hdr; 
use emp;
select * from employees;
select max(emp_no)
from employees;

-- Generate report showing number of employees born in year 1960;

select count(*) as emp_birth_date
from employees
where year(birth_date) =1960;

-- Generate report showing total number of employees.

select count(*) total_employees
from employees;

-- Generate report showing total salary withdrawn by all employees.

select sum(salary) as total_withdrawn_salary
from salaries;
select max(salary) as total_withdrawn_salary
from salaries;

--  Generate report showing average salary of employee.

select avg(salary) as salary_avg
from salaries;
select min(salary) as total_withdrawn_salary
from salaries;

-- Generate report showing monthly sale for each month( NOT DONE)

use emp;
Select * from departments;
select * from employees;
SELECT emp_no, COUNT(DISTINCT emp_no) AS num_departments_worked
FROM employees
GROUP BY emp_no      
HAVING COUNT(DISTINCT emp_no) > 1;

-- Generate report showing employees who have worked in more than one department.


-- Generate report showing total number of managers for each department.

select dept_no, COUNT(emp_no) as total_manager
from dept_manager
group by dept_no;
select* from dept_manager;

-- Generate report showing total salary withdrawn from company for each employee;


select* from salaries;
SELECT emp_no, SUM(salary) AS total_salary_withdrawn
FROM salaries
GROUP BY emp_no;

-- Generate report showing only those employees from above report who have withdrawn total salary
 -- in between 400000 to 500000 and arrange them in descending order by salary withdrawn.

SELECT emp_no, SUM(salary) AS total_salary_withdrawn
FROM salaries
GROUP BY emp_no
HAVING total_salary_withdrawn BETWEEN 400000 AND 500000
ORDER BY total_salary_withdrawn DESC;

-- Generate report showing total number of transactions per month.
use retail;
select* from tran_hdr;
select tran_id,month(tran_dt) as per_month, count(tran_dt)
from tran_hdr
group by tran_id,month(tran_dt);

-- Generate report showing total number of transaction per month in ascending order
select tran_id,month(tran_dt) as per_month, count(tran_dt)
from tran_hdr
group by tran_id,month(tran_dt)
order by tran_id,month(tran_dt) asc;

-- Generate report showing number of members registered per month per store.

SELECT
EXTRACT(YEAR_MONTH FROM reg_date) AS year_month1,
    reg_store,
    COUNT(member_id) AS num_members_registered
FROM
    member_t
GROUP BY
    year_month1,
    reg_store
ORDER BY
    year_month1,
    reg_store;
   select* from member_t;
   -- Generate report showing category wise number of products having price less than 1
   select* from product;
   select category,count(*) ,product_id as product_no
   from product where price<1
   group by category;
   
   -- Generate report showing no. of products per category
   use retail;

   select category, count(product_id) as product_per
from product
group by category;
-- Generate report showing no. of transaction per member.
select * from tran_hdr;
select member_id,count(tran_id) as transaction_per_member
from tran_hdr
group by member_id;
-- Generate report showing no. of transaction per store.
SELECT 
    member_id, COUNT(store_id) AS transaction_per_store
FROM
    tran_hdr
GROUP BY member_id;

-- Generate report showing no. of transaction per member per store.
select member_id,count(store_id) as transaction_per_store
from tran_hdr
group by member_id;


-- Generate report showing total number of transaction in which product 17 was purchased
select * from product;
SELECT COUNT(tran_id) AS total_transactions
FROM tran_dtl


WHERE product_id = 17;

-- Generate report showing all details of product which had min price. 
-- (product_id,description,category,price)

SELECT product_id, description, category, price
FROM product
WHERE price = (SELECT min(price) FROM product);

 -- Generate report showing details of all products from category which had least number of products.
 -- (product_id,description,category,price)
 -- add products using alter
 select* from product;
 INSERT INTO product(product_id,description,price,category,max_qty) 
 values(101, 'kiwi', 3.66, 'fruit', 10),
	   (102, 'kk', 3.99, 'fruit', 8);
       
 select *
 from product
 where category in (
	 select category
	 from (
		 select category, count(*) as cnt
		 from product
		 group by category
		 having cnt=(
			 select  min(p.product_per)
			 from (
				 select category, count(product_id) as product_per
				from product
				group by category
				) p
			)
		) pp
	);

--

SELECT product_id, description, category, price
FROM product
WHERE category = (
    SELECT category
    FROM product
    GROUP BY category
    ORDER BY COUNT(*) ASC
    LIMIT 1
);

-- Generate report showing tran_hdr table only for those members who had registered in store 1
use retail;
select* from tran_hdr;

SELECT *
FROM tran_hdr
WHERE member_id IN (
    SELECT member_id
    FROM member_t
    WHERE store_id = 1
);
select* from member_t;

-- Generate report showing tran_dtl table only for products belonging to ‘grocery’category

SELECT *
FROM tran_dtl
WHERE product_id IN (
    SELECT product_id
    FROM product
    WHERE category = 'grocery'
);
-- Generate report showing tran_dtl table only for those products which had ‘chee’ in their description
SELECT *
FROM tran_dtl
WHERE product_id IN (
    SELECT product_id
    FROM product
    WHERE LOWER(description) LIKE '%chee%'
);
-- Generate report showing number of transaction for each member in which he/she had purchased ‘bread’.
-- (member_id,num_tran)
use retail;
select* from tran_dtl;
SELECT tran_id, COUNT(*) AS num_tran
FROM tran_dtl
WHERE product_id IN (
    SELECT product_id
    FROM product
    WHERE LOWER(description) LIKE '%bread%'
)
GROUP BY tran_id;
-- Generate report showing member details for those members who had purchased ‘milk’ and ‘apple’ in single transaction. 
-- (member_id,first_name,last_name)


-- Generate report showing tran-hdr table only for those members who had registered in the month of ‘May’ of any year.
use retail;
SELECT th.*
FROM tran_hdr th
JOIN member_t m ON th.member_id = m.member_id
WHERE month(tran_dt)= 5;

-- Generate report showing tran_hdr table only for those transaction in which at least one product starting from ‘L’ I purchased.
select* from product;
SELECT td.tran_id,td.product_id,p.description,td.tran_dt
FROM tran_hdr th
JOIN tran_dtl td ON th.tran_id = td.tran_id
JOIN product p ON td.product_id = p.product_id
WHERE p.description LIKE 'L%';

-- Generate report showing no. of transactions per member in which he had not purchased 
-- any product from ‘dairy’category
use retail;
select * from tran_hdr;
SELECT member_id, COUNT(tran_dt) AS num_transactions_without_dairy
FROM tran_dt
WHERE NOT EXISTS (
    SELECT 1
    FROM product p
    WHERE p.product_id = t.product_id
    AND p.category = 'dairy'
)
GROUP BY member_id;

-- Generate report that shows number of transactions per member per store. (Show member name and store city)
use retail;
USE retail;
select* from tran_hdr;
SELECT first_name, sd.store_city, COUNT(*) AS total_tran
FROM tran_hdr th
JOIN store_dtl sd ON sd.store_id = th.store_id
join member_t t on t.member_id = th.member_id
GROUP BY th.member_id,sd.store_city;




-- Generate a report that shows total product sale by month. show product_description, month and sale
select * from product;
select* from tran_dtl;
select p.product_id,count(td.amt) as total_sale,p.description,month(td.tran_dt) as month_ts
from product p join tran_dtl td on p.product_id=td.product_id
group by p.product_id,p.description,month(td.tran_dt);

-- Generate a report that shows total sale by member, product and month. (show member name, product description, month, total_sale on the report.)
select m.first_name,m.last_name,p.product_id,p.description,
count(td.amt) as total_sale,month(td.tran_dt) as month_ts from product p join tran_dtl td join member_t m
on p.product_id=td.product_id group by m.first_name,m.last_name,p.product_id,p.description,month(td.tran_dt);
-- Generate a report that shows employee number, first name, title, department name 92.
-- (92)
use emp;
show tables;
select e.emp_no,e.first_name,t.title,d.dept_name
from employees e join titles t join departments d on e.emp_no=t.emp_no;
-- (93)
select t.title, count(*) as num_emp,d.dept_name,de.dept_no
from titles t join dept_emp de join departments d on t.emp_no=de.emp_no
group by t.title,d.dept_name,de.dept_no;
-- (94)
use retail;
select td.tran_id,td.product_id,p.description,td.amt,td.tran_dt
from tran_dtl td join product p on td.product_id=p.product_id;
-- (95)
select th.tran_id,m.member_id,m.first_name,th.tran_dt
from tran_hdr th join member m on th.member_id=m.member_id;
-- (96)
select * from member;
select * from store_dtl;
select *from tran_hdr;
select th.tran_id,m.member_id, sd.store_city,th.tran_dt
from tran_hdr th join member m join store_dtl sd on th.member_id=m.member_id;
-- (97)
select m.member_id,count(th.tran_id) as num_tran,m.first_name
from member m join tran_hdr th on m.member_id=th.member_id
group by m.member_id,m.first_name;
-- (98)
select * from store_dtl;
select th.store_id,count(th.tran_id) as num_tran,sd.store_city
from tran_hdr th join store_dtl sd on th.store_id=sd.store_id
group by th.store_id,sd.store_city order by num_tran desc;
-- (99)
select * from product;
select * from tran_dtl;
select p.product_id,count(td.qty) as total_qty,p.description
from product p join tran_dtl td on p.product_id=td.product_id group by product_id,description;
-- (100)
select th.member_id,count(td.amt) as total_purchase_amt,m.first_name,m.last_name
from tran_hdr th join tran_dtl td join member m on th.tran_id=td.tran_id 
group by th.member_id,m.first_name,m.last_name;
-- (101)
select * from tran_hdr;
select th.member_id,count(th.tran_id) as num_tran,th.store_id,sd.store_city
from tran_hdr th join store_dtl sd on th.store_id=sd.store_id
group by th.member_id,th.store_id,sd.store_city;
-- (102)
select p.product_id,p.description,count(td.qty) as total_qty,sd.store_id,sd.store_city
from product p join tran_dtl td join store_dtl sd on p.product_id=td.product_id
group by p.product_id,p.description,sd.store_id,sd.store_city;
-- (103)
select * from store_dtl;
select * from tran_dtl;
select p.product_id,p.category,count(td.amt) as total_amt,sd.store_city
from product p join tran_dtl td join store_dtl sd on p.product_id=td.product_id
group by p.product_id,p.category,sd.store_city;
-- (104)
select p.category,count(td.amt) as total_amt,month(tran_dt) as month_ts
from product p join tran_dtl td on p.product_id=td.product_id
group by p.category,month(tran_dt) order by month(tran_dt);
-- (105)
select m.member_id,count(td.amt) as total_amt,p.category,month(tran_dt) as month_ts
from product p join tran_dtl td join member m on p.product_id=td.product_id
group by m.member_id,p.category,month(tran_dt) order by month(tran_dt);
-- (106)@
use retail;
select * from member;
select * from tran_dtl;
select m.member_id,m.first_name,count(th.tran_id) as num_tran_100
from member m join tran_hdr th join tran_dtl td on m.member_id=th.member_id
where td.amt >100
group by m.member_id,m.first_name;
-- (107)
select product_id,description,category,price,
CASE when price <=2 then "smaller"
when price <=5 then "avg_price"
else "greater"
end as prod_cat from product;
 -- (108)
select * from tran_hdr;
select m.member_id,sum(td.qty) as total_purch_qty,
case when sum(td.qty) <=3000000 then 'low'
when sum(td.qty) <=4000000 then 'medium'
else 'high'
end as classification
from member m join tran_dtl td join tran_hdr th on m.member_id=th.member_id
group by m.member_id;
-- (109)
select * from tran_dtl;
select tran_id,product_id,qty,amt,tran_dt,quarter(tran_dt) as quarter_ts
from tran_dtl;
-- (110)
select quarter(tran_dt) as qtr_name,count(tran_id) as num_tran
from tran_dtl group by quarter(tran_dt);
-- (111)
use retail;
SELECT 
    CASE 
        WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 7 AND 9 THEN 'Q3'
        ELSE 'Q4'
    END AS qtr_name,
    COUNT(*) AS num_tran
FROM 
    tran_dtl
GROUP BY 
    qtr_name
ORDER BY 
    qtr_name;
    
-- (112)
use retail;
SELECT
    member_id,
    qtr,
    COUNT(*) AS num_tran
FROM
    (SELECT
        member_id,
        CASE
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 1 AND 3 THEN 'Q1'
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 4 AND 6 THEN 'Q2'
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 7 AND 9 THEN 'Q3'
            ELSE 'Q4'
        END AS qtr
    FROM
       tran_hdr ) AS quarterly_transactions
GROUP BY
    member_id,
    qtr;

-- (113)
SELECT
    member_id,
    store_id,
    qtr,
    COUNT(*) AS num_tran
FROM
    (SELECT
        member_id,
        store_id,
        CASE
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 1 AND 3 THEN 'Q1'
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 4 AND 6 THEN 'Q2'
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 7 AND 9 THEN 'Q3'
            ELSE 'Q4'
        END AS qtr
    FROM
        tran_hdr) AS quarterly_transactions
GROUP BY
    member_id,
    store_id,
    qtr;

-- (114)
SELECT
    product_id,
    tran_dt,
    total_daily_sale,
    CASE
        WHEN total_daily_sale >= 500 THEN 'High'
        WHEN total_daily_sale >= 200 AND total_daily_sale < 500 THEN 'Medium'
        ELSE 'Low'
    END AS classification
FROM
    (SELECT
        product_id,
        tran_dt,
        SUM(year_ts) AS total_daily_sale
    FROM
        product_daily_sale
    GROUP BY
        product_id,
        tran_dt) AS product_sales;

-- (115)
SELECT
    product_id,
    tran_dt,
    qtr,
    COALESCE(SUM(total_daily_sale), 0) AS total_sale
FROM
    (SELECT
        product_id,
        tran_dt,
        CASE
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 1 AND 3 THEN 'Q1'
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 4 AND 6 THEN 'Q2'
            WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 7 AND 9 THEN 'Q3'
            ELSE 'Q4'
        END AS qtr,
        total_daily_sale
    FROM
        product_daily_sale) AS quarterly_sales
GROUP BY
    product_id,
    tran_dt,
    qtr;
    
-- (116)
select * from tran_dtl;
select * from tran_hdr;
select 

 p.category, 
 
case
     when month(td.tran_dt) between 1 and 4 then 'first quarter'
	 when month(td.tran_dt) between 5 and 8 then 'second quarter'
	 when month(td.tran_dt) between 9 and 12 then 'third quarter'
     end as per_quarter,
      
     count(td.amt)   as total_sale 
      
from product p
join tran_dtl td on td.product_id=p.product_id

group by p.category,per_quarter

;
-- (117)
SELECT
    member_id,
    SUM(CASE WHEN store_id = 'store1' THEN 1 ELSE 0 END) AS store1_tran,
    SUM(CASE WHEN store_id = 'store2' THEN 1 ELSE 0 END) AS store2_tran,
    SUM(CASE WHEN store_id = 'store3' THEN 1 ELSE 0 END) AS store3_tran
FROM
    tran_hdr
GROUP BY
    member_id;
 
 -- (118)
 SELECT
    category,
    SUM(CASE WHEN max_qty = 'High' THEN 1 ELSE 0 END) AS high_value,
    SUM(CASE WHEN max_qty= 'Medium' THEN 1 ELSE 0 END) AS med_value,
    SUM(CASE WHEN max_qty = 'Low' THEN 1 ELSE 0 END) AS low_value,
    COUNT(*) AS total_products
FROM
    product
GROUP BY
    category;
-- (119)
SELECT
    member_id,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 1 AND 3 THEN 1 ELSE 0 END) AS qtr1,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 4 AND 6 THEN 1 ELSE 0 END) AS qtr2,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 7 AND 9 THEN 1 ELSE 0 END) AS qtr3,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 10 AND 12 THEN 1 ELSE 0 END) AS qtr4,
    COUNT(*) AS total_tran
FROM
    tran_hdr
GROUP BY
    member_id;

-- (120)
SELECT
    store_id,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 1 AND 3 THEN 1 ELSE 0 END) AS qtr1,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 4 AND 6 THEN 1 ELSE 0 END) AS qtr2,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 7 AND 9 THEN 1 ELSE 0 END) AS qtr3,
    SUM(CASE WHEN EXTRACT(MONTH FROM tran_dt) BETWEEN 10 AND 12 THEN 1 ELSE 0 END) AS qtr4,
    COUNT(*) AS total_tran
FROM
    tran_hdr
GROUP BY
    store_id;
-- (121)
select p.product_id,
p.description,
COUNT(CASE WHEN th.store_id='1' THEN 1 END) AS st1_tran,
    COUNT(CASE WHEN th.store_id='2' THEN 1 END) AS st2_tran,
COUNT(CASE WHEN th.store_id='3' THEN 1 END) AS st3_tran
from

 tran_dtl td

join tran_hdr th on th.tran_id=td.tran_id
join product p on p.product_id=td.product_id
join store_dtl sd on th.store_id=sd.store_id

group by td.product_id,sd.store_id,p.description;

-- (122)
select p.product_id,
p.description,
count(case when max_qty<=5 then 1 end) as st1_qty ,
count(case when max_qty<=3 then 1 end) as st2_qty ,
count(case when max_qty<=1 then 1 end) as st3_qty,
count(max_qty)
from

 tran_dtl td

join tran_hdr th on th.tran_id=td.tran_id
join product p on p.product_id=td.product_id
join store_dtl sd on th.store_id=sd.store_id

group by td.product_id,sd.store_id,p.description;
-- (123)
select 
p.category,
count(case when th.store_id='1' then 1 end) as st1_qty ,
count(case when th.store_id='2' then 1 end) as st2_qty ,
count(case when th.store_id='3' then 1 end) as st3_qty
from

 tran_dtl td

join tran_hdr th on th.tran_id=td.tran_id
join product p on p.product_id=td.product_id
join store_dtl sd on th.store_id=sd.store_id

group by p.category,sd.store_id;
-- (124)
SELECT
    sd.store_id,
    SUM(CASE WHEN EXTRACT(MONTH FROM mt.reg_date) BETWEEN 1 AND 3 THEN 1 ELSE 0 END) AS qtr1_reg,
    SUM(CASE WHEN EXTRACT(MONTH FROM mt.reg_date) BETWEEN 4 AND 6 THEN 1 ELSE 0 END) AS qtr2_reg,
    SUM(CASE WHEN EXTRACT(MONTH FROM mt.reg_date) BETWEEN 7 AND 9 THEN 1 ELSE 0 END) AS qtr3_reg,
    SUM(CASE WHEN EXTRACT(MONTH FROM mt.reg_date) BETWEEN 10 AND 12 THEN 1 ELSE 0 END) AS qtr4_reg
FROM
    member_t mt
JOIN
    store_dtl sd ON mt.store_id = sd.store_id
GROUP BY
    sd.store_id;
 -- (125)
 
 SELECT
    p.category,
    SUM(CASE WHEN th.store_id = 'st1' THEN th.tran_id ELSE 0 END) AS st1_sale,
    SUM(CASE WHEN th.store_id = 'st2' THEN th.tran_id ELSE 0 END) AS st2_sale,
    SUM(CASE WHEN th.store_id = 'st3' THEN th.tran_id ELSE 0 END) AS st3_sale,
    SUM(t.tran_id) AS total_sale
FROM
    tran_hdr th
JOIN
    product p ON th.product_id = p.product_id
GROUP BY
    p.category;

 -- (126)
 SELECT
   p.product_id,
    SUM(CASE WHEN t.store_id = 'st1' THEN 1 ELSE 0 END) AS st1_tran,
    SUM(CASE WHEN t.store_id = 'st2' THEN 1 ELSE 0 END) AS st2_tran,
    SUM(CASE WHEN t.store_id = 'st3' THEN 1 ELSE 0 END) AS st3_tran
FROM
    tran_dtl t
JOIN
    product p ON t.product_id = p.product_id
WHERE
    p.description = 'cheese'
GROUP BY
    p.product_id;

-- (127)

use retail;
-- Generate report showing product _id,description,month,monthly_sale,previous_month_sale.

use retail;
-- Generate report showing product _id,description,month,monthly_sale,previous_month_sale.

select  product_id,description,
this_month,
monthly_sale,
prev_monthly_sale 
from (
	select product_id,description,this_month,monthly_sale,
    lag(monthly_sale) over(partition by product_id order by this_month) as prev_monthly_sale from 
	(
		select description,td.product_id,month(tran_dt) as this_month,sum(amt) as monthly_sale
		 from tran_dtl td
		join product p on td.product_id=p.product_id
		group by product_id,this_month,description) s
        ) s1
        ;
        
-- (128)
select  product_id,description,
this_month,
monthly_sale,
sale_upto_this_month,
monthly_sale+sale_upto_this_month as upto 
from (
	select product_id,description,this_month,monthly_sale,
    lag(monthly_sale,1,0) over(partition by product_id order by this_month) as sale_upto_this_month from 
	(
		select description,td.product_id,month(tran_dt) as this_month,sum(amt) as monthly_sale
		 from tran_dtl td
		join product p on td.product_id=p.product_id
		group by product_id,description,this_month) s
        ) s1
        ;
        
-- (129)
select sd.store_id,month(td.tran_dt),count(td.tran_id),
RANK () OVER (ORDER BY td.tran_id desc) AS tran_rank  
 from store_dtl sd 
	join tran_hdr th on th.store_id=sd.store_id
	join tran_dtl td on td.tran_id=th.tran_id
    group by store_id,td.tran_id,td.tran_dt;
    
-- (130)
select sd.store_id,month(td.tran_dt) as per_month,sum(td.amt) as total_sale,
RANK () OVER (ORDER BY store_id desc) AS tran_rank  
 from store_dtl sd 
	join tran_hdr th on th.store_id=sd.store_id
	join tran_dtl td on td.tran_id=th.tran_id
    group by sd.store_id,per_month;

-- (131)
select th.member_id,td.product_id,sum(td.amt) as total_sale,
RANK () OVER (ORDER BY member_id desc) AS rank_product  
 from tran_dtl td 
	join tran_hdr th on th.tran_id=td.tran_id
    
    where member_id='1010'
    group by th.member_id,product_id;
    
-- (132)
use retail;

  
select member_id,total_sale,last_1rd_month_sale+last_2rd_month_sale+last_3rd_month_sale as last_total_3
  from(
  
	  select member_id,total_sale,tran_dt,last_2rd_month_sale,last_3rd_month_sale,
	lag(total_sale,1) over(partition by member_id order by tran_dt) as last_1rd_month_sale   
	 from   
	  (
		  select member_id,total_sale,tran_dt,last_3rd_month_sale, 
		lag(total_sale,2) over(partition by member_id order by tran_dt) as last_2rd_month_sale   
		 from   
			 (
			  select member_id,total_sale,tran_dt,
			lag(total_sale,3) over(partition by member_id order by tran_dt) as last_3rd_month_sale   
			 from 
			(	select member_id,sum(amt) as total_sale,td.tran_dt
				from 
				tran_dtl td
				join tran_hdr th on th.tran_id=td.tran_id
				group by member_id,tran_dt
				)s
				)s1
				)s2
                )s3;  
			
-- (133)
select store_id,month(tran_dt),total_sale,prev_1_avg+prev_2_avg+prev_3_avg as total_last_3_AVG 
from
(
select store_id,month(tran_dt),total_sale, 
lag(average_sale,1) over(partition by store_id order by tran_dt) as prev_1_avg,
lag(average_sale,2) over(partition by store_id order by tran_dt) as prev_2_avg,
lag(average_sale,3) over(partition by store_id order by tran_dt) as prev_3_avg,tran_dt

from(
	select sd.store_id,month(td.tran_dt),sum(amt) as total_sale,avg(amt) as average_sale,td.tran_dt from store_dtl sd
	join tran_hdr th on th.store_id=sd.store_id
	join tran_dtl td on td.tran_id=th.tran_id
	group by sd.store_id,td.tran_dt)s
    )s1
    ;

-- (134)
select store_id,product_id,description,total_qty,product_rank from(


	select sd.store_id,p.product_id,description,count(qty) as total_qty,
	ROW_NUMBER() OVER (PARTITION BY store_id ORDER BY count(qty) DESC) AS product_rank
	from tran_dtl td
	join tran_hdr th on th.tran_id=td.tran_id
	join store_dtl sd on sd.store_id=th.store_id
	join product p on td.product_id=p.product_id
	
	group by product_id,sd.store_id,description
)s
where product_rank<=3
;

-- (135)
select store_id,per_month,category,total_sale,
ROW_NUMBER() OVER(partition by store_id order by total_sale desc) as category_rank 
from 
(
select sd.store_id,month(td.tran_dt) as per_month,p.category,sum(td.amt) as total_sale
	from tran_dtl td
	join tran_hdr th on th.tran_id=td.tran_id
	join store_dtl sd on sd.store_id=th.store_id
	join product p on td.product_id=p.product_id
    group by sd.store_id,per_month,p.category
   )s ;

-- (136)


	SELECT
		member_id,
		MAX(CASE WHEN max_rank = 1 THEN product_id END) AS max_purchase_prod_id,
		 
		MAX(CASE WHEN min_rank = 1 THEN product_id END) AS min_purchase_prod_id
	FROM
	(
	select member_id,product_id,
			ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY product_id DESC) AS max_rank,
			ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY product_id ASC) AS min_rank
		FROM
	(
	select th.member_id,product_id
	 from tran_dtl td 
		join tran_hdr th on th.tran_id=td.tran_id
	group by th.member_id,td.product_id
	)s
	group by member_id,product_id)s1
	 group by member_id 
     ;
     
     
     
     
     -- alternate
     
     WITH RankedProducts AS (
    SELECT
        member_id,
        product_id,
        ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY product_id ASC) AS min_rank,
        ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY product_id DESC) AS max_rank
    FROM tran_dtl td
       join tran_hdr th on th.tran_id=td.tran_id
)
SELECT
    member_id,
    MAX(CASE WHEN max_rank = 1 THEN product_id END) AS max_purchase_prod_id,
    MAX(CASE WHEN min_rank = 1 THEN product_id END) AS min_purchase_prod_id
FROM
    RankedProducts
GROUP BY
    member_id;
