CREATE DEFINER=`root`@`localhost` PROCEDURE `findSundays`(IN `start_date` DATE, IN `end_date` DATE)
    NO SQL
BEGIN

DECLARE flag smallint;
  DECLARE c    smallint;
  DECLARE firstsunday date;
  DECLARE thisdate date;
  DECLARE Sundays varchar(500);

CREATE TEMPORARY TABLE IF NOT EXISTS sundays_table(   
  `dt` date
) ENGINE=memory;
  
  
  SET flag := 1;
#  SET c    := 0;
  SET thisdate := start_date;
  SET Sundays := "";

  IF dayofweek(thisdate) <> 1 THEN

  WHILE flag > 0 DO
    SET thisdate := date_add(thisdate, interval 1 day);
    #select thisdate;
    IF dayofweek(thisdate) = 1 THEN
      SET flag := 0;
      SET firstsunday := thisdate;
    END IF;
#    SET c := c+1;
#    if c = 5 then set flag := 0; end if;
  END WHILE;

  ELSE
    SET firstsunday := thisdate;
  END IF;

#  select firstsunday;
  SET Sundays := firstsunday;
#  insert into sundays_table(dt) values (firstsunday);

  SET flag := 1;
  WHILE flag > 0 DO
    IF date_add(firstsunday, INTERVAL 7 day) <= end_date THEN
      SET Sundays := concat(Sundays, ", ", date_add(firstsunday, INTERVAL 7 day));
	  insert into sundays_table(dt) values (firstsunday);
      SET firstsunday := date_add(firstsunday, INTERVAL 7 day);
    ELSE
      SET flag := 0;
    END IF;
  END WHILE;

  select * from sundays_table;
  
  drop table sundays_table;

END