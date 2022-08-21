create table Students(
    StudentId int GENERATED AS IDENTITY,
    Name nvarchar2(50),
    Age int,
    Gender int)

create table Books(
    BookId int GENERATED AS IDENTITY,
    Name nvarchar2(50),
    TotalPage int,
    Type nvarchar2(10),
    Quantity int)

create table Borrows(
    BorrowId int GENERATED AS IDENTITY,
    StudentId int,
    BookId int,
    BorrowDate date)

create table DropOuts(
        DrpID int GENERATED AS IDENTITY,
        StudentID int,
        DrpDate date)
    
/*Question 3*/
/*Ràng bu?c khóa chính cho các c?t StudentID, BookID, BorrowID và DrpID c?a 4 b?ngtrên*/
alter table Students add constraint PK_StudentId primary key(StudentId) 
alter table Books add constraint PK_BookId primary key(BookId) 
alter table Borrows add constraint PK_BorrowsId primary key(BorrowId) 
alter table DropOuts add constraint PK_DrpId primary key(DrpId) 

/*T?o ràng bu?c khóa ngo?i: b?ng Borrows tham chi?u ??n b?ng Students và b?ng Books*/
alter table Borrows add constraint FK_StudentId foreign key(StudentId) references Students(StudentId)
alter table Borrows add constraint FK_BookId foreign key(BookId) references Books(BookId)

/*Ràng bu?c ki?m tra tu?i c?a h?c viên ph?i l?n h?n 0 và nh? h?n 50*/
alter table Students add constraint CHK_Age check(Age between 0 and 50)

/*insert dl bang Students*/
insert into Students(Name,Age,Gender) values (N'Nguy?n Th? Huy?n',19,0)
insert into Students(Name,Age,Gender) values (N'Mai Thanh Minh',33,1)
insert into Students(Name,Age,Gender) values (N'?ào Thiên H?i',26,1)
insert into Students(Name,Age,Gender) values (N'Tr?nh Chân Trân',24,0)
insert into Students(Name,Age,Gender) values (N'Di?m Qu?nh',30,null)

select * from Students

/*insert dl bang Books*/
insert into Books(Name,TotalPage,Type,Quantity) values ('Word',50,'Normal',10)
insert into Books(Name,TotalPage,Type,Quantity) values ('Excel',60,'Normal',20)
insert into Books(Name,TotalPage,Type,Quantity) values ('DDSQL',71,'Thick',7)
insert into Books(Name,TotalPage,Type,Quantity) values ('LGC',42,'Thin',1)
insert into Books(Name,TotalPage,Type,Quantity) values ('HTML',71,'Thick',2)

/*Borrows*/
insert into Borrows(StudentID,BookID,BorrowDate) values (1,1,to_date('2012-7-29','yyyy-MM-dd'))
insert into Borrows(StudentID,BookID,BorrowDate) values (4,4,to_date('2012-6-27','yyyy-MM-dd'))

/*Question 4: Insert d? li?u vào b?ng Borrows theo m?u sau*/
insert into Borrows(StudentID,BookID,BorrowDate) values (4,3,to_date('2012-7-30','yyyy-MM-dd'))
insert into Borrows(StudentID,BookID,BorrowDate) values (2,5,to_date('2012-06-30','yyyy-MM-dd'))
insert into Borrows(StudentID,BookID,BorrowDate) values (4,1,to_date(sysdate,'yyyy-MM-dd'))
insert into Borrows(StudentID,BookID,BorrowDate) values (4,1,to_date(sysdate,'yyyy-MM-dd'))

select * from Borrows

/*Question 5: Th?c hi?n các truy v?n sau*/
/*Hi?n th? danh sách Books có TotalPage l?n h?n 50, danh sách này s?p x?p theo th? t? t?ng d?n
c?a TotalPage và Name.*/
select * from Books where TotalPage>50 order by TotalPage desc

/*Hi?n th? danh sách tên h?c viên và tên sách ?ã m??n t??ng ?ng*/
select s.Name as StudentName,b.Name as BookName, br.BorrowDate from Students s 
inner join Borrows br on s.StudentId=br.StudentId inner join Books b on br.BookId = b.BookId

/*- Hi?n th? danh sách tên t?t c? h?c viên và t?ng s? sách ?ã m??n*/
select s.Name, count(s.StudentId) as TotalBookBorrowed from Students s inner join Borrows br on s.StudentId=br.StudentId
group by s.StudentId,s.Name

/*- Hi?n th? tên h?c viên mà gi?i tính là Null*/
select Name,Gender from Students where Gender is null

/* cú pháp: select ... from ... where ... group by ... order by ... */
/* select nh?ng c?t nào, t? nh?ng b?ng nào, theo ?i?u ki?n nào, nhóm l?i theo nh?ng c?t nào, s?p x?p theo c?t nào */
/* toán t? LIKE :  _ ??i di?n cho 1 kí t? b?t k?, % ??i di?n cho 1 chu?i b?t k?*/
select * from Students where Name like N'%Thanh%'
select * from Students where Age in (24,26)
select * from Students where age between 19 and 26
select count(*) as TotalStudent from Students
select * from Books;
select sum(Quantity) as TotalBook from Books

/*- Hi?n th? tên c?a sách ???c m??n nhi?u nh?t và t?ng s? l??ng ?ã m??n c?a cu?n ?ó.*/
select * from Borrows

select b.Name, count(b.BookId) as TotalBorrows from Books b inner join Borrows br
on b.BookId = br.BookId
group by b.BookId,b.Name
having count(b.BookId) = (select count(BookId) as TotalBorrowed from Borrows
group by BookId order by TotalBorrowed desc FETCH FIRST 1 ROWS ONLY) 




select count(BookId) as TotalBorrowed from Borrows
group by BookId order by TotalBorrowed desc FETCH FIRST 1 ROWS ONLY





