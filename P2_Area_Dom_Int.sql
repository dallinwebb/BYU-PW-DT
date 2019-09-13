-- git test
SELECT	Area_Unit_Number as AREA_UNIT_NUMBER
		,REPLACE(REPLACE(Area_Name, 'México', 'Mexico'), ' Area', '') as AREA_NAME
		,CASE
			WHEN ca.Area_Name LIKE '%Middle East%'          THEN 'ME/Africa N'
			WHEN ca.Area_Name LIKE '%Europe E%'             THEN 'Europe E'
			WHEN ca.Area_Name LIKE '%ica W%'                THEN 'NA W'
			WHEN ca.Area_Name LIKE '%North America Southw%' THEN 'NA SW'
			WHEN ca.Area_Name LIKE '%México%'               THEN 'Mexico'
			WHEN ca.Area_Name LIKE '%North America Southe%' THEN 'NA SE'
			WHEN ca.Area_Name LIKE '%South America S%'      THEN 'SA S'
			WHEN ca.Area_Name LIKE '%North America Northe%' THEN 'NA NE'
			WHEN ca.Area_Name LIKE '%North America C%'      THEN 'NA Central'
			WHEN ca.Area_Name LIKE '%Central A%'            THEN 'Cent America'
			WHEN ca.Area_Name LIKE '%Africa Southe%'        THEN 'Africa SE'
			WHEN ca.Area_Name LIKE '%Asia N%'               THEN 'Asia N'
			WHEN ca.Area_Name LIKE '%South America Northw%' THEN 'SA NW'
			ELSE REPLACE(ca.Area_Name, ' Area', '')
		END AS AREA_ABV
		,CASE
			WHEN area_name LIKE 'North America%' THEN 'Domestic'
			WHEN area_name = 'Utah Area' THEN 'Domestic'
			ELSE 'International'
		END DOM_INT
		
		FROM crm.CHURCH_AREAS ca