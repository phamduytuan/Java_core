create table Customers(
    CusId varchar2(10) not null primary key,
    CusName nvarchar2(70),
    Gender int,
    Birthday DATE,
    Address nvarchar2(200),
    Email varchar(100),
    Telephone varchar(20))

select * from Customers