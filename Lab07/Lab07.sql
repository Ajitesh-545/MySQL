use Lab04;
#queries
#1
create view d_id100 as select * from employees where DEPARTMENT_ID=100;
select * from d_id100;
#2
create view empinfo as select employee_id, first_name , last_name , email , salary, department_id from employees;
select * from empinfo;

#3
select employee_id , salary from empinfo;

#4
update empinfo set first_name="AJITESH" where employee_id=181 ; 

select * from empinfo where  employee_id=181;

#5
select * from empinfo where department_id=100 and salary>7000;

#6
create view empcount as select DEPARTMENT_ID, count(*)  from employees group by department_id; 
select * from empcount;



#7
create view emplo as SELECT E.first_name,E.last_name, D.department_name, L.city, L.state_province FROM employees E JOIN departments D  ON E.department_id = D.department_id  
JOIN locations L ON D.location_id = L.location_id;

select * from emplo;

#8
select first_name, last_name from emplo where first_name like "%z%";
 
#9
select * from empcount;
 
 #10
 create view emptoronto as SELECT  first_name, last_name, employee_id, job_id  FROM employees  WHERE department_id = (SELECT department_id  FROM departments 
WHERE location_id = (SELECT location_id FROM locations  WHERE city ='Toronto'));
 
 select * from emptoronto;





