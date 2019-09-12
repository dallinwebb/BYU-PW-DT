-- Personal Information Path1
with email as (
    select person_id, contact_number from person_contact 
    where contact_type_id = 5
),

cell_number as (
    select person_id, contact_number from person_contact 
    where contact_type_id = 1
),

home_phone as (
    select person_id, contact_number from person_contact 
    where contact_type_id = 2
)

select distinct s.PERSON_ID, s.FIRST_NAME, s.LAST_NAME, s.PREFERRED_NAME, e.CONTACT_NUMBER email, 
                s.gender, s.lds, s.membership_id, s.marriage_status, FLOOR(MONTHS_BETWEEN(sysdate, s.BIRTH_DATE)/12) AS age, 
                s.birth_date,cn.CONTACT_NUMBER phone1, hp.CONTACT_NUMBER phone2, PA.ADDRESS1, PA.ADDRESS2, PA.ADDRESS3, PA.ADDRESS4 
from STUDENT s
LEFT JOIN 
    email e ON (e.person_id = s.person_id)  -- 5: email
    LEFT JOIN 
    cell_number cn ON (cn.person_id = s.person_id)  -- 1: cell 
    LEFT JOIN 
    home_phone hp ON (hp.person_id = s.person_id) -- 2: home
LEFT JOIN PERSON_ADDRESS PA ON S.PERSON_ID = PA.PERSON_ID;
