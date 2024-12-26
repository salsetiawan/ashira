SELECT 
EmpStatusID,
EmploymentStatus,
TermReason,
count(*) as frequent

FROM dbo.HR
GROUP BY EmpStatusID, EmploymentStatus,TermReason
order by EmpStatusID desc