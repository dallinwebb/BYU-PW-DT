SELECT
	   GEOPOL_LOCATION_CODE
	  ,GEOPOL_COMMON_NAME [STATE]
FROM MDM.MDM_GEOPOL_LOCATION 
WHERE GEOPOL_TYPE_DESCR = 'State'