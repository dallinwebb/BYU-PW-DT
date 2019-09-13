
SELECT DISTINCT
	   e.EMPLOYEE_ID
	  ,e.FIRST_NAME
	  ,e.LAST_NAME
	  ,er.AREA_UNIT_NUMBER
FROM 
	  EMPLOYEE e
	  LEFT JOIN EMPLOYEE_ROLE er ON e.EMPLOYEE_ID = er.EMPLOYEE_ID
	  LEFT JOIN LOCATION l ON l.AREA_UNIT_NUMBER = er.AREA_UNIT_NUMBER
WHERE
	   er.role_id = 13
	   AND er.ACTIVE_FLG = 1
	   AND l.ACTIVE_FLG = 1
	   AND er.PROVIDER_ID = 8387
				-- role_id = 13 == Area Manager found in role table
				-- 8387 == BYU-Pathway Worldwide

