/*
QUERY 1
List all the orders made on a particular date. 
*/
select customer.CFName, customer.CLName, ordercontains.CFitem, orders.OPrice, orders.OTip, employee.EFname
from orders
join customer on customer.CEMail = orders.OCEmail
join ordercontains on ordercontains.CORID = orders.ORID
join employee on orders.ODEID = employee.EID
where orders.ODate = '2022-05-09'
;

/*
QUERY 2
Add customer to the database. 
*/
insert into Customer values
('jacksparrow@pearl.com', 5, 'Captain', 'J', 'Sparrow', 'Cabin C, Black Pearl, SS', '2777777777', 'Smokey Joes Diner')
;

/*
QUERY 2.5
Display all customers.
*/
select *
from customer
;

/*
QUERY 3
Show dates on which orders were placed, and the number of orders on that date. 
*/
SELECT ODate, COUNT(*) AS Orders
FROM orders
GROUP BY ODate
;


/*
QUERY 4
Show an employee's schedule from monday to friday. 
*/
SELECT ESchedule
from employee
where EID = ''
;


