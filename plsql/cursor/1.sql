# Question 1

DECLARE 
	id customer1.cid%type;
	name customer1.c_name%type;
	cursor c_customer is select cid, c_name from customer1;

BEGIN
	open c_customer;
	LOOP
		fetch c_customer into id, name;
		dbms_output.put_line(id || ' ' || name);
		exit when c_customer%notfound;
	END LOOP;
	close c_customer;
END;




