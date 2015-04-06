DECLARE
x number(8, 0);
ans number(8, 0) := 0;

BEGIN
	x := :x;
	while ( x > 0) LOOP
		ans := ans * 10 + mod(x, 10);
		x := floor(x / 10);
	END LOOP;
	dbms_output.put_line(ans);

END;