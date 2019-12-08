
use lab08;
create table salesman(
SALESMAN_ID NUMERIC(5) primary key,
NAME VARCHAR(30),
CITY VARCHAR(15),
COMMISSION DECIMAL(5,2)
);

create table orders(
ORD_NO NUMERIC(5) PRIMARY KEY,
PURCH_AMT DECIMAL(8,2),
ORD_DATE DATE,
CUSTOMER_ID NUMERIC(5),
SALESMAN_ID NUMERIC(5)
);

create table customer(
CUSTOMER_ID NUMERIC(5) PRIMARY KEY,
CUST_NAME VARCHAR(30),
CITY VARCHAR(15),
GRADE NUMERIC(3),
SALESMAN_ID NUMERIC(5)
);

insert into salesman values(5001,"James Hoog","New York",0.15),
	(5002,"Nail Knite","Paris",0.13),
	(5005,"Pit Alex","London",0.11),
    (5006,"Mc Lyon","Paris",0.14),
    (5007,"Paul Adam","Rome",0.13),
    (5003,"Lauson Hen","San Jose",0.12);
    
insert into orders values(70001,150.5,"2012-10-05", 3005, 5002),
(70009, 270.65, "2012-09-10", 3001, 5005),
(70002, 65.26, "2012-10-05", 3002, 5001),
(70004, 110.5," 2012-08-17", 3009 ,5003),
(70007, 948.5, "2012-09-10" ,3005, 5002),
(70005 ,2400.6, "2012-07-27" ,3007, 5001),
(70008 ,5760 ,"2012-09-10", 3002, 5001),
(70010 ,1983.43, "2012-10-10",3004, 5006),
(70003 ,2480.4, "2012-10-10", 3009,5003),
(70012, 250.45, "2012-06-27" ,3008, 5002),
(70011 ,75.29, "2012-08-17", 3003, 5007),
(70013, 3045.6,"2012-04-25",3002 ,5001);


insert into customer values(3002 ,"Nick Rimando", "New York", 100 , 5001),
 (3007, "Brad Davis"  ,"New York" , 200, 5001),
 (3005 , "Graham Zusi" , "California" , 200, 5002),
 (3008 , "Julian Green" , "London" , 300,  5002),
 (3004 , "Fabian Johnson", "Paris" , 300 ,5006),
 (3009 , "Geoff Cameron", "Berlin" , 100 , 5003),
 (3003 , "Jozy Altidor" , "Moscow", 200 , 5007),
 (3001 , "Brad Guzan",  "London" ,null, 5005);
 
 
 
 create view Cust_city as select * from salesman where city = "New York" or city = "London" or city="Rome";
  select * from Cust_city;
 
 
 create view Q2 as select CUSTOMER_ID,CUST_NAME,SALESMAN_ID,CITY from customer ;
 select * from Q2;

create view Q3 as select orders.ORD_DATE , salesman.NAME , salesman.SALESMAN_ID from salesman,orders where salesman.SALESMAN_ID  = orders.SALESMAN_ID and
orders.ORD_DATE in ("2012-08-17","2012-10-10");

select * from Q3;

select * from Q3 where ORD_DATE = "2012-10-10";

create  view dateord (ord_date, odcount) as select ord_date, count(*) from orders group by  ord_date;
select * from dateord;

create  view citymatch(custcity, salescity) as select distinct a.city, b.city from customer a, salesman b where a.salesman_id = b.salesman_id;
select * from citymatch;

create  view norders as select name, avg(purch_amt), sum(purch_amt) from salesman, orders where salesman.salesman_id = orders.salesman_id
group by name;
select * from norders;

create view highgrade as select * from customer where grade=(select max(grade) from customer);
select * from highgrade;

CREATE VIEW incentive AS SELECT DISTINCT salesman_id, name FROM salesman a WHERE 3 <=(SELECT count(*) 
    FROM salesman b WHERE a.salesman_id = b.salesman_id);
    select * from incentive;