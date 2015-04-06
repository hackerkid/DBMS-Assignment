DECLARE 
radius number(6);
ans number(8, 4);


BEGIN
	radius := 3;
		WHILE ( 3 <= 7) LOOP
			ans := 3.14 * radius;
			INSERT INTO area VALUES(radius, ans);
			radius := radius + 1;
		END LOOP;
          
END;