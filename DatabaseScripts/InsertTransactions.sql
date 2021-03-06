

USE [Test]
GO
--TRUNCATE TABLE Financial.Transactions
--GO

SET IDENTITY_INSERT Financial.Transactions ON 
GO
INSERT [Financial].[Transactions] ([Id], [StudentId], [Date], [Description], [Reference], [Amount], [Qualifies1098], [Scholarship_Grant]) 
	VALUES ( 1, 1, CAST(N'2014-08-15T00:00:00.000' AS DateTime), N'Enrollment Fee', N'', 100.0000, 0, 0)
	,( 2, 1, CAST(N'2014-08-15T00:00:00.000' AS DateTime), N'ACH Payment', N'Student', -100.0000, 0, 0)
	,( 3, 1, CAST(N'2014-09-29T18:50:00.000' AS DateTime), N'Laptop Purchase-Serial # R39A3G0Z', N'Batch:9/19/2014', 2330.0000, 1, 0)
	,( 4, 1, CAST(N'2014-09-29T18:50:00.000' AS DateTime), N'Clicker', N'Batch:9/19/2014', 42.0000, 1, 0)
	,( 5, 1, CAST(N'2014-09-19T00:00:00.000' AS DateTime), N'Books', N'MBS', 488.3000, 1, 0)
	,( 6, 1, CAST(N'2014-10-01T00:00:00.000' AS DateTime), N'Undergrad Tuition', N'Auto - 100214', 7500.0000, 1, 0)
	,( 7, 1, CAST(N'2014-10-01T00:00:00.000' AS DateTime), N'Technology Fee', N'Auto - 100214', 350.0000, 1, 0)
	,( 8, 1, CAST(N'2014-10-01T00:00:00.000' AS DateTime), N'Facilities Fee', N'Auto - 100214', 150.0000, 1, 0)
	,( 9, 1, CAST(N'2014-10-01T12:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3153', -1250.0000, 1, 1)
	,(10, 1, CAST(N'2014-10-01T12:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3153', -1000.0000, 1, 1)
	,(11, 1, CAST(N'2014-10-01T12:00:00.000' AS DateTime), N'Neumont Utah Resident Scholarship 2014-15', N'UGSCH/FA 3153', -400.0000, 1, 1)
	,(12, 1, CAST(N'2014-10-06T00:00:00.000' AS DateTime), N'Federal Direct Unsubsidized 2014-15', N'3127/FA 3127', -1753.0000, 1, 0)
	,(13, 1, CAST(N'2014-10-06T00:00:00.000' AS DateTime), N'Federal Direct Subsidized 2014-15', N'3127/FA 3127', -1248.0000, 1, 0)
	,(14, 1, CAST(N'2014-10-06T00:00:00.000' AS DateTime), N'SEOG 2014-15', N'3125/FA 3125', -300.0000, 1, 0)
	,(15, 1, CAST(N'2014-10-08T00:00:00.000' AS DateTime), N'Payment on Account', N'ONLINE', -4909.3000, 1, 0)
	,(16, 1, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Books', N'MBS', 488.3000, 1, 0)
	,(17, 1, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Undergrad Tuition', N'Auto - 010915', 7500.0000, 1, 0)
	,(18, 1, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Technology Fee', N'Auto - 010915', 350.0000, 1, 0)
	,(19, 1, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Facilities Fee', N'Auto - 010915', 150.0000, 1, 0)
	,(23, 1, CAST(N'2015-05-15T00:00:00.000' AS DateTime), N'Federal Direct Unsubsidized 2014-15', N'3266/FA 3266', -1753.0000, 1, 0)
	,(24, 1, CAST(N'2015-05-15T00:00:00.000' AS DateTime), N'Federal Direct Subsidized 2014-15', N'3267/FA 3267', -1248.0000, 1, 0)
	,(25, 1, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'SEOG 2014-15', N'3125/FA 3125', -300.0000, 1, 0)
	,(20, 1, CAST(N'2015-05-29T00:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3313', -1250.0000, 1, 1)
	,(21, 1, CAST(N'2015-05-29T00:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3315', -1000.0000, 1, 1)
	,(22, 1, CAST(N'2015-05-29T00:00:00.000' AS DateTime), N'Neumont Utah Resident Scholarship 2014-15', N'UGSCH/FA 3153', -400.0000, 1, 1)
	,(26, 1, CAST(N'2015-06-01T00:00:00.000' AS DateTime), N'Payment on Account', N'ONLINE', -4909.3000, 1, 0)
GO


SET IDENTITY_INSERT [Financial].[Transactions] OFF
GO

INSERT [Financial].[Transactions] ([StudentId], [Date], [Description], [Reference], [Amount], [Qualifies1098], [Scholarship_Grant]) 
	VALUES (2, CAST(N'2014-08-15T00:00:00.000' AS DateTime), N'Enrollment Fee', N'', 100.0000, 0, 0)
	,(2, CAST(N'2014-08-15T00:00:00.000' AS DateTime), N'ACH Payment', N'Student', -100.0000, 0, 0)
	,(2, CAST(N'2014-09-29T18:50:00.000' AS DateTime), N'Laptop Purchase-Serial # R39A3G0Z', N'Batch:9/19/2014', 2330.0000, 1, 0)
	,(2, CAST(N'2014-09-29T18:50:00.000' AS DateTime), N'Clicker', N'Batch:9/19/2014', 42.0000, 1, 0)
	,(2, CAST(N'2014-09-19T00:00:00.000' AS DateTime), N'Books', N'MBS', 488.3000, 1, 0)
	,(2, CAST(N'2014-10-01T00:00:00.000' AS DateTime), N'Undergrad Tuition', N'Auto - 100214', 7500.0000, 1, 0)
	,(2, CAST(N'2014-10-01T00:00:00.000' AS DateTime), N'Technology Fee', N'Auto - 100214', 350.0000, 1, 0)
	,(2, CAST(N'2014-10-01T00:00:00.000' AS DateTime), N'Facilities Fee', N'Auto - 100214', 150.0000, 1, 0)
	,(2, CAST(N'2014-10-01T12:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3153', -1250.0000, 1, 1)
	,(2, CAST(N'2014-10-01T12:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3153', -1000.0000, 1, 1)
	,(2, CAST(N'2014-10-01T12:00:00.000' AS DateTime), N'Neumont Utah Resident Scholarship 2014-15', N'UGSCH/FA 3153', -400.0000, 1, 1)
	,(2, CAST(N'2014-10-06T00:00:00.000' AS DateTime), N'Federal Direct Unsubsidized 2014-15', N'3127/FA 3127', -1753.0000, 1, 0)
	,(2, CAST(N'2014-10-06T00:00:00.000' AS DateTime), N'Federal Direct Subsidized 2014-15', N'3127/FA 3127', -1248.0000, 1, 0)
	,(2, CAST(N'2014-10-06T00:00:00.000' AS DateTime), N'SEOG 2014-15', N'3125/FA 3125', -300.0000, 1, 0)
	,(2, CAST(N'2014-10-08T00:00:00.000' AS DateTime), N'Payment on Account', N'ONLINE', -4909.3000, 1, 0) 
	,(2, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Books', N'MBS', 488.3000, 1, 0)
	,(2, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Undergrad Tuition', N'Auto - 010915', 7500.0000, 1, 0)
	,(2, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Technology Fee', N'Auto - 010915', 350.0000, 1, 0)
	,(2, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'Facilities Fee', N'Auto - 010915', 150.0000, 1, 0)
	,(2, CAST(N'2015-05-15T00:00:00.000' AS DateTime), N'Federal Direct Unsubsidized 2014-15', N'3266/FA 3266', -1753.0000, 1, 0)
	,(2, CAST(N'2015-05-15T00:00:00.000' AS DateTime), N'Federal Direct Subsidized 2014-15', N'3267/FA 3267', -1248.0000, 1, 0)
	,(2, CAST(N'2015-05-01T00:00:00.000' AS DateTime), N'SEOG 2014-15', N'3125/FA 3125', -300.0000, 1, 0)
	,(2, CAST(N'2015-05-29T00:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3313', -1250.0000, 1, 1)
	,(2, CAST(N'2015-05-29T00:00:00.000' AS DateTime), N'Neumont Scholarship 2014-15', N'UGSCH/FA 3315', -1000.0000, 1, 1)
	,(2, CAST(N'2015-05-29T00:00:00.000' AS DateTime), N'Neumont Utah Resident Scholarship 2014-15', N'UGSCH/FA 3153', -400.0000, 1, 1)
	,(2, CAST(N'2015-06-01T00:00:00.000' AS DateTime), N'Payment on Account', N'ONLINE', -4909.3000, 1, 0)
GO	

