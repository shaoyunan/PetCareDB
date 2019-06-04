DELIMITER $
CREATE TRIGGER auto_reject
AFTER UPDATE ON AdoptionRequest
FOR EACH ROW
BEGIN
	IF NEW.status<>OLD.status AND NEW.status = 'Approved' THEN
		UPDATE AdoptionRequest 
        SET `Status` = 'Rejected'
        WHERE AnimalID = OLD.AnimalID AND RequestBy<>OLD.RequestBy;
	END IF;
END$
DELIMITER ;