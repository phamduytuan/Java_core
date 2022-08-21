create table Employees(
    EmpId int GENERATED AS IDENTITY primary key,
    EmpName nvarchar2(50),
    Gender NUMBER,
    Birthday DATE,
    Address nvarchar2(200),
    Company nvarchar2(100),
    Department nvarchar2(50),
    Position nvarchar2(50),
    Salary float)

insert into Employees (EmpName,Gender,Birthday,Address,Company,Department,Position,Salary) values (N'Nguy?n ??c Anh',1,To_Date('12/05/2002','dd/MM/yyyy'),N'Hai Bà Tr?ng - Hà N?i','FPT Software',N'Phát tri?n',N'Nhân viên l?p trình',12000000)
insert into Employees (EmpName,Gender,Birthday,Address,Company,Department,Position,Salary) values (N'Ph?m Thúy Mai',0,To_Date('30/10/2002','dd/MM/yyyy'),N'Sóc S?n - Hà N?i','USOL-V',N'Marketing',N'Nhân viên l?p trình',8000000)
