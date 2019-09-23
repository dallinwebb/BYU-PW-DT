
SELECT ward.WARD_UNIT_NUMBER
	  ,ward.WARD_NAME
	  ,stake.STAKE_UNIT_NUMBER
	  ,stake.STAKE_NAME
	  ,area.AREA_UNIT_NUMBER
	  ,area.AREA_ABV
	  ,area.AREA_FULL

FROM (
			SELECT UNIT_NUMBER WARD_UNIT_NUMBER, UNIT_NAME AS WARD_NAME, PARENT_UNIT_NUMBER AS STAKE_UNIT_NUMBER , AREA_UNIT_NUMBER
			FROM CES_CHURCH_UNITS_MVW
			WHERE UNIT_TYPE_CODE = 7 
									) ward
LEFT JOIN (
			SELECT UNIT_NUMBER AS STAKE_UNIT_NUMBER, UNIT_NAME STAKE_NAME, AREA_UNIT_NUMBER
			FROM CES_CHURCH_UNITS_MVW
			WHERE UNIT_TYPE_CODE = 5
									) stake ON ward.STAKE_UNIT_NUMBER = stake.STAKE_UNIT_NUMBER
LEFT JOIN (
			SELECT DISTINCT 
 			  PARENT_UNIT_NAME AS [AREA_FULL]
			  ,parent_unit_number as AREA_UNIT_NUMBER 
 			  ,CASE
 				WHEN PARENT_UNIT_NAME LIKE '%Middle East%'          THEN 'ME/Africa N'
 				WHEN PARENT_UNIT_NAME LIKE '%Europe E%'             THEN 'Europe E'
 				WHEN PARENT_UNIT_NAME LIKE '%North America W%'      THEN 'NA W'
 				WHEN PARENT_UNIT_NAME LIKE '%North America Southw%' THEN 'NA SW'
 				WHEN PARENT_UNIT_NAME LIKE '%México%'               THEN 'Mexico'
 				WHEN PARENT_UNIT_NAME LIKE '%North America Southe%' THEN 'NA SE'
 				WHEN PARENT_UNIT_NAME LIKE '%South America S%'      THEN 'SA S'
 				WHEN PARENT_UNIT_NAME LIKE '%North America Northe%' THEN 'NA NE'
 				WHEN PARENT_UNIT_NAME LIKE '%North America C%'      THEN 'NA Central'
 				WHEN PARENT_UNIT_NAME LIKE '%Central A%'            THEN 'Cent America'
 				WHEN PARENT_UNIT_NAME LIKE '%Africa West'           THEN 'Africa W'
 				WHEN PARENT_UNIT_NAME LIKE '%Africa Southe%'        THEN 'Africa SE'
 				WHEN PARENT_UNIT_NAME LIKE '%Asia N%'               THEN 'Asia N'
 				WHEN PARENT_UNIT_NAME LIKE '%South America Northw%' THEN 'SA NW'

 				ELSE REPLACE(parent_unit_name, ' Area', '')
 			  END AS AREA_ABV
			FROM CES_CHURCH_UNITS_MVW
			WHERE parent_unit_name like '%Area'	
										) area ON area.AREA_UNIT_NUMBER = ward.AREA_UNIT_NUMBER

