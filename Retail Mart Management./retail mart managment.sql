/*Write a query to create a database named SQL basics.*/
create database SQL_basics;

/*Write a query to select the database SQL basics.*/
use SQL_basics;


/*Write a query to create a product table with fields as product code,
 product name, price, stock and category, customer table with the fields as customer id, 
 customer name, customer location, and customer phone number and, 
 sales table with the fields as date, order number, product code, product name, quantity, and price.*/
create table product(
product_code int,
product_name varchar(20),
price int,
stock varchar(20),
category varchar(20)
);

create table customer(
customer_id int,
customer_name varchar(20),
customer_location varchar(50),
customer_phone_number int
);

create table sales(
date date,
order_number int,
product_code int,
product_name varchar(20),
quantity int,
price int
);

select * from customer;
select * from sales;

/*Write a query to add two new columns such as S_no and categories to the sales table.*/
alter table sales
add s_no int, 
add categories varchar(20);

/*Write a query to change the column type of stock in the product table to varchar.*/
alter table product
modify column stock int;

alter table product
modify column stock varchar(20);



/*Write a query to change the table name from customer-to-customer details.*/
alter table customer
rename to customer_details;

/*Write a query to drop the columns S_no and categories from the sales table.*/
alter table sales
drop s_no,
drop categories;


select * from sales;

alter table sales
rename column c_id  to customer_id ,
rename column qty to quantity ;




/*Write a query to display order id, customer id, order date, price, and quantity from the sales table.*/
select order_no,order_date,price,quantity from sales;



/*Write a query to display all the details in the product table if the category is stationary.*/
select * from product
where category = 'stationary';


/*Write a query to display a unique category from the product table.*/
select distinct(category) from product;


/*Write a query to display the sales details if quantity is greater 
than 2 and price is lesser than 500 from the sales table.*/
select * from sales
where quantity > 2 and price < 500;



/*Write a query to display the customer’s name if the name ends with a.*/
select customer_name from customer_details 
where customer_name like '%a';



/*Write a query to display the product details in descending order of the price.*/
select * from sales
order by price desc;


/*Write a query to display the product code and category
 from similar categories that are greater than or equal to 2.*/
select  product_code,category from product 
where category in (select category from product
group by category having count(*) >=2);


/*Write a query to display the order number and the 
customer name to combine the results of the order and the customer tables including duplicate rows.*/
select sales.order_no,sales.c_name from sales
inner join customer_details
on sales.customer_id=customer_details.customer_id
order by order_no;