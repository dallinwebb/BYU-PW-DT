USE PATHWAY20;

WITH phone AS (
SELECT 
EMPLOYEE_ID, CONTACT_TEXT as PHONE 
FROM EMPLOYEE_CONTACT
WHERE CONTACT_TYPE_ID = 2
),
-----------------------------------------
/* ^^ Provides employee phone numbers */
-----------------------------------------
email AS (
SELECT 
EMPLOYEE_ID, CONTACT_TEXT as EMAIL 
FROM EMPLOYEE_CONTACT
WHERE CONTACT_TYPE_ID = 5
),
-----------------------------------------
/* ^^ Provides employee emails */
-----------------------------------------
er AS (
SELECT er.EMPLOYEE_ID, er.ROLE_ID, er.ACTIVE_FLG, r.ROLE_NAME, 
ROW_NUMBER() OVER(PARTITION BY er.employee_id ORDER BY er.created_date DESC) AS [Row]
FROM EMPLOYEE_ROLE er
LEFT JOIN ROLE r ON r.ROLE_ID = er.ROLE_ID 
)
-----------------------------------------
/* ^^ Selects most recent role */
-----------------------------------------
SELECT 
	   e.EMPLOYEE_ID
	  ,e.FIRST_NAME
	  ,e.LAST_NAME
	  ,CAST(e.BIRTHDATE as date) as BIRTHDATE
	  ,DATEDIFF(YEAR,e.BIRTHDATE,GETDATE()) as AGE
	  ,e.SEX
	  ,p.PHONE
	  ,em.EMAIL
	  ,CAST(e.SERVICE_START_DATE as date) as SERVICE_START_DATE
	  ,CAST(e.SERVICE_END_DATE	 as date) as SERVICE_END_DATE
	  ,er.ROLE_NAME
	  	
FROM EMPLOYEE e
LEFT JOIN phone p ON p.EMPLOYEE_ID = e.EMPLOYEE_ID
LEFT JOIN email em ON em.EMPLOYEE_ID = e.EMPLOYEE_ID
LEFT JOIN er ON er.EMPLOYEE_ID = e.EMPLOYEE_ID

WHERE er.[Row] = 1
	--AND e.EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM GROUP2_EMPLOYEE)
 -------------------------------------------------------------------------
 /* ^^ This is your main query. Row = 1 helps select the most recent role 
 and if you enable the employee_ID IN statement it will make sure you only 
 have missionary employee data.*/
 -------------------------------------------------------------------------