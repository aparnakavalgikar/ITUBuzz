create table questions
(
question_id int not null primary key auto_increment,
question_text varchar(500),
log_user_id int
);

create table answers
(
answer_id bigint not null primary key,
answer_text varchar(500) not null,
immparent_id bigint not null,
question_id int not null,
log_user_id int not null
);

create table posts
(
post_id int not null primary key auto_increment,
post_text varchar(500) not null,
log_user_id int not null
);

create table replies
(
reply_id bigint not null primary key,
reply_text varchar(500) not null,
immparent_id bigint not null,
post_id int not null,
log_user_id int not null
);


CREATE TABLE userLogin (
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

