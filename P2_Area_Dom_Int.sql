
SELECT DISTINCT
	Area_Unit_Number area_unit_number 
  ,REPLACE(REPLACE(area_name, 'México', 'Mexico'), ' Area', '') as area_name
  ,CASE
    WHEN area_name LIKE '%Middle East%'          THEN 'ME/Africa N'
    WHEN area_name LIKE '%Europe E%'             THEN 'Europe E'
    WHEN area_name LIKE '%North America W%'      THEN 'NA W'
    WHEN area_name LIKE '%North America Southw%' THEN 'NA SW'
    WHEN area_name LIKE '%México%'               THEN 'Mexico'
    WHEN area_name LIKE '%North America Southe%' THEN 'NA SE'
    WHEN area_name LIKE '%South America S%'      THEN 'SA S'
    WHEN area_name LIKE '%North America Northe%' THEN 'NA NE'
    WHEN area_name LIKE '%North America C%'      THEN 'NA Central'
    WHEN area_name LIKE '%Central A%'            THEN 'Cent America'
    WHEN area_name LIKE '%Africa West'           THEN 'Africa W'
    WHEN area_name LIKE '%Africa Southe%'        THEN 'Africa SE'
    WHEN area_name LIKE '%Asia N%'               THEN 'Asia N'
    WHEN area_name LIKE '%South America Northw%' THEN 'SA NW'
    ELSE REPLACE(area_name, ' Area', '')
  END AS area_abv
  ,CASE
    WHEN area_name LIKE 'North America%' THEN 'Domestic'
    WHEN area_name = 'Utah Area' THEN 'Domestic'
    ELSE 'International'
  END dom_int
  ,CASE
      WHEN area_name LIKE 'North America%' THEN 1
      WHEN area_name = 'Utah Area' THEN 1
      ELSE 0
  END domestic
FROM crm.CHURCH_AREAS