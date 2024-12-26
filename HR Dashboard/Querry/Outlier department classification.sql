SELECT 
	DeptID,
	Department,
    positionID, 
    position,
    COUNT(*) AS position_count
FROM 
    dbo.HR
GROUP BY 
    DeptID, Department, positionID, position
order by
	PositionID
