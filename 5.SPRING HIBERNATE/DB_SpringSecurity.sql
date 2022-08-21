CREATE TABLE role(
    id int GENERATED AS IDENTITY primary key,
    name varchar2(50) NULL
)


CREATE TABLE users(
    id int GENERATED AS IDENTITY primary key,
    username varchar2(45) NULL,
    password varchar2(200) NULL,
    fullname nvarchar2(50),
    gender int,
    birthday DATE,
    address nvarchar2(200),
    email varchar2(100),
    telephone varchar2(20),
    enabled int NULL
)

CREATE TABLE users_roles(
    id int GENERATED AS IDENTITY primary key,
    userId int,
    roleId int,
    constraint FK_userid foreign key(userId) references users(id),
    constraint FK_rollId foreign key(roleId) references role(id)
)

INSERT into role(name) VALUES (N'ROLE_ADMIN');

INSERT into role(name)  VALUES (N'ROLE_USER');

INSERT into users(username,password,fullname,gender,birthday,address,email,telephone,enabled) VALUES 
(N'admin', N'$2a$12$ikHI9wFvr62mHldjakUpruKu1mk4LHGCV03wd3c9B9mPlYnh0c9G2',N'Nguy?n Hoàng Anh',1,TO_DATE('21/12/2001','dd/MM/yyyy'),N'Ba Vì - Hà N?i','anh.nh@gmail.com','0123456789',1);

INSERT into users(username,password,fullname,gender,birthday,address,email,telephone,enabled) VALUES 
(N'user', N'$2a$12$ikHI9wFvr62mHldjakUpruKu1mk4LHGCV03wd3c9B9mPlYnh0c9G2',N'Ph?m V?n Quân',1,TO_DATE('21/12/2001','dd/MM/yyyy'),N'Ý Yên - Nam ??nh','quan.pv@gmail.com','0123456789',1);

INSERT into users_roles (userId, roleId) VALUES (1, 1);

INSERT into users_roles (userId, roleId) VALUES (1, 2);

INSERT into users_roles (userId, roleId) VALUES (2, 2);

select * from role;
select * from users;
select * from users_roles

select user0_.id as id1_1_, user0_.address as address2_1_, user0_.birthday as birthday3_1_, user0_.email as email4_1_, user0_.enabled as enabled5_1_, user0_.fullname as fullname6_1_, user0_.gender as gender7_1_, user0_.password as password8_1_, user0_.telephone as telephone9_1_, user0_.username as username10_1_ from users user0_ where user0_.username='user'

