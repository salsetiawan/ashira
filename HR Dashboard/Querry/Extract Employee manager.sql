SELECT 
      [EmpID],
	 
    CASE 
        WHEN positionID = 23 and empID = 10131 THEN '24' --wrong input for this spesific employee
        ELSE positionID
    END AS positionID,
	  
    CASE 
        WHEN managerID IS NULL THEN '39' -- Untuk Yang ID Webster belum di assign
        ELSE managerID
    END AS ManagerID

from dbo.HR
order by EmpID
