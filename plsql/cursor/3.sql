DECLARE
	id customer3.cid%type;
	cursor c_customer is SELECT cid from customer3;
	i int(4) := 0;
BEGIN
	open c_customer;
	
	WHILE(i < 2) LOOP
		fetch c_customer into id;
		dbms_output.put_line(id);
		DELETE from customer3 where cid = id;
		i = i + 1;
		EXIT when c_customer%notfound;
	END LOOP;

	close c_customer;
END;

