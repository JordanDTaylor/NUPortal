SELECT FirstName,MiddleName,LastName,PhoneNumber,Email,CampusName
FROM Contact.People
LEFT JOIN Contact.PhoneNumbers
ON People.PrimaryPhoneId = PhoneNumbers.Id
LEFT JOIN Contact.Emails
ON People.PrimaryEmailId = Emails.Id
LEFT JOIN Contact.Students
ON People.Id = Students.PersonId
LEFT JOIN Contact.EnrolledStudents
ON Students.PersonId = EnrolledStudents.StudentId
LEFT JOIN Contact.Campus
ON EnrolledStudents.EnrolledCampusId = Campus.Id
WHERE Students.PersonId <> 0