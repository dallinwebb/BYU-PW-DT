with email as (
  select person_id, contact_number from PERSON_CONTACT
  where CONTACT_TYPE_ID = 5
),

email2 as (
  select person_id, contact_number from PERSON_CONTACT
  where CONTACT_TYPE_ID = 6
),

cell_number as (
  select person_id, contact_number from PERSON_CONTACT
  where CONTACT_TYPE_ID = 1
),

home_phone as (
  select person_id, contact_number from PERSON_CONTACT
  where CONTACT_TYPE_ID = 2
)

select distinct s.PERSON_ID, e.CONTACT_NUMBER email1, e2.CONTACT_NUMBER email2,cn.CONTACT_NUMBER phone1, 
                hp.CONTACT_NUMBER phone2, PA.ADDRESS1, PA.ADDRESS2, PA.ADDRESS3, PA.ADDRESS4, pa.POSTAL_CODE, pa.COUNTRY_ID, pa.LATITUDE, pa.LONGITUDE, s.DO_NOT_CONTACT
from STUDENT s
  LEFT JOIN 
    email e ON (e.person_id = s.person_id)  -- 5: email
  LEFT JOIN 
    email2 e2 ON (e.PERSON_ID = e2.PERSON_ID) -- 6: amail
  LEFT JOIN 
    cell_number cn ON (cn.person_id = s.person_id)  -- 1: cell 
  LEFT JOIN 
    home_phone hp ON (hp.person_id = s.person_id) -- 2: home
  LEFT JOIN PERSON_ADDRESS PA ON S.PERSON_ID = PA.PERSON_ID;

