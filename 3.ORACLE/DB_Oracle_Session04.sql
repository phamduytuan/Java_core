create table TTDoiBong(
    MaDoi char(10) not null primary key,
    TenDoi nvarchar2(50),
    TrangThai int)

create table TTThiDau(
    MaTranDau char(15) not null,
    MaDoi char(10) not null,
    SoBanThang int,
    SoBanThua int,
    SoDiem int,
    TrangThai int,
    primary key(MaTranDau,MaDoi))

--rang buoc
alter table TTThiDau add constraint FK_MaDoi foreign key(MaDoi) references TTDoiBong(MaDoi)
alter table TTThiDau add constraint CHK_SoBanThang check (SoBanThang>=0)
alter table TTThiDau add constraint CHK_SoBanThua check (SoBanThua>=0)
alter table TTThiDau add constraint CHK_SoDiem check (SoDiem>=0)
alter table TTDoiBong add constraint UX_TenDoi unique(TenDoi)

-- insert du lieu
insert into TTDoiBong values ('Doi1',N'Th? C�ng',1)
insert into TTDoiBong values ('Doi2',N'Kh�nh H�a',1)
insert into TTDoiBong values ('Doi3',N'Ho�ng Anh Gia Lai',1)
insert into TTDoiBong values ('Doi4',N'Xi M?ng H?i Ph�ng',1)

insert into TTThiDau(MaTranDau,MaDoi,SoBanThang,SoBanThua,TrangThai) values ('Tran1','Doi1',0,2,1)
insert into TTThiDau(MaTranDau,MaDoi,SoBanThang,SoBanThua,TrangThai) values ('Tran1','Doi2',2,0,1)
insert into TTThiDau(MaTranDau,MaDoi,SoBanThang,SoBanThua,TrangThai) values ('Tran2','Doi1',3,1,1)
insert into TTThiDau(MaTranDau,MaDoi,SoBanThang,SoBanThua,TrangThai) values ('Tran2','Doi3',1,3,1)
insert into TTThiDau(MaTranDau,MaDoi,SoBanThang,SoBanThua,TrangThai) values ('Tran3','Doi3',2,2,1)
insert into TTThiDau(MaTranDau,MaDoi,SoBanThang,SoBanThua,TrangThai) values ('Tran3','Doi2',2,2,1)

select * from TTDoiBong
select * from TTThiDau

--Truy v?n
--1.	T�nh c?t Sodiem cho m?i ??i d?a tr�n Sobanthang v� Sobanthua (??i th?ng ???c 3 ?i?m, ho� ???c 1 ?i?m v� thua kh�ng ???c ?i?m n�o)
update TTThiDau set SoDiem = case 
    when SoBanThang>SoBanThua then 3
    when SoBanThang<SoBanThua then 0
    when SoBanThang=SoBanThua then 1
end
/*
    case [expresion]        (<...> -> B�n trong b?t bu?c ph?i c�;  [...] => b�n trong c� c?ng ???c, kh�ng c� c?ng ???c)
    when value1 then return return1
    when value2 then return return2
    ..
    end case
*/
--2.	Hi?n th? th�ng tin thi ??u c?a c�c ??i b�ng, th�ng tin g?m: M� ??i, T�n ??i, M� tr?n ??u, S? b�n th?ng, S? b�n thua.
select db.MaDoi,db.TenDoi,td.MaTranDau,td.SoBanThang,td.SoBanThua 
from TTDoiBong db inner join TTThiDau td
on db.MaDoi=td.MaDoi

--3.	Hi?n th? th�ng tin c?a ??i ch?a thi ??u tr?n n�o, th�ng tin g?m: M� ??i, T�n ??i
select * from TTDoiBong where MaDoi not in (select distinct MaDoi from TTThiDau)

--4.	Hi?n th? s? tr?n th?ng c?a m?i ??i, th�ng tin g?m: M� ??i, T�n ??i, S? tr?n th?ng
select db.MaDoi,db.TenDoi, count(db.MaDoi) as SoTranThang
from TTDoiBong db inner join TTThiDau td on db.MaDoi=td.MaDoi
where td.SoDiem=3
group by db.MaDoi,db.TenDoi

--VIEW
--1.	Hi?n th? s? tr?n thua c?a m?i ??i, th�ng tin g?m: M� ??i, T�n ??i, S? tr?n thua
create or replace view View_Cau1
as
select db.MaDoi,db.TenDoi, count(db.MaDoi) as SoTranThua
from TTDoiBong db inner join TTThiDau td on db.MaDoi=td.MaDoi
where td.SoDiem=0
group by db.MaDoi,db.TenDoi

--ch?y th?
select * from View_Cau1

--2.	Hi?n th? th�ng tin t?ng s? tr?n, t?ng ?i?m, t?ng s? b�n th?ng, t?ng s? b�n thua c?a m?i ??i, th�ng tin g?m: 
--M� ??i, t�n ??i, t?ng s? tr?n, t?ng ?i?m, t?ng s? b�n th?ng, t?ng s? b�n thua.
create or replace view View_Cau2
as
select db.MaDoi,db.TenDoi, count(db.MaDoi) as TongSoTran, sum(td.SoDiem) as TongDiem, sum(td.SoBanThang) as TongSoBanThang, sum(td.SoBanThua) as TongSoBanThua
from TTDoiBong db inner join TTThiDau td
on db.MaDoi=td.MaDoi
group by db.MaDoi, db.TenDoi

--Store Procedure
--1.	Th? t?c th�m d? li?u cho b?ng TTDoiBong
create or replace procedure InsertDataForTTDoiBong
(P_MaDoi char, P_TenDoi nvarchar2,P_TrangThai int)
as
begin
    insert into TTDoiBong values (P_MaDoi,P_TenDoi,P_TrangThai);
end InsertDataForTTDoiBong;

--ch?y th?
execute InsertDataForTTDoiBong('Doi5',N'H� N?i T_T',1);

--2.	Th? t?c th�m d? li?u cho b?ng TTThiDau
create or replace procedure InsertTTThiDau(
    P_MaTranDau TTThiDau.MaTranDau%type,
    P_MaDoi TTThiDau.MaDoi%type,
    P_SoBanThang TTThiDau.SoBanThang%type,
    P_SoBanThua TTThiDau.SoBanThua%type,
    P_TrangThai TTThiDau.TrangThai%type)
as
begin
    insert into TTThiDau(MaTranDau,MaDoi,SoBanThang,SoBanThua,TrangThai) values (P_MaTranDau,P_MaDoi,P_SoBanThang,P_SoBanThua,P_TrangThai);
end InsertTTThiDau;


-- 3.	Th? t?c c?p nh?t d? li?u cho b?ng TTDoiBong theo MaDoi
create or replace procedure Update_TTDoiBongByMaDoi(
    P_MaDoi TTDoiBong.MaDoi%type,
    P_TenDoi TTDoiBong.TenDoi%type,
    P_TrangThai TTDoiBong.TrangThai%type)
as
begin
    update TTDoiBong set TenDoi=P_TenDoi, TrangThai=P_TrangThai where MaDoi=P_MaDoi;
end Update_TTDoiBongByMaDoi;

--ch?y th?
execute Update_TTDoiBongByMaDoi ('Doi5',N'The Visai NinhBinh',1)
select * from TTDoiBong

--5.	Th? t?c t�m ki?m th�ng tin ??i b�ng theo t�n ??i b�ng (t�m t??ng ??i)
create or replace procedure TimKiemDoiBong_TenDoi
(TTDoiBongDetail out SYS_REFCURSOR,
P_TenDoi TTDoiBong.TenDoi%type)
as
begin   
    set P_TenDoi = '%'+P_TenDoi+'%';
    open TTDoiBongDetail for
    select * from TTDoiBong where TenDoi like P_TenDoi;
end TimKiemDoiBong_TenDoi;

--Test
begin test
    variable mycursor refcursor;
    execute TimKiemDoiBong_TenDoi (N'Th? C�ng',:mycursor);
    print mycursor;
end test;


--7.	Th? t?c x�a TTDoiBong theo m� ??i b�ng (ch? c?p nh?t TrangThai = 0)
create or replace procedure Delete_TTDoiBong(
    P_MaDoi TTDoiBong.MaDoi%type)
as
begin
    update TTDoiBong set TrangThai=0 where MaDoi=P_MaDoi;
end Delete_TTDoiBong;

