SELECT 
     s.PERSON_ID
   , s.PREFERRED_NAME
   , s.FIRST_NAME
   , s.LAST_NAME
   , s.BIRTH_DATE
   , FLOOR(MONTHS_BETWEEN(SYSDATE, s.BIRTH_DATE) /12) AS Age
   , s.LDS
   , mo.NEED_MRN_FLG
   , s.GENDER
   , s.MARRIAGE_STATUS
   , s.COLLEGE_STUDENT
   , pe.ENGLISH_PROFICIENCY
   , pe.ENGLISH_LANGUAGE_SCORE
   , ps.NAME person_status
   , ps.DESCRIPTION 
   , pe.current_balance 
   , s.IMPORT_DATE
       
FROM 
    student s
    LEFT JOIN PERSON_EXTRA pe ON pe.PERSON_ID = s.PERSON_ID
    LEFT JOIN person_program pp ON pp.person_id = s.person_id
    LEFT JOIN manage_offer mo ON mo.person_program_id = pp.person_program_id
    LEFT JOIN PERSON_STATUS ps ON ps.PERSON_STATUS_ID = pe.PERSON_STATUS_ID;
