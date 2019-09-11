SELECT
	   e.EMPLOYEE_ID
	  ,e.FIRST_NAME
	  ,e.LAST_NAME
	  ,CAST(e.BIRTHDATE as date) as BIRTHDATE
	  ,DATEDIFF(YEAR,e.BIRTHDATE,GETDATE()) as AGE
	  ,e.SEX
	  ,ec1.PHONE
	  ,ec2.EMAIL
	  ,CAST(e.SERVICE_START_DATE as date) as SERVICE_START_DATE
	  ,CAST(e.SERVICE_END_DATE	 as date) as SERVICE_END_DATE
	  ,r.ROLE_NAME
	  
	  
	  

FROM EMPLOYEE e
LEFT JOIN (
				SELECT CONTACT_TEXT as PHONE, EMPLOYEE_ID FROM EMPLOYEE_CONTACT
				WHERE CONTACT_TYPE_ID = 2
												) ec1 ON e.EMPLOYEE_ID = ec1.EMPLOYEE_ID
LEFT JOIN (
				SELECT CONTACT_TEXT as EMAIL, EMPLOYEE_ID FROM EMPLOYEE_CONTACT
				WHERE CONTACT_TYPE_ID = 5
												) ec2 ON e.EMPLOYEE_ID = ec2.EMPLOYEE_ID
LEFT JOIN (
				SELECT EMPLOYEE_ID, ROLE_ID, ACTIVE_FLG, 
				ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY created_date DESC) AS [Row]
				FROM EMPLOYEE_ROLE 
												) er ON er.EMPLOYEE_ID = e.EMPLOYEE_ID
LEFT JOIN ROLE r ON r.ROLE_ID = er.ROLE_ID
LEFT JOIN EMPLOYEE_ADDRESS ea ON ea.EMPLOYEE_ID = e.EMPLOYEE_ID



WHERE er.Row = 1
 --AND e.EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM GROUP2_EMPLOYEE) 
	  --This gives you only the employees that are assigned to a group
	  

ORDER BY e.LAST_NAME



