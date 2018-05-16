SELECT DISTINCT ROUTINE_NAME, ROUTINE_TYPE 
	FROM INFORMATION_SCHEMA.ROUTINES
	WHERE ROUTINE_DEFINITION LIKE '%Print_Methods%'
      AND ROUTINE_TYPE = 'PROCEDURE'