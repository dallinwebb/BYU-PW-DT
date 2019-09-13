-- Course (not containing base_price & base_units. p2 script contains them)
SELECT 
    c.COURSE_ID
  , c.COURSE_NAME
  , c.COURSE_TITLE 
  , c.CREDIT_HOURS
  , c.ACTIVE_FLG
  , c.MAX_ENROLLMENT 
  , c.MIN_ENROLLMENT 
  , c.PROVIDER_ID
  , tt.TERM_TYPE_ID
    
FROM 
    COURSE c
    LEFT JOIN TERM_TYPE tt 
        ON c.PROVIDER_ID = tt.PROVIDER_ID;
