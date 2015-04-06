DECLARE
x number(8,0);
factorial number(10, 0) := 1;

BEGIN
	dbms_output.put_line('enter the number');
	x := :x;
	WHILE x > 0 LOOP
		factorial := factorial * x;
		x := x - 1;
	END LOOP;

	dbms_output.put_line(factorial);

END;

