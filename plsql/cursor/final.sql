Que 1)
declare 
n number;
fac number;
temp number;
begin
n := &n;
temp := n;
fac := 1;
while (n > 0) 
loop
	fac := fac * n;
	n := n - 1;
end loop;
dbms_output.put_line('Factorial of ' || temp || ' is: ' || fac);
end;
/

Que 2)
declare 
n number;
a number := 0;
tmp number;
begin 
n := &n;
while (n > 0)
loop 
	tmp := n;
	a := a * 10 + MOD(tmp, 10);
	n := trunc(n / 10);
end loop;
dbms_output.put_line('Reverse of input number is ' || a);
end;
/

Que 3)
declare 
n number;
i number;
j number;
begin
	n := &n;
	FOR i in 1..n LOOP
		FOR j in 1..i LOOP
			dbms_output.put(i);			
        END LOOP;
		dbms_output.put_line(' ');
	END LOOP;
end;
/

Que 4)
create table Areas(radius number, area number);
declare
r number;
a number;
begin
FOR r in 3..7 LOOP
	a := 3.14 * r * r;
	insert into Areas values(r, a);
END LOOP;
end;
/	
SELECT * FROM Areas;

Que 5)
CREATE TABLE tableup(Account_num varchar(20), bal number);
declare
t number;
begin
insert into tableup values('A001', 14900);
update tableup set bal = bal - 1000 where Account_num = 'A001';
savepoint no_update;
UPDATE tableup SET bal = bal +140000 WHERE Account_num='A001';
SELECT SUM(bal)INTO t FROM tableup;
IF (t > 200000) THEN
ROLLBACK TO SAVEPOINT no_update;
END If;
COMMIT;
end;
/

Que 6)
create table account(account_num varchar2(20), bal number);
insert into account values('AN1',500);
	insert into account values('AN2',15000);
	insert into account values('AN3',105000);
	insert into account values('AN4',25000);
	insert into account values('AN5',45000);
	insert into account values('AN6',95000);
declare
	ac_num varchar2(20);
begin
	ac_num := '&ac_num';
	update account set bal = bal - 2000 where account_num = ac_num AND BAL >= 2500;
	IF SQL%notFOUND then
		dbms_output.put_line('Account Number not found');
	end if;
end;
/

Que 7)

create table employee(emp_num varchar2(20), sal number);
insert into employee values('E1',500);
	insert into employee values('E2',1500);
	insert into employee values('E3',10500);
	insert into employee values('E4',2500);
	insert into employee values('E5',4500);
	insert into employee values('E6',9500);
declare
	e_num varchar2(20);
begin
	e_num := '&e_num';
	update employee set sal = sal*1.15 where e_num = emp_num;
	IF SQL%notFOUND then
		dbms_output.put_line('Employee Number not found');
	end if;
end;
/
	
______________________________________________________________________________________________________________________________________________________________

															Part_B
Que 1)
create table customer1(cid varchar2(20), c_name varchar2(20));
insert into customer1 values('C1','A');
	insert into customer1 values('C2','B');
	insert into customer1 values('C3','C');
	insert into customer1 values('C4','D');
	insert into customer1 values('C5','E');
	insert into customer1 values('C6','F');
declare
	c_id customer1.cid%type;
	name customer1.c_name%type;
	cursor c_customer is select cid, c_name from customer1;
begin
	open c_customer;
	LOOP
		fetch c_customer into c_id, name;
		dbms_output.put_line(c_id || ' ' || name);
		exit when c_customer%notfound;
	END LOOP;
	close c_customer;
end;
/

Que2)
create table customer2(cid varchar2(20), c_name varchar2(20), assets number, branch_name varchar2(20));
insert into customer2 values('C1','A',500,'branch1');
	insert into customer2 values('C2','B',1000, 'branch2');
	insert into customer2 values('C3','C', 1500, 'branch3');
	insert into customer2 values('C4','D', 2500, 'branch4');
	insert into customer2 values('C5','E', 3500, 'branch5');
	insert into customer2 values('C6','F', 4500, 'branch6');
declare
	branch customer2.branch_name%type;
	asset customer2.assets%type;
	c number;
	cursor c_branch is select branch_name, assets from customer2 order by assets desc;
begin
	open c_branch;
	FOR c in 1..5 LOOP
		fetch c_branch into branch, asset; 
		dbms_output.put_line(branch);
	END LOOP;
	close c_branch;
end;

Que3) 
create table customer1(cid varchar2(20), c_name varchar2(20));
insert into customer1 values('C1','A');
insert into customer1 values('C2','B');
insert into customer1 values('C3','C');
insert into customer1 values('C4','D');
insert into customer1 values('C5','E');
insert into customer1 values('C6','F');
declare
	c_id customer1.cid%type;
	cursor c_customer is select cid from customer1;
	c number;
begin
	open c_customer;
	FOR c in 1..2 LOOP
		fetch c_customer into c_id;
		delete from customer1 where cid = c_id;
	END LOOP;
	close c_customer;
end;

Que4)
declare 
	customer varchar2(100);
begin 
	customer := '&customer';
	delete from customer1 where c_name = customer;
end;

Que5)
create table branch(cid varchar2(20), c_name varchar2(20), assets number, branch_name varchar2(20));
insert into branch values('C1','A',500,'branch1');
	insert into branch values('C2','B',1000, 'branch2');
	insert into branch values('C3','C', 1500, 'branch3');
	insert into branch values('C4','D', 2500, 'branch4');
	insert into branch values('C5','E', 3500, 'branch5');
	insert into branch values('C6','F', 46000, 'branch6');
declare 
cursor brancher is select c_name, assets from branch;
cnt number;
iter number;
cust branch.c_name%type;
asset branch.assets%type;
begin
	select count(*) into cnt from branch;
	open brancher;
	FOR iter in 1..cnt LOOP
		fetch brancher into cust, asset;
		IF asset > 45000 THEN
			dbms_output.put_line(cust || ' : rich');
		ELSE
			dbms_output.put_line(cust || ' : poor');
		END IF;
	END LOOP;
	close brancher;
end;

Que 7)
declare
	cursor acc is select account_num, bal from account;
	i number;
	c number;
	acad account.account_num%TYPE;
	balance number;
begin
	select count(*) into c from branch;
	open acc;
	FOR i in 1..c LOOP
		fetch acc into acad, balance;
		if balance > 45000 then
			dbms_output.put_line(balance);
		end if;
	end loop;
	close acc;
end;

Que 8)
create table deposit_raise (acc_no varchar2(100), sdate date, incr_amt number);
declare 
	cursor acc is select account_num, bal from account;
	acad account.account_num%TYPE;
	balance number;
	acad1 account.account_num%TYPE;
	prev_bal number;
begin 
	acad1 := '&acad1';
	prev_bal := 0;
	select bal into prev_bal from account where account_num = acad1;
	IF prev_bal <> 0 THEN
		prev_bal := prev_bal + 2000;
		update account set bal = prev_bal where account_num = acad1;
		insert into deposit_raise values (acad1, SYSDATE(), 2000);
	ELSE 
		dbms_output.put_line('Record not found.');
	END IF;
end;

Que 9)
declare 
	cursor acc is select account_num, bal from deposit where branch_name = 'Round Hill';
	acad account.account_num%TYPE;
	balance number;
	prev_bal number;
	cnt number;
	i number;
begin 
	select count(*) into cnt from deposit where branch_name = 'Round Hill'
	FOR i in 1..cnt LOOP
		fetch acc into acad, balance;
		prev_bal := (balance * 5) / 100;
		balance := prev_bal;
		update deposit set bal = balance where account_num = acad;
	END LOOP;
	close acc;
	dbms_output.put_line('The number of accounts affected are: ' || cnt);
end; 

Que 10)
declare
	cursor acc is select account_num, bal from account;
	acad account.account_num%TYPE;
	balance number;
	cnt number;
	i number;
	prev_bal number;
begin 
	select count(*) in cnt from account;
	FOR i in 1..cnt LOOP 
		fetch acc into acad, balance;
		if balance < 1000 THEN
			update account set bal = 2000 where account_num = acad;
	END LOOP;
	close acc;
end;