SELECT
      [Employee_Name]
	  ,EmpID
	  ,[Sex] as Gender
	  ,[DOB]
,CASE 
        WHEN MarriedID = 0 THEN 'Single'
        WHEN MarriedID = 1 THEN 'Married'
END AS MarritalStatus
	  ,[State]
      ,[Zip]
      ,[CitizenDesc]
      ,[HispanicLatino]
      ,[RaceDesc]
	  ,[Salary]
	  ,[RecruitmentSource]

  FROM [HR].[dbo].[HR]
