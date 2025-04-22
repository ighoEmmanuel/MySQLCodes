USE mdc_ch02;

-- A
select * from customer;
select * from invoice;
select * from invoice_item;

-- B 
select LastName, FirstName, Phone from customer;

-- C 
SELECT LastName, FirstName, Phone FROM CUSTOMER WHERE FirstName = 'Nikki';

-- D 
SELECT LastName, FirstName, Phone, DateIn, DateOut FROM customer,invoice WHERE TotalAmount > 100.00;

-- E 
select LastName, FirstName , Phone from customer where FirstName like "B__%";

-- f
SELECT LastName, FirstName , Phone from customer where LastName like "%cat%"; 

-- G
select LastName , FirstName, Phone from customer where Phone  like "%_23_%";

-- H
select min(TotalAmount), max(TotalAmount) from invoice;

-- I
select avg(TotalAmount) from invoice;

-- J
select count(CustomerID) from customer;

-- K
select LastName , FirstName from customer group by LastName,FirstName;

-- L
SELECT LastName, FirstName, COUNT(*) AS customer_count FROM customer GROUP BY LastName, FirstName;




