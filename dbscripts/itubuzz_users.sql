USE ITUBUZZ;
CREATE TABLE ITUBUZZ_USERS
(
user_id bigint primary key 
,first_name VARCHAR(50) NOT NULL
,last_name  VARCHAR(50) NOT NULL
,User_name  VARCHAR(50) NOT NULL
,Password   VARCHAR(100) NOT NULL
,email_id   VARCHAR(100) NOT NULL
,dob        DATETIME DEFAULT NULL
,department VARCHAR(50) NOT NULL
,semester  VARCHAR(20) NOT NULL
,gender     VARCHAR(6)
,role       VARCHAR(30) 
,Reg_Type   CHAR(1) 
) Auto_increment=1001;
