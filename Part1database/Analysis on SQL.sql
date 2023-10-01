SELECT name FROM sqlite_master WHERE type='table';

-- See all columns from databases
select * from customer;
select * from 	cust_loc;
select * from cust_services;
select * from cust_account;
select * from cust_churn;

-- Information about customers

select Gender, count(Gender) from customer group by Gender;

select Partner, count(Partner) from customer group by Partner;

select Dependents, count(Dependents) from customer group by Dependents;

-- Information about customer's account

select round(avg(Tenure), 2) from cust_account;
select round(avg(MonthlyCharges), 2) from cust_account;
select round(avg(TotalCharges), 2) from cust_account;

select count(*) from cust_account where TotalCharges > 	(Select avg(TotalCharges) 
																																							from cust_account);
																																							
select count(*) from cust_account where TotalCharges < 	(Select avg(TotalCharges) 
																																							from cust_account);																																						

select PaymentMethod, count(PaymentMethod) from cust_account group by PaymentMethod;
select Contract, count(Contract) from cust_account group by Contract;

-- Information about Churn

select Churn, count(Churn) from cust_churn group by Churn;

-- Total Charges grouped by churn

select cust_churn.Churn,  avg(cust_account.TotalCharges) 
from cust_churn
inner join cust_account on cust_account.CustomerID = cust_churn.CustomerID
group by cust_churn.Churn;

-- Monthly Charges grouped by churn

select cust_churn.Churn,  avg(cust_account.MonthlyCharges) 
from cust_churn
inner join cust_account on cust_account.CustomerID = cust_churn.CustomerID
group by cust_churn.Churn;

-- Gender grouped by Churn

select customer.Gender, cust_churn.Churn,  count(customer.Gender) 
from cust_churn
inner join customer on customer.CustomerID = cust_churn.CustomerID
group by cust_churn.Churn, customer.Gender;













