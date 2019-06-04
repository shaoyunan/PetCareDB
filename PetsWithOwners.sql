Create View PetsWithOwners AS
SELECT a.PetID, a.PetName, b.TypeName, CONCAT(c.FirstName, " ", c.LastName) AS PetOwner
FROM Pet a
INNER JOIN AnimalType b ON a.AnimalTypeID=b.TypeID
INNER JOIN PetOwner c ON a.PetOwnerID = c.PetOwnerID