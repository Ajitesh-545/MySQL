use lab04;
select * from employees;
SELECT * from job_history;
#queries 
#1
SELECT * 
	FROM employees 
		WHERE employee_id NOT IN 
       (SELECT employee_id 
		FROM job_history);


#2
SELECT department_id, first_name || ' ' || last_name AS Employee_name, salary 
FROM employees a WHERE salary = (SELECT MAX(salary) FROM employees WHERE department_id = a.department_id);

#3
SELECT * FROM departments WHERE manager_id IN (SELECT employee_id 
FROM employees WHERE first_name='Susan');

#4
select first_name, last_name from employees where salary > 2100 limit 1;

#5
SELECT * 
	FROM jobs 
		WHERE job_id IN 
		(SELECT job_id 
			FROM employees 
				WHERE employee_id IN 
        (SELECT employee_id 
			FROM job_history 
				WHERE job_id='SA_REP'));

#6
SELECT first_name || ' ' || last_name AS Manager_name,department_id
	FROM employees 
		WHERE employee_id IN 
		(SELECT manager_id 
		FROM employees 
			GROUP BY manager_id 
			HAVING COUNT(*)>=4);
	
    #7
    SELECT * FROM departments 
	WHERE department_id IN 
		( SELECT department_id 
                   FROM employees 
			GROUP BY department_id 
				HAVING MIN(salary)>=8000);
                
                
                
#8
SELECT *
FROM departments
WHERE DEPARTMENT_ID IN
    (SELECT DEPARTMENT_ID
     FROM employees
     WHERE EMPLOYEE_ID IN
         (SELECT EMPLOYEE_ID
          FROM job_history
          GROUP BY EMPLOYEE_ID
          HAVING COUNT(EMPLOYEE_ID) > 1)
     GROUP BY DEPARTMENT_ID
     HAVING MAX(SALARY) > 7000);
     
	#9
SELECT city 
	FROM locations 
		WHERE location_id = 
    (SELECT location_id 
		FROM departments 
			WHERE department_id =
             	(SELECT department_id 
					FROM employees 
						WHERE employee_id=134));
                        
#10
SELECT first_name, last_name, salary, department_id 
  FROM employees
    WHERE department_id IN 
          (SELECT department_id 
            FROM departments 
             WHERE location_id = 
               (SELECT location_id 
                 FROM locations 
                   WHERE city = 'London'));
                   
#11
SELECT first_name, last_name, salary, department_id 
 FROM employees
  WHERE salary < ALL 
     (SELECT salary 
       FROM employees 
         WHERE first_name="Laura");
         
#12
SELECT first_name, last_name, salary, department_id 
 FROM employees
   WHERE salary >
      (SELECT min(salary) 
        FROM employees )
         AND department_id = 
               (SELECT department_id 
                 FROM employees 
                  WHERE DEPARTMENT_ID=70);
                

         
#13
SELECT first_name ||' '|| last_name AS Full_Name , hire_date 
 FROM employees 
  WHERE hire_date > (
                     SELECT hire_date 
                       FROM employees 
                        WHERE employee_id = 165);

                        
#14
SELECT first_name, last_name, salary, department_id 
 FROM employees
  WHERE salary > ALL 
     (SELECT salary 
       FROM employees 
         WHERE department_id = 40);
         
         
         
#15
SELECT first_name, last_name, department_id 
 FROM employees 
   WHERE department_id = 
       (SELECT department_id 
          FROM departments 
           WHERE department_name = 'Marketing');
	
    
#16
SELECT first_name, last_name, salary, department_id 
 FROM employees
  WHERE salary = (
                   SELECT salary 
                     FROM employees 
                       WHERE department_id = 40);
                       
                       
#17
SELECT first_name, last_name, salary, department_id 
 FROM employees 
  WHERE department_id = 
     (SELECT department_id 
       FROM employees 
        WHERE employee_id = 201);
        
        
#18
SELECT department_name, department_id
  FROM departments 
   WHERE location_id = 
        (
          SELECT location_id 
            FROM  departments  
             WHERE department_id = 30);
             
             
#19
SELECT first_name, last_name, salary, department_id 
 FROM employees
  WHERE salary =
     (SELECT salary
       FROM employees 
         WHERE department_id = 40);
         
#20
SELECT first_name, last_name , salary, department_id 
  FROM employees 
    WHERE salary > (
                SELECT AVG(salary)
                   FROM employees )
    ORDER BY salary DESC;
       
#21
SELECT department_id, department_name 
  FROM departments 
    WHERE location_id = 
            (
              SELECT location_id 
                FROM locations 
                  WHERE city = 'London'
            );         
       
#22
SELECT a.employee_id, a.first_name, a.last_name, a.salary, b.department_name, c.city  
FROM employees a, departments b, locations c  
WHERE a.salary =  
(SELECT MAX(salary) 
FROM employees 
WHERE hire_date BETWEEN '01/01/2002' AND '12/31/2003') 
AND a.department_id=b.department_id 
AND b.location_id=c.location_id;



#23
SELECT * 
FROM employees 
WHERE employee_id=ANY 
( SELECT manager_id FROM departments );

#############################

                  

