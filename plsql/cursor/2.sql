DECLARE 
	branch customer2.branch_name%type;
	assets customer2.assets%type;
	cursor x is SELECT branch_name, assets from customer2 ORDER BY assets DESC;
	tot number (4) := 0;

BEGIN
	open x;
	WHILE(tot < 5) LOOP
		fetch x INTO branch, assets;
		dbms_output.put_line(branch|| ' ' || assets);
		tot := tot + 1;
		exit when x%notfound;
	END LOOP;
	close x;
END;
