

 SELECT
      g.GROUP_ID
     --,g.LOCATION_ID
     ,g.NAME GROUP_NAME
	 ,gpp.PROVIDER_PROGRAM_ID
 FROM
     group2 g
     LEFT JOIN GROUP2_PROVIDER_PROGRAM gpp ON g.GROUP_ID = gpp.GROUP_ID
     LEFT JOIN PROVIDER_PROGRAM pp ON gpp.PROVIDER_PROGRAM_ID = pp.PROVIDER_PROGRAM_ID
	  
 WHERE
     pp.PROVIDER_ID = 8387



	 --SELECT * FROM GROUP2_PROVIDER_PROGRAM

	 --SELECt * FROM PROVIDER_PROGRAM