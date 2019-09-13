SELECT 
    s.PERSON_ID
    ,s.MEMBERSHIP_ID
    ,s.LDS_ACCOUNT
    ,cv.CMIS_ID
    ,e.EMPLOYEE_ID

FROM   
    STUDENT s
    LEFT JOIN cmis_vw cv 
        ON cv.MFN = s.MEMBERSHIP_ID
    LEFT JOIN EMPLOYEE e 
        ON e.LDS_ACCOUNT_ID = s.LDS_ACCOUNT;

