1 select * from Loan_Table where Branch_name = "Perryridge";
2 select * from Customer_Table where Customer_city = "Harrison";
3 select Customer_name, Amount from Loan_Table INNER join Borrower_Table on Loan_Table.Loan_number = Borrower_Table.Loan_number ;
4 select distinct(Branch_name) from Loan_Table;
5 SELECT Loan_number from Loan_Table where Branch_name = "Downtown" and Amount > 1000;
6 select Loan_number from Loan_Table where Amount between 34000 and 89000;
7 select * from Borrower_Table;
8 select Customer_name , Loan_Table.Loan_number , Amount from Loan_Table INNER JOIN  Borrower_Table ON Loan_Table.Loan_number = Borrower_Table.Loan_number ;
9 SELECT Branch_name FROM Branch_Table where Assets > (SELECT min(Assets) from Branch_Table where Branch_city  = "Horseneck");
10 SELECT * from Customer_Table where Customer_street like "%North%";
11 SELECT Customer_name from Borrower_Table INNER JOIN Loan_Table on Borrower_Table.Loan_number = Loan_Table.Loan_number where Branch_name = "Perryridge" order by (Customer_name );
12 select Branch_name, avg(Balance) from Account_Table group by Branch_name;
13 select Branch_name, count(Branch_name) from Account_Table group by Branch_name;
14 select * from Loan_Table where Amount is null;
15 select distinct(Borrower_Table.Customer_name) from Borrower_Table INNER JOIN Depositor_Table where Borrower_Table.Customer_name = Depositor_Table.Customer_name;
16 SELECT Customer_name from Borrower_Table where Loan_number in (select Loan_number from Borrower_Table 
	where Customer_name in (select Customer_name from Depositor_Table INNER JOIN Account_Table 
	on(Account_Table.Account_number = Depositor_Table.Account_number) and Account_Table.Branch_name = "Perryridge"));
17 




