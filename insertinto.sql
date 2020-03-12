/*
-- Insert Statements to replicate Data copy from a RDBMS system. With the assumption that data can be brought into the system in the same format. 
-- There are thousand ways to do a get to an destination; looking at the best possible route, given the facts that these are user PDPA sensitive data, 
-- Any system might not be given JDBC connectivity, yet we will provide the option to run the same using JDBC as JDBC will be much more scalable then 

*/

SELECT 'Inserts into User_Demographics Table' as 'INFO';

INSERT INTO u_demo (UserID, Birth_Date, First_Name, Last_Name, Gender, Home_Address, Home_Phone, Office_Address, Office_Phone, SHN_Start_Date, SHN_End_Date, Infected_y_n, Infected_Since, Cured_Since ,Reinfected_Since) VALUES ('12345678','1963-01-28','Alpha','Doe', 'M', 'ABCD #  - ', 1234567, 'BCDF #  - ', 1234567, '2020-10-01', '2020-01-24', 'Y', '2020-01-14', '2020-02-28',''); 

INSERT INTO u_demo(UserID, Birth_Date, First_Name, Last_Name, Gender, Home_Address, Home_Phone, Office_Address, Office_Phone, SHN_Start_Date, SHN_End_Date, Infected_y_n, Infected_Since, Cured_Since ,Reinfected_Since) VALUES ('23456789','1972-03-02','Beta','Doe', 'F', 'ABCD #  - ', 1234567, '','', '2020-01-10', '2020-01-24', 'N','','',''); 



SELECT 'Inserts into Medic Visits Table' as 'INFO';

INSERT INTO medic_visit (UserID,UserCaseID, Test_Date, Test_Positive_Date, Incu_Start_Date, First_Visit_Date, Medic_Log, User_Statement) VALUES ('12345678',1,'2020-01-28','2020-01-28','2020-01-14','2020-01-28','Mild Fever with Couch, Had Visited Sentosa with Family.',''); 

INSERT INTO medic_visit (UserID,UserCaseID, Test_Date, Test_Positive_Date, Incu_Start_Date, First_Visit_Date, Medic_Log, User_Statement) VALUES ('23456789',2,'2020-01-28','2020-01-28','2020-01-14','2020-01-28','No Fever developened yet when visiting the doctor.',''); 



SELECT 'Inserts into User_Demographics Table' as 'INFO';

INSERT INTO u_relation  (UserID, Related_UserID, Relationship_type) 
VALUES ('12345678','23456789','Husband'); 


