create database db4586;
begin;
\c db4586;
drop table if exists students;
drop table if exists interests;
create table if not exists students(
    st_id int,
    st_name varchar(15),
    st_last varchar(15)
);
create table if not exists interests(
    student_id int,
    interest varchar(15)
);
insert into students values(1, 'Walter', 'White');
insert into students values(2, 'Beth', 'Harmon');
insert into students values(3, 'Elliot', 'Alderson');
insert into interests values(1, 'Chemistry');
insert into interests values(1, 'Cooking');
insert into interests values(2, 'Chess');
insert into interests values(2, 'Travel');
insert into interests values(2, 'Reading');
insert into interests values(3, 'Computers');
insert into interests values(3, 'Hacking');
insert into interests values(3, 'Programming');
commit;
