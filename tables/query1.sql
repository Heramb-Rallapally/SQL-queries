create database db12;
use db12;

create table marks1(naav varchar(24) primary key,rno integer);
insert into marks1 values('heramb',19);
insert into marks1 values('srabhi',18);
insert into marks1 values('heramb',20);
insert into marks1 values('srabhi',31);
select * from marks1;
select naav from marks1
where naav='heramb';
select naav,sum(rno) from marks1 group by naav;

select naav,count(*) from marks1 where rno>=19 group by naav;


create table details(cid integer,naam varchar(25),marks integer);
insert into details values(1,'Heramb',5);
insert into details values(1,'Heramb',2);
insert into details values(1,'Heramb',1);
insert into details values(2,'srabhi',25);
insert into details values(2,'srabhi',30);
insert into details values(2,'srabhi',40);

insert into details values(3,'dasu',15);
insert into details values(3,'dasu',20);
insert into details values(3,'dasu',60);

select * from details;

select cid,naam,max(marks) from details
group by naam,cid having max(marks)>30;

select cid,naam,sum(marks) from details
group by naam,cid having sum(marks)>40 and max(marks)<30;

select cid,naam,sum(marks),avg(marks) from details
group by naam,cid having sum(marks)>=(3*(select avg(marks) from details));

create view temp1 as select cid,naam,avg(marks) as mar from details
group by naam,cid;
select * from temp1;

select * from temp1 where mar=(select min(mar) from temp1);

select cid,naam,max(marks) from details group by cid,naam;