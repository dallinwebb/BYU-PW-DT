-- Course (not containing base_price & base_units. p2 script contains them)
select c.COURSE_ID, c.COURSE_NAME, c.COURSE_TITLE, c.CREDIT_HOURS, c.ACTIVE_FLG, 
       c.MAX_ENROLLMENT, c.MIN_ENROLLMENT, c.PROVIDER_ID, tt.term_type_id
from COURSE c
left join term_type tt on c.provider_id = tt.provider_id;
