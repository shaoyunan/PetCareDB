Create View AdoptionRequests AS
SELECT a.RequestID, CONCAT(b.FirstName, " ", b.LastName) AS RequestBy, d.TypeName, c.ID
FROM AdoptionRequest a
INNER JOIN PetOwner b ON b.PetOwnerID=a.RequestBy
INNER JOIN AdoptionList c ON a.AnimalID = c.ID
INNER JOIN AnimalType d ON d.typeID = c.animaltype