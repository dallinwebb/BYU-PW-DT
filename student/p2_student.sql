SELECT 
     s.PERSON_ID
   , s.PREFERRED_NAME
   , s.FIRST_NAME
   , s.LAST_NAME
   , s.BIRTH_DATE
   , DATEDIFF(YY, BIRTH_DATE, GETDATE()) -
        CASE
            WHEN DATEADD(YY, DATEDIFF(YY, BIRTH_DATE, GETDATE()), BIRTH_DATE) 
                    > GETDATE() THEN 1
            ELSE 0
        END age
   , s.LDS
   , pe.NEED_MRN_FLG
   , s.GENDER
   , s.MARRIAGE_STATUS
   , s.COLLEGE_STUDENT
   , pe.ENGLISH_PROFICIENCY
   , pe.ENGLISH_LANGUAGE_SCORE
   , ps.NAME PERSON_STATUS
   , ps.DESCRIPTION 
   , pe.CURRENT_BALANCE 
   , s.IMPORT_DATE

FROM 
    STUDENT s
    LEFT JOIN PERSON_EXTRA pe ON pe.PERSON_ID = s.PERSON_ID
    LEFT JOIN PERSON_STATUS ps ON ps.PERSON_STATUS_ID = pe.PERSON_STATUS_ID;
