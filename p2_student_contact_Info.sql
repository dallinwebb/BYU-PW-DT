with email as (
  select person_id, contact_number from PERSON_CONTACT
  where CONTACT_TYPE_ID = 5
),

cell_number as (
  select person_id, contact_number from PERSON_CONTACT
  where CONTACT_TYPE_ID = 1
),

home_phone as (
  select person_id, contact_number from PERSON_CONTACT
  where CONTACT_TYPE_ID = 2
)

select distinct s.PERSON_ID, s.FIRST_NAME, s.LAST_NAME, s.PREFERRED_NAME, 
                e.CONTACT_NUMBER email, s.GENDER, s.LDS,s.LDS_ACCOUNT, s.MEMBERSHIP_ID, s.MARRIAGE_STATUS, 
                FLOOR(DATEDIFF(mm, s.BIRTH_DATE, GETDATE()) /12) AS age, s.BIRTH_DATE,cn.CONTACT_NUMBER phone1, 
                hp.CONTACT_NUMBER phone2, PA.ADDRESS1, PA.ADDRESS2, PA.ADDRESS3, PA.ADDRESS4 
from STUDENT s
LEFT JOIN 
    email e ON (e.person_id = s.person_id)  -- 5: email
    LEFT JOIN 
    cell_number cn ON (cn.person_id = s.person_id)  -- 1: cell 
    LEFT JOIN 
    home_phone hp ON (hp.person_id = s.person_id) -- 2: home
LEFT JOIN PERSON_ADDRESS PA ON S.PERSON_ID = PA.PERSON_ID;