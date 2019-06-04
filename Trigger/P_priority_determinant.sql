DELIMITER $

CREATE PROCEDURE create_report(
 IN ReportBy_VAL INT,
 IN AnimalType_VAL INT,
 IN HealthCondition_VAL ENUM('Good', 'Fair', 'Critical', 'Unknown'),
 IN Location_VAL VARCHAR(255),
 IN SendTo_VAL INT,
 IN AreaCode_VAL INT,
 IN FoodCheck BOOL
 )
 
BEGIN

DECLARE p varchar(20);
SET p = 'Normal';
IF HealthCondition_VAL='Good' AND FoodCheck
	THEN SET p = 'Low';
END IF;
IF HealthCondition_VAL='Critical'
	THEN SET p = 'High';
END IF;
INSERT INTO HomelessReport (ReportBy, ReportDate, Priority, AnimalType, HealthCondition, Location, SendTo, AreaCode, IsFoodProvided)
VALUES (ReportBy_VAL, CURDATE(), p, AnimalType_VAL, HealthCondition_VAL, Location_VAL, SendTo_VAL, AreaCode_VAL, FoodCheck);
END $

DELIMITER ;