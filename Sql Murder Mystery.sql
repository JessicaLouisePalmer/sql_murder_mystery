--Find Crime Scene Report

SELECT *
FROM crime_scene_report
WHERE city="SQL City" and type="murder" and date=20180115;


--- Find_Witness 1
SELECT *
FROM person
WHERE address_street_name= "Northwestern Dr" 
ORDER BY address_number DESC

--- Find_Witness 2
SELECT *
FROM person
WHERE address_street_name= "Franklin Ave" 
AND LOWER(name) LIKE "%annabel%";

--Find_Witness_Interviews
SELECT *
FROM interview
WHERE person_id =16371 or person_id=14887;



-Find_Killer

SELECT T1.id, T1.person_id, T1.name
FROM get_fit_now_member as T1
INNER JOIN get_fit_now_check_in as T2 ON T1.id=T2.membership_id
INNER JOIN person as T3 ON T1.person_id= T3.id
INNER JOIN drivers_license as T4 ON T3.license_id= T4.id
WHERE T1.id LIKE "48z%" and membership_status="gold" and check_in_date=20180109 and 
T4.plate_number LIKE "%H42W%";


--Find_Mastermind

SELECT *
FROM interview
WHERE person_id=67318;
		   
              
WITH CTE AS(
SELECT T1.*,COUNT(*) as Visits, T2.name
FROM facebook_event_checkin as T1
INNER JOIN person as T2 ON T1.person_id=T2.id
WHERE event_name="SQL Symphony Concert" and CAST(date AS TEXT) like "201712%"
GROUP BY person_id
HAVING Visits =3)
              
SELECT T2.*, T1.*
FROM drivers_license as T3
INNER JOIN person as T2 on T3.id = T2.license_id
INNER JOIN CTE as T1 on T1.person_id = T2.id
WHERE hair_color = 'red'
AND height IN (65,66,67)
AND car_make = 'Tesla'
AND car_model ='Model S' 
and gender = 'female';
