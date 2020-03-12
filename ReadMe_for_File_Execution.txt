Query Set to execute the files: 



1) Execute the Tables and pipulate with the values withint Hadoop SQL first (Open Terminal from where the file has been persisted)
	
	a) $mysql -uroot -pcloudera
	
	b) source User_Medical_Demo_Family.sql
	
	c) source insertinto.sql



2) Import into HDFS via Sqoop ( Open a new Terminal ) 

	
	a) sqoop list-tables \--connect jdbc:mysql://localhost/Medic_Visits \--username root --password cloudera

	
	b) sudo -u hdfs sqoop import \--connect jdbc:mysql://localhost/Medic_Visits \--username root --password cloudera \--table u_demo \--target-dir /user/cloudera/act/demographic \--null-non-string '\\N'

	
	c) sudo -u hdfs sqoop import \--connect jdbc:mysql://localhost/Medic_Visits \--username root --password cloudera \--table medic_visit \--target-dir /user/cloudera/act/medicvisit \--null-non-string '\\N'

	
	d) sudo -u hdfs sqoop import \--connect jdbc:mysql://localhost/Medic_Visits \--username root --password cloudera \--table u_relation \--target-dir /user/cloudera/act/demographic \--null-non-string '\\N'

	
	e) if hadoop is in safe mode, try to get it out of it
	   
		$hadoop dfsadmin -safemode leave

	   
		[cloudera@quickstart ~]$ hadoop dfsadmin -safemode leave
	   
		DEPRECATED: Use of this script to execute hdfs command is deprecated.
	   
		Instead use the hdfs command for it.
	   safemode: Access denied for user cloudera. Superuser privilege is required




******************************************
*****Next Step of Actions**********
*******
******************************

************

1) Try running the execution in Lab Computers 

2) More Test Data to be inserted 

3) Write Code in Scala to use this data within Scala 






