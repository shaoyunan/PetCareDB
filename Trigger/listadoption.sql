DELIMITER $
CREATE TRIGGER list_adoption_trigger
AFTER UPDATE ON HomelessReport
FOR EACH ROW
BEGIN
	IF NEW.status<>OLD.status AND NEW.status = 'Finished' THEN
		INSERT INTO AdoptionList(AnimalType, `AddDate`, ReadyForAdoption) VALUES (NEW.AnimalType, DATE(NOW()), false);
	END IF;
END$
DELIMITER ;