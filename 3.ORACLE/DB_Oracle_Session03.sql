create table Classes(
    ClassId int GENERATED AS IDENTITY primary key,
    ClassName nvarchar2(100),
    Status INT)

create table Students(
    StuId int GENERATED as identity primary key,
    FullName nvarchar2(70),
    Gender int,
    Birthday date,
    Address nvarchar2(200),
    ClassId int,constraint FK_ClassId  foreign key(ClassId) references Classes(ClassId))

insert into Classes(ClassName,Status) values ('JW2203LM Bkap',1)
insert into Classes(ClassName,Status) values ('JW2204LM Bkap',1)
insert into Classes(ClassName,Status) values ('JW2205LM Bkap',1)
insert into Classes(ClassName,Status) values ('JW2206LM Bkap',1)
select * from Classes

insert into Students(FullName,Gender,Birthday,Address,ClassId) values (N'Nguy?n H?i Nam',1,to_date('21/12/2002','dd/MM/yyyy'),N'Gia Lâm - Hà N?i',1)
insert into Students(FullName,Gender,Birthday,Address,ClassId) values (N'Ph?m Lan Anh',0,to_date('11/05/2002','dd/MM/yyyy'),N'Sóc S?n - Hà N?i',2)
insert into Students(FullName,Gender,Birthday,Address,ClassId) values (N'Nguy?n Thanh Bình',1,to_date('29/10/2002','dd/MM/yyyy'),N'Ý Yên - Nam ??nh',1)

select * from Students

--T?o View:
create view select_students
as
select s.StuId,s.FullName,s.Gender,s.Birthday,s.Address,s.ClassId,c.ClassName from Students s inner join Classes c on s.ClassId = c.ClassId

select * from select_students

--View l?y d? li?u t? b?ng Students
create or replace view get_students
as
select s.StuId,s.FullName from students s

-- xóa view:
drop view get_students
select * from get_students

-- T?o th? t?c:
create or replace procedure Insert_Student
(P_FullName in students.FullName%type,
 P_Gender in students.Gender%type,
 P_Birthday in students.Birthday%type,
 P_Address in students.Address%type,
 P_ClassId in students.ClassId%type)
is
begin
    insert into Students(FullName,Gender,Birthday,Address,ClassId) values (P_FullName,P_Gender,P_Birthday,P_Address,P_ClassId);
end Insert_Student;

-- Th?c thi th? t?c:
execute Insert_Student (N'Ngô M?nh Tu?n',1,to_date('22/12/2002','dd/MM/yyyy'),N'Ph? Yên - Thái Nguyên',2)

-- Xóa th? t?c:
drop procedure Insert_Student


    
    