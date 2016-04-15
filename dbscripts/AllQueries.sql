<!--Reply sql -->


create table replies
(
reply_id bigint not null primary key,
reply_text longtext not null,
immparent_id bigint not null,
post_id int not null,
log_user_id int not null,
log_reply_name varchar(30) not null
);


<!--Question sql-->

create table questions
(
question_id int not null primary key auto_increment,
question_text longtext,
log_user_id int not null,

log_user_name varchar(30) not null
);


<!--Post sql-->

create table posts
(
post_id int not null primary key auto_increment,
post_text longtext not null,
log_user_id int not null,
log_user_name varchar(50) not null
);


<!--Answer sql-->

create table answers
(
answer_id bigint not null primary key,
answer_text longtext,
immparent_id bigint not null,
question_id int not null,
log_user_id int not null,
log_user_name varchar(30) not null
);

<!--edit profile sql-->

CREATE TABLE itubuzz.profile_images (

        imageid int NOT NULL AUTO_INCREMENT,

        image LONGBLOB,

        e_mail_id varchar(100) NOT NULL UNIQUE, 

        PRIMARY KEY (imageid));


<!--User login sql-->

CREATE TABLE itubuzz.userLogin (
  user_id bigint NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  first_name varchar(30) NOT NULL,
  middle_name varchar(30) DEFAULT NULL,
  last_name varchar(30) NOT NULL,
  password varchar(30) NOT NULL ,
  e_mail_id varchar(100) NOT NULL UNIQUE,
  date_of_birth date DEFAULT NULL,
  department varchar(30) NOT NULL,
  trimester varchar(20) NOT NULL,
  year_of_passing date DEFAULT NULL,
  user_type varchar(15) NOT NULL
 );


<!-- create group sql-->

CREATE TABLE itubuzz.user_group
(
	group_id bigint 
	,user_id bigint
);


<!--group details sql-->

CREATE TABLE itubuzz.groups
(
	group_id bigint primary key AUTO_INCREMENT
	,group_name VARCHAR(50) NOT NULL
);