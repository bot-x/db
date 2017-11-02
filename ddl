/*****************************************************************
PRACTICAL NO 02
Problem Statement :- Design and Develop SQL DDL statements which demonstrate the use of SQL objects such as Table, View, Index, Sequence, Synonym
Student Name :- 		Roll_No :- 
Class :- TE-B		BATCH :- TEB-	Date :-__/__/____
*******************************************************************/

1. DDL COMMANDS ON DATABASE OBJECT : TABLE
	1.1. Creating Table :-
	QUERY :	mysql> create database prac1;
	OUTPUT: Query OK, 1 row affected (0.08 sec)
	QUERY :	mysql> use prac1;
	OUTPUT: Database changed
	QUERY :	mysql> create table Employee(
		    -> Emp_no integer(3),
		    -> Emp_name varchar(20),
		    -> Joining_date date,
		    -> Salary integer(6)
		    -> );
	OUTPUT: Query OK, 0 rows affected (0.15 sec)
	QUERY :	mysql> create table newEmployee1 
		    -> as
		    -> select Emp_no,Emp_name from Employee;
	OUTPUT: Query OK, 0 rows affected (0.15 sec)
		Records: 0  Duplicates: 0  Warnings: 0

	1.2 Modifying Table :-
		1]Adding new column in table :
		QUERY :	mysql> alter table Employee 
		   	    -> add Department varchar(15);
		OUTPUT: Query OK, 0 rows affected (0.13 sec)
			Records: 0  Duplicates: 0  Warnings: 0

		2]Dropping column from table :
		QUERY : mysql> alter table Employee
		    	    -> drop
		    	    -> column Department ;
		OUTPUT: Query OK, 0 rows affected (0.06 sec)
			Records: 0  Duplicates: 0  Warnings: 0

		3]Modifying column of a table :
		QUERY : mysql> alter table Employee
		  	    -> modify column
		    	    -> Emp_no varchar(4);
		OUTPUT: Query OK, 0 rows affected (0.14 sec)
			Records: 0  Duplicates: 0  Warnings: 0

	1.3 Renaming Table :-
		QUERY : mysql> rename table Employee to EmpTable;
		OUTPUT: Query OK, 0 rows affected (0.23 sec)

	1.4 Drop Table :-
		QUERY : mysql> show tables;
		OUTPUT:
			+-----------------+
			| Tables_in_prac1 |
			+-----------------+
			| EmpTable        |
			| newEmployee1    |
			+-----------------+
			2 rows in set (0.00 sec)

		QUERY : mysql> drop table newEmployee1;
		OUTPUT: Query OK, 0 rows affected (0.06 sec)

		QUERY : mysql> show tables;
		OUTPUT:
			+-----------------+
			| Tables_in_prac1 |
			+-----------------+
			| EmpTable        |
			+-----------------+
			1 row in set (0.00 sec)

2. DDL COMMANDS ON DATABASE OBJECT : VIEW
	QUERY :mysql> create table Student (
	   	   -> roll_no integer(3),
	    	   -> stud_name varchar(20),
	           -> DOB date,
	    	   -> marks integer(3)
	  	   -> );
	OUTPUT:Query OK, 0 rows affected (0.07 sec)

	QUERY : mysql> insert into Student values(101,'Rohit','2000-12-02',90),(102,'Salman','1999-08-07',45);
	OUTPUT: Query OK, 2 rows affected (0.05 sec)
		Records: 2  Duplicates: 0  Warnings: 0
	QUERY : mysql> insert into Student values(103,'Mangesh','1999-02-02',80),(104,'Alpesh','1998-06-04',65),(105,'Pramod','1999-11-08',67);
	OUTPUT: Query OK, 3 rows affected (0.05 sec)

	QUERY : mysql> select *from Student;
	OUTPUT:
	+---------+-----------+------------+-------+
	| roll_no | stud_name | DOB        | marks |
	+---------+-----------+------------+-------+
	|     101 | Rohit     | 2000-12-02 |    90 |
	|     102 | Salman    | 1999-08-07 |    45 |
	|     103 | Mangesh   | 1999-02-02 |    80 |
	|     104 | Alpesh    | 1998-06-04 |    65 |
	|     105 | Pramod    | 1999-11-08 |    67 |
	+---------+-----------+------------+-------+
	5 rows in set (0.00 sec)

	2.1. Creating View :-
		QUERY : mysql> create view stud_view
		    	    -> as select *from Student;
		OUTPUT: Query OK, 0 rows affected (0.00 sec)

		QUERY : mysql> select *from stud_view;
		OUTPUT:
		+---------+-----------+------------+-------+
		| roll_no | stud_name | DOB        | marks |
		+---------+-----------+------------+-------+
		|     101 | Rohit     | 2000-12-02 |    90 |
		|     102 | Salman    | 1999-08-07 |    45 |
		|     103 | Mangesh   | 1999-02-02 |    80 |
		|     104 | Alpesh    | 1998-06-04 |    65 |
		|     105 | Pramod    | 1999-11-08 |    67 |
		+---------+-----------+------------+-------+
		5 rows in set (0.04 sec)
		QUERY : mysql> create view stud_view1 as select roll_no,stud_name from Student;
		OUTPUT: Query OK, 0 rows affected (0.02 sec)

		QUERY : mysql> select *from stud_view1;
		OUTPUT:
			+---------+-----------+
			| roll_no | stud_name |
			+---------+-----------+
			|     101 | Rohit     |
			|     102 | Salman    |
			|     103 | Mangesh   |
			|     104 | Alpesh    |
			|     105 | Pramod    |
			+---------+-----------+
			5 rows in set (0.00 sec)

		QUERY : mysql> create view stud_view2 as select *from Student where marks>80;
		OUTPUT: Query OK, 0 rows affected (0.04 sec)

		QUERY : mysql> select *from stud_view2;
		OUTPUT:
		+---------+-----------+------------+-------+
		| roll_no | stud_name | DOB        | marks |
		+---------+-----------+------------+-------+
		|     101 | Rohit     | 2000-12-02 |    90 |
		+---------+-----------+------------+-------+
		1 row in set (0.03 sec)

	2.2 Updating View :-
		QUERY : mysql> update stud_view1  set stud_name='Mangeshashree' where roll_no=103;
		OUTPUT: Query OK, 1 row affected (0.05 sec)
			Rows matched: 1  Changed: 1  Warnings: 0

		QUERY : mysql> select *from stud_view1;
		OUTPUT:
			+---------+-----------+
			| roll_no | stud_name |
			+---------+-----------+
			|     101 | Rohit     |
			|     102 | Salman    |
			|     103 | Mangesh   |
			|     104 | Alpesh    |
			|     105 | Pramod    |
			+---------+-----------+
			5 rows in set (0.00 sec)

	2.3. Dropping view :-
		QUERY : mysql> show tables;
		OUTPUT:
			+-----------------+
			| Tables_in_prac1 |
			+-----------------+
			| EmpTable        |
			| Student         |
			| stud_view       |
			| stud_view1      |
			| stud_view2      |
			+-----------------+
			5 rows in set (0.00 sec)

		QUERY : mysql> drop view stud_view2;
		OUTPUT: Query OK, 0 rows affected (0.00 sec)

		QUERY : mysql> show tables;
		OUTPUT:
			+-----------------+
			| Tables_in_prac1 |
			+-----------------+
			| EmpTable        |
			| Student         |
			| stud_view       |
			| stud_view1      |
			+-----------------+
			4 rows in set (0.00 sec)

3. DDL COMMANDS ON DATABASE OBJECT : INDEX
	3.1 Creating index :-
	1]Single column index :
		QUERY : mysql> create index ind_stud on Student(stud_name);
		OUTPUT: Query OK, 0 rows affected (0.15 sec)
			Records: 0  Duplicates: 0  Warnings: 0

	2]Composite Index :
		QUERY : mysql> create index ind_stud1 on Student(stud_name,marks);
		OUTPUT: Query OK, 0 rows affected (0.04 sec)
			Records: 0  Duplicates: 0  Warnings: 0

	3]Unique index :
		QUERY : mysql> create unique index ind_stud2 on Student(stud_name);
		OUTPUT: Query OK, 0 rows affected (0.06 sec)
			Records: 0  Duplicates: 0  Warnings: 0

	3.2 Displaying Index :-
		QUERY : mysql> show index from Student;
		OUTPUT:
+---------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name  | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Student |          0 | ind_stud2 |            1 | stud_name   | A         |           5 |     NULL | NULL   | YES  | BTREE      |         |               |
| Student |          1 | ind_stud  |            1 | stud_name   | A         |           5 |     NULL | NULL   | YES  | BTREE      |         |               |
| Student |          1 | ind_stud1 |            1 | stud_name   | A         |           5 |     NULL | NULL   | YES  | BTREE      |         |               |
| Student |          1 | ind_stud1 |            2 | marks       | A         |           5 |     NULL | NULL   | YES  | BTREE      |         |               |
+---------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
4 rows in set (0.00 sec)

	3.3 Dropping Index :-
		QUERY : mysql> drop index ind_stud2 on Student;
		OUTPUT: Query OK, 0 rows affected (0.01 sec)
			Records: 0  Duplicates: 0  Warnings: 0

4. DDL COMMANDS ON DATABASE OBJECT : SEQUENCE
	Creating Sequence :
		QUERY :mysql> create table customer(
		  	   -> custno integer(3) auto_increment,
			   -> primary key(custno),
			   -> cust_name varchar(15),
			   -> address varchar(20)
			   -> );
		OUTPUT:Query OK, 0 rows affected (0.01 sec)

		QUERY :mysql> insert into customer values(101,'Rohit','Nashik');
		OUTPUT:Query OK, 1 row affected (0.04 sec)

		QUERY : mysql> insert into customer(cust_name,address) values('Gaurav','Surat'),('Shubham','Dhule');
		OUTPUT: Query OK, 2 rows affected (0.00 sec)
			Records: 2  Duplicates: 0  Warnings: 0

		QUERY : mysql> select *from customer;
		OUTPUT:
			+--------+-----------+---------+
			| custno | cust_name | address |
			+--------+-----------+---------+
			|    101 | Rohit     | Nashik  |
			|    102 | Gaurav    | Surat   |
			|    103 | Shubham   | Dhule   |
			+--------+-----------+---------+
			3 rows in set (0.00 sec)


