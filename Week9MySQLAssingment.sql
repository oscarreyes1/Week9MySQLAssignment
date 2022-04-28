create database if not exists user;
use user;

drop table if exists comment;
drop table if exists post;
drop table if exists user;

create table user(
user_id int not null auto_increment,
password varchar(50) not null, 
email varchar(50) not null, 
first_name varchar(50) not null,
last_name varchar(50) not null,
state char(2) not null,
city varchar(25),
zipcode char(5),
createDateTime timestamp default current_timestamp,
primary key (user_id)
);

create table post(
post_id int not null auto_increment,
user_id int not null, 
title varchar(25) null,
body text(250) not null,
createDateTime timestamp default current_timestamp,
editDateTime timestamp default current_timestamp,
deleteDateTime timestamp default current_timestamp,
primary key (post_id),
foreign key (user_id) references user(user_id)
);

create table comment(
comment_id int not null auto_increment,
user_id int not null,
post_id int not null,
body text(250) not null,
createDateTime timestamp default current_timestamp,
editDateTime timestamp default current_timestamp,
deleteDateTime timestamp default current_timestamp,
primary key (comment_id),
foreign key (user_id) references user(user_id),
foreign key (post_id) references post(post_id)
);
