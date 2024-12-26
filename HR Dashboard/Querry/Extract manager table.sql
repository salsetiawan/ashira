WITH EmployeeFullName AS (
    -- Subquery untuk memproses fullname
    SELECT 
        LTRIM(RTRIM(SUBSTRING(Employee_Name, CHARINDEX(', ', Employee_Name) + 2, LEN(Employee_Name)))) 
        + ' ' +
        LTRIM(RTRIM(SUBSTRING(Employee_Name, 1, CHARINDEX(', ', Employee_Name) - 1))) AS fullname,
        EmpID,
		Position,
        Employee_Name
    FROM dbo.HR
    WHERE CHARINDEX(', ', Employee_Name) > 0  -- Pastikan hanya memproses nama yang memiliki koma
)
SELECT 

	CASE 
        WHEN managerID IS NULL THEN '39' -- Untuk Yang ID Webster belum di assign
        ELSE managerID
    END AS ManagerID,

    MAX(CASE 
        WHEN m.ManagerName = e.fullname THEN e.empID  
		when m.ManagerName = 'Simon Roup' then 10198 -- Case manual, Perbedaan penulisan nama
		when m.ManagerName = 'Brandon R. LeBlanc' then 10134
		when m.ManagerName = 'Board of Directors' then 10000
        ELSE NULL 
    END) AS EmployeeID,  -- Menggunakan MAX untuk agregasi nilai tunggal

    m.ManagerName,

    MAX(CASE 
        WHEN m.ManagerName = e.fullname THEN e.Position  -- Cocokkan fullname dengan ManagerName
		when m.ManagerName = 'Simon Roup' then 'IT Manager - DB' -- Case manual, Perbedaan penulisan nama
		when m.ManagerName = 'Brandon R. LeBlanc' then 'Shared Services Manager'
		when m.ManagerName = 'Board of Directors' then 'Board of Directors'
        ELSE NULL 
    END) AS ManagerTitle  -- Menggunakan MAX untuk agregasi nilai tunggal
	--m.PositionID,
    --m.Position AS staff, 
    --COUNT(*) AS freq  
FROM dbo.HR AS m
LEFT JOIN EmployeeFullName AS e ON m.ManagerName = e.fullname  
GROUP BY m.ManagerID, m.ManagerName --, m.Position, m.PositionID  
ORDER BY m.ManagerID, m.ManagerName
