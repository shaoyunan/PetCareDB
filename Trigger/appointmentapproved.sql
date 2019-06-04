DELIMITER $
CREATE TRIGGER appointment_approved_trigger
AFTER UPDATE ON clinicappointment
FOR EACH ROW
BEGIN
	IF NEW.status<>OLD.status AND NEW.status = 'Approved' THEN
		INSERT INTO appointmentapproved(appointmentid, ApprovedDate) VALUES (NEW.appointmentid, DATE(NOW()))
        ON DUPLICATE KEY UPDATE appointmentapproved.ApprovedDate = DATE(NOW());
	END IF;
END$
DELIMITER ;