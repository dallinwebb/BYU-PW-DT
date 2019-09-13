
					--AREA BY AREA_UNIT_NUMBER

 WITH area AS (
				SELECT DISTINCT 
 				  parent_unit_number as AREA_UNIT_NUMBER, 
 				  CASE
 					WHEN PARENT_UNIT_NAME LIKE '%Salt%'                 THEN 'Utah SLC'
 					WHEN PARENT_UNIT_NAME LIKE '%Middle East%'          THEN 'ME/Africa N'
 					WHEN PARENT_UNIT_NAME LIKE '%Europe E%'             THEN 'Europe E'
 					WHEN PARENT_UNIT_NAME LIKE '%ica W%'                THEN 'NA W'
 					WHEN PARENT_UNIT_NAME LIKE '%North America Southw%' THEN 'NA SW'
 					WHEN PARENT_UNIT_NAME LIKE '%M�xico%'               THEN 'Mexico'
 					WHEN PARENT_UNIT_NAME LIKE '%North America Southe%' THEN 'NA SE'
 					WHEN PARENT_UNIT_NAME LIKE '%South America S%'      THEN 'SA S'
 					WHEN PARENT_UNIT_NAME LIKE '%Utah South%'           THEN 'Utah S'
 					WHEN PARENT_UNIT_NAME LIKE '%Utah North%'           THEN 'Utah N'
 					WHEN PARENT_UNIT_NAME LIKE '%North America Northe%' THEN 'NA NE'
 					WHEN PARENT_UNIT_NAME LIKE '%North America Northw%' THEN 'NA NW'
 					WHEN PARENT_UNIT_NAME LIKE '%North America C%'      THEN 'NA Central'
 					WHEN PARENT_UNIT_NAME LIKE '%Central A%'            THEN 'Cent America'
 					WHEN PARENT_UNIT_NAME LIKE '%Africa Southe%'        THEN 'Africa SE'
 					WHEN PARENT_UNIT_NAME LIKE '%Asia N%'               THEN 'Asia N'
 					WHEN PARENT_UNIT_NAME LIKE '%South America Northw%' THEN 'SA NW'
 					ELSE REPLACE(parent_unit_name, ' Area', '')
 				  END AS area_abv
				FROM CES_CHURCH_UNITS_MVW
				WHERE parent_unit_name like '%Area'
		 ),
 
				-- STAKE BY STAKE_UNIT_NUMBER AND AREA_UNIT_NUMBER
stake AS (
				SELECT UNIT_NUMBER AS STAKE_UNIT_NUMBER, UNIT_NAME STAKE, AREA_UNIT_NUMBER
				FROM CES_CHURCH_UNITS_MVW
				WHERE UNIT_TYPE_CODE = 5
		 ),
				-- WARD BY WARD_UNIT_NUMBER AND STAKE_UNIT_NUMBER
ward AS (
				SELECT UNIT_NUMBER WARD_UNIT_NUMBER, UNIT_NAME AS WARD, PARENT_UNIT_NUMBER AS STAKE_UNIT_NUMBER 
				FROM CES_CHURCH_UNITS_MVW
				WHERE UNIT_TYPE_CODE = 7 
		 )
				

SELECT * 
FROM ward w
LEFT JOIN stake s ON s.STAKE_UNIT_NUMBER = w.STAKE_UNIT_NUMBER
LEFT JOIN area a ON a.AREA_UNIT_NUMBER = s.AREA_UNIT_NUMBER