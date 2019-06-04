DELIMITER $
CREATE TRIGGER request_stage_trigger
AFTER UPDATE ON AdoptionRequest
FOR EACH ROW
BEGIN
	IF NEW.status<>OLD.status AND NEW.status = 'Approved' THEN
		INSERT INTO adoptionapproved(requestid, ApprovedDate) VALUES (NEW.RequestID, DATE(NOW()))
        ON DUPLICATE KEY UPDATE adoptionapproved.ApprovedDate = DATE(NOW());
	ELSE IF NEW.status<>OLD.status AND NEW.status = 'Rejected' THEN
		INSERT INTO adoptionrejected(requestid, RejectDate) VALUES (NEW.RequestID, DATE(NOW()))
        ON DUPLICATE KEY UPDATE adoptionapproved.RejectDate = DATE(NOW());
	END IF;
	END IF;
END$

DELIMITER ;