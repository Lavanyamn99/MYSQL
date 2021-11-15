CREATE DATABASE library;
USE library;
CREATE TABLE Book_Details(
  Book_Id TINYINT,
  Book_Name VARCHAR(30),
  Author_Name VARCHAR(20),
  Book_Price FLOAT,
  Published_Year YEAR,
  Book_Volume CHAR(10)
  );
  SHOW TABLES;
  
  SELECT*FROM Book_Details;
  
  -- ways to insert
  
  INSERT INTO Book_Details values(1,'DBMS','Ballguru Swamy',569.0,'1999','v6');
  INSERT INTO Book_Details values(2,'Data Structure','Padma Reddy',699.0,'2015','v7');
  INSERT INTO Book_Details values(3,'Basic Electrical','Bakshi',400.0,'2017','v8');
  


  -- second way to insert
  
  INSERT INTO Book_Details(Book_Id,Book_Name,Author_Name)value(4,'Fairy Tale','Jeffy');
  INSERT INTO Book_Details(Book_Id,Book_Name,Author_Name,Book_Price,Book_Volume)value(5,'Ablitity','Jenny',567.9,'v9');
  
  select Book_Id,Book_Name,Author_Name from Book_Details;
  select*from Book_Details where Published_Year='1999';
  select*from Book_Details where Book_Name='Fairy Tale';
  select*from Book_Details where Published_Year>='2000' and Book_Price>=800;
  select*from Book_Details where Published_Year>'2000' and Book_Price>200;
  select*from Book_Details where Published_Year>'1999' and Book_Id>=1;
  select*from Book_Details where Published_Year>'1999' or Book_Id>=1;
  select*from Book_Details where Published_Year>'2000' or Book_Price>200;
  
  -- alter tables
  alter table Book_Details add column No_Of_pages int;
  alter table Book_Details add column rewards varchar(10);
  select*from Book_Details;
  alter table Book_Details drop column No_Of_pages;

  
 
  -- order by
  
 select*from Book_Details order by Book_Price;
  select*from Book_Details order by Book_Volume;
  select*from Book_Details order by Book_Price desc;
select*from Book_Details order by Book_Name desc;
select*from Book_Details order by Book_Name;
select*from Book_Details order by Book_Id;

-- limit 

select*from Book_Details limit 3;
select*from Book_Details limit 2;

select*from Book_Details order by Book_Id asc limit 4;

select*from Book_Details order by Book_Name asc limit 5;

select*from Book_Details where Book_Name='DBMS';

select*from Book_Details where Book_Name='DBMS' or Book_Name='Basic Electrical';

select*from Book_Details where Book_Id in (1,3,4);

select*from Book_Details where  Book_Name in ('DBMS','Ability','Fairy Tale');

select*from Book_Details where Book_Price between 200 and 700;

select*from Book_Details where Book_Id between 2 and 4 order by Published_Year;

-- as

select Book_Price as Book_Price_Greater_than_600 from Book_Details where Book_Price>600;
select Book_Price from Book_Details;

select*from Book_Details where Book_Name='Basic Electrical';
select*from Book_Details where Book_Name like '%a';
select*from Book_Details where Book_Name like 'b%';
select*from Book_Details where Book_Name like '%e';
select*from Book_Details where Book_Name like '__t%';
select*from Book_Details where Book_Name like '_a__%';

-- date and time

select curdate();
select curdate() as Present_Date;
select current_time() as Present_Time;
select current_timestamp() as Present_Info;
select now() as Time;

select date ('2021-11-12 22:25:43') as Extracted_date;
select date(now()) as Extracted_date;
select dayofmonth(('2021-11-12 22:25:43')) as Extracted_day;
select monthname(('2021-11-12 22:25:43'))as Extracted_Month;
select year(('2021-11-12 22:25:43'))as Extracted_Year;
select week(('2021-11-12 22:25:43'))as Extracted_Week;
select dayname(('2021-11-12 22:25:43'))as Extracted_week;

-- highest and lowest cost of book

select max(Book_Price) from Book_Details;
select min(Book_Price) from Book_Details;
select min(Book_Price) as lowest_price from Book_Details;
select max(Book_Price) as highest_price from Book_Details;
select avg(Book_Price) as Average_price from Book_Details;

-- sum book
select sum(Book_Price)from Book_Details;
select sum(Book_Price) as total_cost from Book_Details;
select sum(Book_Id) as no_of_book from Book_Details;
select count(Book_Id) as total_books from Book_Details;

-- get the number of book written by author by using group by clause

select Author_Name,count(Book_Name) from Book_Details group by Author_Name;

select Author_Name,count(Book_Name) as no_of_book from Book_Details group by Author_Name;

select Book_Price,count(Book_Price) from Book_Details group by Book_Price ;


select*from Book_Details;

select Published_Year,count(Book_Name)as no_of_books_in_year from Book_Details group by Published_Year;

select Published_Year,count(Book_Name)as no_of_books_in_year from Book_Details where Published_Year>2000 group by Published_Year;

-- group by

select Book_Price,count(Book_Price)as No_of_books from Book_Details group by Book_Price;
select Book_Name,count(Book_Name)as no_of_copies from Book_Details group by Book_Name;
select Book_Id,min(Book_Price)as lowest_price from Book_Details group by Book_Id;
select Published_year,max(Book_Price)as highest_price from Book_Details group by Published_year;
select Published_year,Author_Name,min(Book_Price)as lowest_price from Book_Details group by Published_year,Author_Name;
select Book_Id,Published_year,min(Book_Price)as lowest_price,max(Book_Price)as highest_price from Book_Details group by Book_Id,Published_year;
select Published_year,Author_Name,sum(Book_Price)as Total_Price from Book_Details  group by Published_year,Author_Name having Total_Price>400 ;
select Book_Id,Published_year,min(Book_Price)as lowest_price,max(Book_Price)as highest_price from Book_Details group by Book_Id,Published_year having Book_Id>3;
select Book_Volume,Book_Name,count(Book_Name)as no_of_copies from Book_Details group by Book_Volume,Book_Name having no_of_copies>2;
select Author_name,min(Book_Price)as lowest_price from Book_Details group by Author_name having lowest_price>100;

set autocommit=1;
select*from library.Book_Details;
delete from Book_Details where Book_Id=4;

commit;
delete from Book_Details where Book_Id=12;
delete from Book_Details where Book_Name='DBMS';

savepoint Book_Name;
update Book_Details set Book_Name =800 where Book_Id=2;
update Book_Details set Book_Name =500 where Book_Id=3;

savepoint Book_Id;

rollback;

select max(Book_Price) from  Book_Details;
select min(Book_Price) from  Book_Details; 

-- get the details  of the book which has highest cost

select*from  Book_Details where Book_Price =(select max(Book_Price) from  Book_Details);
select*from  Book_Details where Book_Price =(select min(Book_Price) from  Book_Details);
select*from  Book_Details where Book_Price>(select min(Book_Price) from  Book_Details);
select*from  Book_Details where Book_Price<(select max(Book_Price) from  Book_Details);

-- get second largest cost of book 

select *from Book_Details where Book_Price=699;
select max(Book_Price)as second_highest from Book_Details where Book_Price< (select max(Book_Price) from  Book_Details);
select*from  Book_Details where Book_Price = (select max(Book_Price)as second_highest from Book_Details where Book_Price< (select max(Book_Price) from  Book_Details));

-- get third largest cost of book

select *from Book_Details where Book_Price=569;
select max(Book_Price)as third_highest from Book_Details where Book_Price<(select max(Book_Price)as second_highest from Book_Details where Book_Price< (select max(Book_Price) from  Book_Details));
select*from  Book_Details where Book_Price = 
(select max(Book_Price)as third_highest from Book_Details where Book_Price<(select max(Book_Price)as second_highest from Book_Details where Book_Price< (select max(Book_Price) from  Book_Details)));

-- get price between highest and second highest cost

select *from Book_Details where Book_Price in (699,569);
select*from  Book_Details where Book_Price in((select max(Book_Price)Book_Details),(select max(Book_Price)as second_highest from Book_Details where Book_Price< (select max(Book_Price) from  Book_Details)));

-- average cost

select avg(Book_Price)from Book_Details;
select*from  Book_Details where Book_Price in (select avg(Book_Price)from Book_Details);

-- get the book details by the book name which is published in the year 2005
select*from Book_Details where Book_Name in((select Book_Name from Book_Details group by Published_Year having Published_Year>2005));
select Book_Name from Book_Details where Publish_Year>2005