create database customer;
use customer;
create table customer_details(
customer_id int,
customer_name varchar(30)not null,
customer_email varchar(20) unique,
customer_phone bigint unique,
customer_address varchar(50),
primary key (customer_id)
);
show tables;
select*from customer_details;
use customer;
select*from customer_details;
insert into customer_details values (1,'vijay','vijay@gmail.com','6789809008','kolkata');
insert into customer_details values (2,'varun','varu@gmail.com','6789809009','kolegal');
insert into customer_details values (3,'lavanya','lavanya@gmail.com','6789809089','mysore')
insert into customer_details values (4,'vikas','vr@gmail.com','6789809026','banglore');
insert into customer_details values (5,'vijay','vijay@gmail.com','6789809008','kolkata')
insert into customer_details values (6,'vijay','vijay@gmail.com','6789809008','kolkata')
insert into customer_details values (7,'vijay','vijay@gmail.com','6789809008','kolkata')
insert into customer_details values (8,'vijay','vijay@gmail.com','6789809008','kolkata')
insert into customer_details values (9,'vijay','vijay@gmail.com','6789809008','kolkata')
insert into customer_details values (10,'vijay','vijay@gmail.com','6789809008','kolkata')