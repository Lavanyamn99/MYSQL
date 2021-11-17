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
insert into customer_details values (3,'lavanya','lavanya@gmail.com','6789809089','mysore');
insert into customer_details values (4,'vikas','vr@gmail.com','6789809026','banglore');
insert into customer_details values (5,'charu','ch@gmail.com','67898090988','chennai');
insert into customer_details values (6,'dia','dia@gmail.com','6789809508','bhopal');
insert into customer_details values (7,'jay','jay@gmail.com','6789809208','assam');
insert into customer_details values (8,'avi','avi@gmail.com','6789809058','hydrabad');
insert into customer_details values (9,'koushi','kh@gmail.com','6789809028','delhi');
insert into customer_details values (10,'vibha','vibha@gmail.com','6789809038','shimogga');

create table orders(
order_id int,
product_name varchar(30) not null,
order_amt decimal check(order_amt>100),
order_datetime datetime,
customer_ref int,
primary key (order_id),
foreign key(customer_ref)references customer_details(customer_id)
);
show tables;
select*from orders;
insert into orders values(100,'dress',5657,'2021-11-1 09:00:00',1);
select*from orders;
insert into orders values(101,'dress',5657,'2021-11-1 09:00:00',2);
insert into orders values(102,'iphone',56587,'2021-11-2 08:00:00',3);
insert into orders values(103,'lipstick',567,'2021-11-3 02:00:00',4);
insert into orders values(104,'perfume',557,'2021-11-4 05:00:00',5);
insert into orders values(105,'laptop',56957,'2021-11-5 07:00:00',6);
insert into orders values(106,'ring',5657,'2021-11-6 09:01:00',7);
insert into orders values(107,'necklace',8057,'2021-11-7 11:00:00',8);
insert into orders values(108,'dress',567,'2021-11-8 02:00:00',9);
insert into orders values(109,'dress',9657,'2021-11-9 09:00:00',10);

select*from customer_details where customer_id=1;
select O.order_id,O.product_name,O.order_amt,O.order_datetime,O.customer_ref,C.customer_id,C.customer_name,C.customer_email from customer_details C inner join orders O on O.customer_ref=C.customer_id;
select*from customer_details C left join orders O on O.customer_ref=C.customer_id;
select*from customer_details C right join orders O on O.customer_ref=C.customer_id;