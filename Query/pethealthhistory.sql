SELECT b.RecordID, a.PetID, a.PetName, b.pulse, b.RecordDate FROM PET AS a
INNER JOIN pethealthhistory AS b ON a.petid = b.petid
WHERE PETOWNERID = 20
ORDER BY a.PetID, b.RecordDate;