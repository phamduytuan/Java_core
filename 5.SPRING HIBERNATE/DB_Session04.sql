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

insert into Employees (EmpName,Gender,Birthday,Address,Company,Department,Position,Salary) values (N'Nguy?n ??c Anh',1,To_Date('12/05/2002','dd/MM/yyyy'),N'Hai B� Tr?ng - H� N?i','FPT Software',N'Ph�t tri?n',N'Nh�n vi�n l?p tr�nh',12000000)
insert into Employees (EmpName,Gender,Birthday,Address,Company,Department,Position,Salary) values (N'Ph?m Th�y Mai',0,To_Date('30/10/2002','dd/MM/yyyy'),N'S�c S?n - H� N?i','USOL-V',N'Marketing',N'Nh�n vi�n l?p tr�nh',8000000)
