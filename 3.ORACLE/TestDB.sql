
create table Students(
    StuId int generated as identity, 
    FullName nvarchar2(70),
    Gender int,
    Birthday date,
    Address nvarchar2(200),
    ClassName nvarchar2(100))


insert into Students(Fullname,Gender,Birthday,Address,ClassName) values (N'Nguy?n ??c Bình',1,to_date('2002-12-21','yyyy-MM-dd'),N'Gia Lâm - Hà N?i','JW2203LM');
select * from Students order by ClassName desc;

TRUNCATE TABLE Students; 
/*drop table Students*/

create table Category(
    CateId char(10) not null primary key,
    CateName nvarchar2(100) not null unique)