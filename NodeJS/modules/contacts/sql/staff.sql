SELECT PreferedName, FirstName, MiddleName, LastName, PhoneNumber, Email, RoomNumber, CampusName, BuildingName
FROM Contact.People
LEFT JOIN Contact.PhoneNumbers
ON People.PrimaryPhoneId = PhoneNumbers.Id
LEFT JOIN Contact.Emails
ON People.PrimaryEmailId = Emails.Id
LEFT JOIN Contact.Staff
ON People.Id = Staff.PersonId
LEFT JOIN Contact.Rooms
ON Staff.RoomId = Rooms.Id
LEFT JOIN Contact.Building
ON Rooms.BuildingId = Building.Id
LEFT JOIN Contact.Campus
ON Building.CampusId = Campus.Id
WHERE Staff.PersonId <> 0