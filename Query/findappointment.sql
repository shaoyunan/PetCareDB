SELECT a.AppointmentID, a.desireTime AS `Date`, 
CONCAT(c.address1,',',COALESCE(c.address2,'')) AS Clinic_Address, b.Message, 
CONCAT(d.FirstName, ' ',d.LastName) AS Doctor
FROM clinicappointment AS a 
INNER JOIN appointmentapproved AS b ON a.AppointmentID=b.AppointmentID
INNER JOIN clinic AS c ON a.SendTo = c.ClinicID 
INNER JOIN doctor AS d ON b.assigneddoctor = d.employeeid
where a.status = 'Approved' AND a.desiretime >= CURDATE() AND a.RequestBy = 157;