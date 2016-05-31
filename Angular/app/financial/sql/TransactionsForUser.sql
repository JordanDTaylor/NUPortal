


SELECT StudentId, [Date], Description, Reference, Amount, Balance = SUM(Amount)
OVER (ORDER BY [Date], Id)
FROM Financial.Transactions
WHERE StudentId = 1

