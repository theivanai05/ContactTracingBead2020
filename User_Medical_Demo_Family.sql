-- BEAD2020 Semester 3 Project - EBAC Part Time
-- Project Name : Automated Contact Tracing
-- Team Name : Team Hadley's 
-- Team Members :
/*--------------------------------------- 
-- Sankarrajan Paramasivam	 E0385029
-- Theivanai Shanmugam	         E0384999
-- Divya Rajendranath		 E0384922
--------------------------------------- */

/*---------The User Data for RDMS to SQOOP transfer into HDFS ----------- */

DROP DATABASE IF EXISTS Medic_Visits;
CREATE DATABASE IF NOT EXISTS Medic_Visits;
USE Medic_Visits;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS medic_visit,u_demo,u_relation;

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ', @@default_storage_engine) as INFO */;


CREATE TABLE u_demo (
UserID			VARCHAR(14)     NOT NULL,
Birth_Date  		DATE            NOT NULL,
First_Name  		VARCHAR(14)     NOT NULL,
Last_Name   		VARCHAR(16)     NOT NULL,
Gender      		ENUM ('M','F')  NOT NULL,
Home_Address 		VARCHAR(100)	NOT NULL,	
Home_Phone		VARCHAR(12)	NULL,
Office_Address		VARCHAR(100)	NULL,
Office_Phone		VARCHAR(12)	NULL,
SHN_Start_Date		DATE	        NOT NULL,
SHN_End_Date		DATE	        NOT NULL,
Infected_y_n		ENUM ('Y','N')  NOT NULL,
Infected_Since		DATE            NULL,
Cured_Since		DATE            NULL,
Reinfected_Since	DATE            NULL,
	PRIMARY KEY (UserID,Birth_Date)
);


CREATE TABLE medic_visit (  
UserID			VARCHAR(14)     NOT NULL,
UserCaseID		INT		NOT NULL, 
Test_Date		DATE            NOT NULL,
Test_Positive_Date 	DATE   		NOT NULL,	
Incu_Start_Date		DATE		NOT NULL,
First_Visit_Date	DATE		NOT NULL,
Medic_Log		VARCHAR(200)	NOT NULL,
User_Statement		VARCHAR(200)	    NULL,
	FOREIGN KEY (UserID) REFERENCES u_demo (UserID),	
	PRIMARY KEY (UserID,UserCaseID)
);


CREATE TABLE u_relation (
UserID		   	VARCHAR(14) 	NOT NULL,
Related_UserID		VARCHAR(14) 	NOT NULL,
Relationship_type	VARCHAR(20)	NOT NULL,
	FOREIGN KEY (UserID) REFERENCES u_demo (UserID),
	PRIMARY KEY (UserID,Related_UserID)
);

/*
--user2	user1	spouse
--user2	user4	parent-child*/

/* -- Not Required to be deleted later on 
CREATE OR REPLACE VIEW dept_emp_latest_date AS
    SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM dept_emp
    GROUP BY emp_no;

# shows only the current department for each employee
CREATE OR REPLACE VIEW current_dept_emp AS
    SELECT l.emp_no, dept_no, l.from_date, l.to_date
    FROM dept_emp d
        INNER JOIN dept_emp_latest_date l
        ON d.emp_no=l.emp_no AND d.from_date=l.from_date AND l.to_date = d.to_date;
*/

flush /*!50503 binary */ logs;

/* -- Not Required for now, to be deleted later on.
SELECT 'LOADING departments' as 'INFO';
source load_departments.dump ;
SELECT 'LOADING employees' as 'INFO';
source load_employees.dump ;
SELECT 'LOADING dept_emp' as 'INFO';
source load_dept_emp.dump ;
SELECT 'LOADING dept_manager' as 'INFO';
source load_dept_manager.dump ;
SELECT 'LOADING titles' as 'INFO';
source load_titles.dump ;
SELECT 'LOADING salaries' as 'INFO';
source load_salaries1.dump ;
source load_salaries2.dump ;
source load_salaries3.dump ;
source show_elapsed.sql ;
*/ 
