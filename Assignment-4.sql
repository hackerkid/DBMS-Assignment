1 select * from Loan_Table where Branch_name = "Perryridge";
2 select * from Customer_Table where Customer_city = "Harrison";
3 select Customer_name, Amount from Loan_Table INNER join Borrower_Table on Loan_Table.Loan_number = Borrower_Table.Loan_number ;
4 
