1 select * from Loan_Table where Branch_name = "Perryridge";
2 select * from Customer_Table where Customer_city = "Harrison";
3 select a.Customer_name, b.Amount from Borrower_Table a, Loan_Table b where a.Loan_number = b.Loan_number;
4 select distinct (Branch_name) from Loan_Table;
5 select Loan_number from Loan_Table where Amount > 1000;
6 NO QUESTION
7  select Loan_number from Loan_Table where Amount > 1400 and Amount < 2000;
8 select * from Borrower_Table;
9  select a.Loan_number, a.Customer_name, b.Amount from Borrower_Table a, Loan_Table b where a.Loan_number = b.Loan_number;
10 select Branch_name from Branch_Table where Asset > (select min(Asset) from Branch_Table where Branch_city = "Horseneck");
11  select Customer_name from Customer_Table where Customer_street like "%North%";
12 select a.Customer_name from Borrower_Table a, Loan_Table b where b.Branch_name = "Perryridge" and a.Loan_number = b.Loan_number; 
13 select Branch_name, avg(Balance) from Account_Table group by Branch_name;
14 select a.Branch_name, count(a.Branch_name) from Account_Table a, Depositor_Table b where a.Account_number = b.Account_number group by Branch_name;
15 select Loan_number from Loan_Table where Amount is NULL;
16 SELECT a.Customer_name from Borrower_Table a, Depositor_Table b where a.Customer_name = b.Customer_name;
17  select Borrower_Table.Customer_name from Borrower_Table, Loan_Table, Account_Table, Depositor_Table where Loan_Table.Loan_number = Borrower_Table.Loan_number and Depositor_Table.Account_number = Account_Table.Account_number and Loan_Table.Branch_name = "Perryridge" and  Account_Table.Branch_name = "Perryridge"
18. 




