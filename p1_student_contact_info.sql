-- Personal Information Path1
WITH email AS (
    SELECT person_id, contact_number 
    FROM person_contact 
    WHERE contact_type_id = 5
),

cell_number AS (
    SELECT person_id, contact_number 
    FROM person_contact 
    WHERE contact_type_id = 1
),

home_phone AS (
    SELECT person_id, contact_number 
    FROM person_contact 
    WHERE contact_type_id = 2
)

SELECT DISTINCT 
     s.PERSON_ID
   , e.CONTACT_NUMBER email
   , cn.CONTACT_NUMBER phone1
   , hp.CONTACT_NUMBER phone
   , pa.ADDRESS1
   , pa.ADDRESS2
   , pa.ADDRESS3
   , pa.ADDRESS4
   , pa.postal_code 
   , pa.country_id
   , s.do_not_contact
    
FROM 
    STUDENT s
    LEFT JOIN email e ON (e.person_id = s.person_id)  -- 5: email
    LEFT JOIN cell_number cn ON (cn.person_id = s.person_id)  -- 1: cell 
    LEFT JOIN home_phone hp ON (hp.person_id = s.person_id) -- 2: home
    LEFT JOIN PERSON_ADDRESS pa ON S.PERSON_ID = PA.PERSON_ID;
