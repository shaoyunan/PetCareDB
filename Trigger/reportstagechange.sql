DELIMITER $
CREATE TRIGGER report_stage_trigger
AFTER UPDATE ON homelessreport
FOR EACH ROW
BEGIN
	IF NEW.status<>OLD.status AND NEW.status = 'Processing' THEN
		INSERT INTO ReportProcessing(ReportID, ProcessDate) VALUES (NEW.ReportID, DATE(NOW()))
        ON DUPLICATE KEY UPDATE ReportProcessing.ProcessDate = DATE(NOW());
	ELSE IF NEW.status<>OLD.status AND NEW.status = 'Finished' THEN
		INSERT INTO ReportFinished(ReportID, ProcessDate) VALUES (NEW.ReportID, DATE(NOW()))
        ON DUPLICATE KEY UPDATE ReportProcessing.ProcessDate = DATE(NOW());
	END IF;
	END IF;
END$

DELIMITER ;