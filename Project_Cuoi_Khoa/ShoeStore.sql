
CREATE DATABASE ShoeStore
USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'ShoeStore')
BEGIN
	ALTER DATABASE ShoeStore SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE ShoeStore SET ONLINE;
	DROP DATABASE ShoeStore;
END

GO

/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE ShoeStore
GO

/*******************************************************************************
   Create database objects
********************************************************************************/
USE ShoeStore
GO


--====================================== CREATE TABLES ===========================================|
--============================================================================================|

Create table Accounts
(	AccountId int IDENTITY (1, 1) NOT NULL,
	UserName nvarchar(100) unique NOT NULL,
	[PassWord] nvarchar(100) NOT NULL,
	[Role] nvarchar(30) NOT NULL,
	Email nvarchar(50),
	CreatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ModifiedAt datetime ,
	
	CONSTRAINT "PK_Accounts" PRIMARY KEY CLUSTERED 
	(
		AccountId
	)
)

Create table Customers
(	CustomerId int foreign key references Accounts(AccountId),
	CustomerName nvarchar(100) NOT NULL,
	[Address] ntext,
	PhoneNumber nvarchar(20),

	CONSTRAINT "PK_Customers" PRIMARY KEY CLUSTERED 
	(
		CustomerId
	)
)


Create table CustomerAddresses
(	CustomerAddressId int IDENTITY (1, 1) NOT NULL,
	CustomerId int foreign key references Customers(CustomerId),
	[Address] ntext NOT NULL,
	PhoneNumber nvarchar(20) NOT NULL,

	CONSTRAINT "PK_Addresses" PRIMARY KEY CLUSTERED 
	(
		CustomerAddressId
	)
)

Create table Employees
(	EmployeeId int foreign key references Accounts(AccountId),
	EmployeeName nvarchar(100) NOT NULL,
	[Address] ntext,
	PhoneNumber nvarchar(20),

	CONSTRAINT "PK_Employees" PRIMARY KEY CLUSTERED 
	(
		EmployeeId
	)
)

Create table Categories (
	CategoryId int IDENTITY (1, 1) NOT NULL,
	CategoryName nvarchar (50) NOT NULL,
	CategoryDescription ntext,
	CreatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ModifiedAt datetime ,

	CONSTRAINT "PK_Categories" PRIMARY KEY CLUSTERED 
	(
		CategoryId
	)
)
Create table SubCategories(
    SubCategoryId int IDENTITY (1, 1) NOT NULL,
	SubCategoryName nvarchar (50) NOT NULL,
	SubCategoryDescription ntext,
	CategoryId int foreign key references Categories(CategoryId),
	CreatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ModifiedAt datetime ,

	CONSTRAINT "PK_SubCategories" PRIMARY KEY CLUSTERED 
	(
		SubCategoryId
	)
)

Create table Brands (
	BrandId int IDENTITY (1, 1) NOT NULL ,
	BrandName nvarchar (50) NOT NULL ,
	BrandDescription ntext,
	CreatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ModifiedAt datetime,

	CONSTRAINT "PK_Brands" PRIMARY KEY CLUSTERED 
	(
		BrandId
	)
)

Create table Products
(	ProductId int IDENTITY (1, 1) NOT NULL,
	ProductName nvarchar(50) NOT NULL,
	SubCategoryID int foreign key references SubCategories(SubCategoryID),
	BrandID int foreign key references Brands(BrandID),
	[Description] ntext,
	ImportPrice money check (ImportPrice >= 0),
	UnitPrice money NOT NULL check (UnitPrice >= 0),
	Discount float check (Discount >= 0),
	CreatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ModifiedAt datetime,

	CONSTRAINT "PK_Products" PRIMARY KEY CLUSTERED 
	(
		ProductId
	)
)

Create table Images
(	ImageId int IDENTITY (1, 1) NOT NULL,
	ProductId int foreign key references Products(ProductId),
	Url ntext,

	CONSTRAINT "PK_Images" PRIMARY KEY CLUSTERED 
	(
		ImageId
	)
)

Create table ProductDetails
(	ProductDetailId int IDENTITY (1, 1) NOT NULL,
	ProductId int foreign key references Products(ProductId),
	Size nvarchar(10),
	Color nvarchar(40),
	QuantityInStock int check (QuantityInStock >= 0)

	CONSTRAINT "PK_ProductDetails" PRIMARY KEY CLUSTERED 
	(
		ProductDetailId
	)
)

Create table Carts
(	
	CartId int IDENTITY (1, 1) NOT NULL,
	AccountId int foreign key references Accounts(AccountId),
	CreatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ModifiedAt datetime,

	CONSTRAINT "PK_Carts" PRIMARY KEY CLUSTERED 
	(
		CartId
	)
)

Create table CartDetails
(	
	CartId int foreign key references Carts(CartId),
	ProductDetailId int foreign key references ProductDetails(ProductDetailId),
	QuantityInCart int check (QuantityInCart >= 0),

	CONSTRAINT "PK_CartDetails" PRIMARY KEY CLUSTERED 
	(
		CartId, ProductDetailId
	)
)

Create table ShippingCompanies
(	ShippingCompanyID int IDENTITY (1, 1) NOT NULL,
	CompanyName nvarchar(50) NOT NULL,
	[Description] ntext,

	CONSTRAINT "PK_ShippingCompanies" PRIMARY KEY CLUSTERED 
	(
		ShippingCompanyID
	)
)


Create table Orders
(	OrderId int IDENTITY (1, 1) NOT NULL,
	CustomerId int NOT NULL foreign key references Customers(CustomerId),	
	ShippingCompanyId int NOT NULL foreign key references ShippingCompanies(ShippingCompanyId),
	ShipAddressId int foreign key references CustomerAddresses(CustomerAddressId),
	OrderDate datetime NOT NULL,
	ShipDate datetime NOT NULL,
	TotalPrice float NOT NULL check(TotalPrice >= 0), 
	[Status] nvarchar(30),
	ModifiedAt datetime,
	CHECK (ShipDate >= OrderDate),

	CONSTRAINT "PK_Orders" PRIMARY KEY CLUSTERED 
	(
		OrderID
	)
)

Create table OrderDetails
(	OrderID int NOT NULL references Orders(OrderID),
	ProductDetailID int NOT NULL references ProductDetails(ProductDetailID), 
	Quantity int check (Quantity >= 0),
	Price money check (Price >= 0),
	Discount float check (Discount >= 0),

	CONSTRAINT "PK_OrderDetails" PRIMARY KEY 
	(
		OrderID, ProductDetailID
	) 
)

Create table Feedbacks(
	FeedbackId int IDENTITY (1, 1) NOT NULL,
	ProductId int references Products(ProductID) NOT NULL, 
	CustomerId int foreign key references Customers(CustomerId) NOT NULL,
	Rating int check(Rating >= 0 and Rating <= 5),
	Comment ntext,
	CreatedAt datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ModifiedAt datetime,

	CONSTRAINT "PK_Ratings" PRIMARY KEY CLUSTERED 
	(
		FeedbackId
	)
)

--- Insert Category
select * from Categories
INSERT INTO Categories(CategoryName,CategoryDescription) VALUES ('Men''s Shoes','')
INSERT INTO Categories(CategoryName,CategoryDescription) VALUES ('Woman''s Shoes','')
--- Insert Subcategory
select * from SubCategories
INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Sneakers','',1)
INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Scandal','',1)
INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Slippers','',1)
INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Boots','',1)

INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Sneakers','',2)
INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Scandal','',2)
INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Boots','',2)
INSERT INTO SubCategories(SubCategoryName,SubCategoryDescription,CategoryId) VALUES ('Slippers','',2)

UPDATE SubCategories
set SubCategoryName = 'Men''s Sneakers' where SubCategoryId = 1
UPDATE SubCategories
set SubCategoryName = 'Men''s Scandal' where SubCategoryId = 2
UPDATE SubCategories
set SubCategoryName = 'Men''s Slippers' where SubCategoryId = 3
UPDATE SubCategories
set SubCategoryName = 'Men''s Boots' where SubCategoryId = 4
UPDATE SubCategories
set SubCategoryName = 'Woman''s Sneakers' where SubCategoryId = 5
UPDATE SubCategories
set SubCategoryName = 'Woman''s Scandal' where SubCategoryId = 6
UPDATE SubCategories
set SubCategoryName = 'Woman''s Boots' where SubCategoryId = 7
UPDATE SubCategories
set SubCategoryName = 'Woman''s Slippers' where SubCategoryId = 8
-- Insert accounts
select * from Accounts
INSERT INTO Accounts( UserName, [PassWord], [Role], Email)
VALUES 
	( 'anhvd', 'vanhdang', 'ADMIN', 'anhvd@gmail.com'),
	('doanhpt', 'doanhht', 'EMPLOYEE', 'doanhpt@gmail.com'),
	('thanhfb88', 'dichoicungnyc88', 'EMPLOYEE', 'thanhfb@gmail.com'),
	('thanhpd', 'thanhbd1023', 'CUSTOMER', 'thanhpd@gmail.com'),
	('tuyenvudzvcl', 'dzvcl', 'CUSTOMER', 'tuyenvv@gmail.com'),
	('thoantk', '123456', 'CUSTOMER', 'thoantk@gmail.com'),
	('sangdq', 'sang2001', 'CUSTOMER', 'sangdq@gmail.com'),
	('nhidty', 'bundauhadilao', 'CUSTOMER', 'nguyetktb@gmail.com'),
	('anhth', 'anhmanhme', 'CUSTOMER', 'anhth@gmail.com'),
	('myntt', 'mimidayroi', 'CUSTOMER', 'myntt@gmail.com'),
	('nguyetktb', 'anhdoanh2k1', 'CUSTOMER', 'nguyetktb@gmail.com'),
	('thanhht', 'dichoicungnyc123', 'CUSTOMER', 'thanhht@gmail.com'),
	('huypq', 'huy113', 'CUSTOMER', 'huypq@gmail.com')

--- insert customer
select * from Customers
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (4,N'Phạm Đạt Thành',N'26 Lê Quý Đôn, Bồ Xuyên , Thái Bình','038-765954')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (5,N'Vũ Văn Tuyên',N'41 Thái Hà, Yên Lãng, Hà Nội','034-4074555')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (6,N'Nguyễn Thị Kim Thoa',N'34 Hoàng Hoa Thám, Ngô Quyền, Hải Phòng','036-4077455')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (7,N'Đoàn Quang Sang',N'Đồng Sơn, Nam Trực, Nam Định','035-4024558')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (8,N'Đỗ Thị Yến Nhi',N'Phần Lâm, Ân Thi, Hưng Yên','035-7924559')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (9,N'Trần Hồng Ánh',N'Thạch Hòa, Thạch Thất, Hà Nội','034-4324568')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (10,N'Nguyễn Thị Trà My',N'40 Bạch Mai, Hai Bà Trưng, Hà Nội','037-4354868')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (11,N'Kiều Thị Bích Nguyệt',N'37 Trần Duy Hưng, Cầu Giấy, Hà Nội','030-0076545')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (12,N'Hoàng Tiến Thành',N'38 Xuân Mai, Chương Mỹ, Hà Nội','034-4074555')
INSERT INTO Customers(CustomerId,CustomerName,Address,PhoneNumber) VALUES (13,N'Phạm Quang Huy',N'40 Nguyễn Văn Cừ, Long Biên, Hà Nội','036-605554')

--- insert customer address
select * from CustomerAddresses
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber) VALUES (4,N'37 Trần Duy Hưng, Cầu Giấy, Hà Nội','030-0076545')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (4,N'38 Xuân Mai, Chương Mỹ, Hà Nội','034-4074555')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (5,N'40 Nguyễn Văn Cừ, Long Biên, Hà Nội','036-605554')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (6,N'26 Lê Quý Đôn, Bồ Xuyên , Thái Bình','038-765954')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (5,N'41 Thái Hà, Yên Lãng, Hà Nội','034-4074555')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (6,N'34 Hoàng Hoa Thám, Ngô Quyền, Hải Phòng','036-4077455')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (7,N'Nam Trực, Nam Định','035-4024558')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (8,N'Phần Lâm, Ân Thi, Hưng Yên','035-7924559')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (9,N'Thạch Hòa, Thạch Thất, Hà Nội','034-4324568')
INSERT CustomerAddresses(CustomerId,Address,PhoneNumber)  VALUES (10,N'40 Bạch Mai, Hai Bà Trưng, Hà Nội','037-4354868')

--- insert employees
select * from Employees
INSERT "Employees" VALUES (2,N'Phùng Tiến Doanh',N'Đồng cỏ xanh, Lai Châu','039-434568')
INSERT "Employees" VALUES (3,N'Hoàng Tiến Thành 2',N'Quất Lâm, Nam Định','040-737568')

--- insert shipping
select * from ShippingCompanies
INSERT "ShippingCompanies" VALUES (N'Giao hàng nhanh',N'Giao hàng với thời gian ngắn nhưng giá thành cao')
INSERT "ShippingCompanies" VALUES (N'Giao hàng tiết kiệm',N'Giao hàng với thời gian trong khoảng 3-4 ngày nhưng giá thành thấp')
INSERT "ShippingCompanies" VALUES (N'Viettel Post',N'Chất lượng dịch vụ, giá thành rẻ, chăm sóc khác hàng tốt, nhiều ưu đãi')
INSERT "ShippingCompanies" VALUES (N'Viet Express',N'Khách hàng có thể nắm bắt được tổng thời gian và lịch trình của hàng hóa bưu kiện mà khách hàng gửi và biết được hết tất cả mọi thông tin về kiện hàng đó đã đi đến đâu với một cách nhanh nhất và chính xác nhất.')

--- insert brand
select * from Brands
Insert into Brands(BrandName,BrandDescription )
		values
		('Nike', ''),
		('Adidas',''),
		('Puma', ''),
		('Vans', ''),
		('Bitis', ''),
		('Ananas', ''),
		('Converse', ''),
		('Kappa', ''),
		('MLB', ''),
		('Dr.Martens', '')



------ insert products
--1--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Jordan Series Mid', 1 , 1 ,'Classic meets modern in this fresh take on a Jordan Brand essential. Durable leather and suede are bolstered by lightweight synthetics for extra support. The iconic midtop silhouette is more breathable than ever with a perforated sockliner. Plus, inspirational messages nodding to MJ origin story are incorporated into the design, adding meaning to every step.'
 ,2000000,2300000,5)
 --2--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('Nike Dunk Low SE', 1,  1,'Created for the hardwood but taken to the streets, our classic Dunk Low returns with crisp overlays and throwback Nike graphics. This basketball icon channels 90s vibes with a mix of tricot and jersey in the upper thats soft, relaxed and durable. Modern footwear technology helps bring the comfort into the 21st century'
           ,3000000,3300000,5 )
--3--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Nike Air Force 1 07', 1,1
           ,'The radiance lives on in the Nike Air Force 1 07, the b-ball OG that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.'
           ,2400000,2700000,5)

-- 4--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Nike Blazer Mid 77 Jumbo', 1,1
           ,'Praised by many for its enduring look and feel, the wardrobe staple hits refresh with the Nike Blazer Mid 77 Jumbo.Harnessing the old-school look you love, it now has an elastic heel with corduroy-like texture and large pull tabs for easy on and off.The oversized Swoosh design and jumbo laces add a fun twist.'
           ,3000000,3300000 ,5)

-- 5--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Nike Air Force 1 '' 07 LV8', 1,1
           ,'We just want to say, "HAVE A NIKE DAY". The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a friendly spin on what you know best: era-echoing, '' 80s construction, bold details and nothin '' -but-net style.'
           ,3000000,3300000 ,5)

-- 6--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Nike Air Max 97', 1,1
           ,'With an iconic design inspired by Japanese bullet trains and water droplets, push your style full speed ahead in the Air Max 97. Full-length Nike Air cushioning lets you ride in first-class comfort.'
           ,3000000,3300000 ,5)
-- 7--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Nike Air Force 1 '' 07', 5,1
           ,'Love is in the Air. The ''82 hoops original is back with sweet colours and tiny details, like "Nike Love" on the Swoosh logo and dubrae, that will have you swooning.'
           ,3000000,3300000 ,5)
-- 8--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('STAN SMITH SHOES', 5,2
           ,'Plants have been there for us through the best of times and the worst of times. They heal us, soothe us, and have recently proved to be excellent company. So in honour of Plant Appreciation Day, we celebrate our trusty, leafy friends with these adidas Stan Smith shoes. We keep the clean lines that the iconic silhouette is known for. Now they just get some extra life with botanical graphics springing up allover the upper.'
           ,3000000,3300000 ,5)
 -- 9--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('RETROPY F2 SHOES', 5,2
           ,'Life comes at you fast. But in the adidas Retropy F2 Shoes, you can look even faster. Inspired by '' 80s track styles, these trainers are the perfect balance of retro and modern. That means they look great with any outfit you can dream up. Plus, the cushioned, lightweight feel keeps you comfortable no matter how wild your day gets.'
           ,2000000,2500000 ,5)
 -- 10--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('RICH MNISI NMD_R1 SHOES', 5,2
           ,'Romance is a beautiful thing, and it''s blooming across your adidas NMD shoes. Pop-art roses from renowned South African designer Rich Mnisi stand out on the iconic silhouette in a vibrant celebration of love. And if that hasn''t already stolen your heart, the comfortable feel is sure to seal the deal. BOOST in the midsole makes every step feel good.'
           ,3000000,3300000 ,5)


 -- 11--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('RETROPY F2 SHOES', 1,2
           ,'You like to be one step ahead. Blending retro vibes with modern design, these adidas Retropy F2 Shoes are right there with you. Rooted in ''80s running style, they show off a layered material-mix upper. The sleek shape and thick EVA midsole make them ideal for today.'
           ,3000000,3300000 ,5)
 -- 12--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('ULTRABOOST 20 EXPLORER SHOES ', 1,2
           ,'Even with its innovative design and legendary technology, the vision behind Ultraboost is quite simple — comfort. Lace into these adidas running shoes and find it wherever the day takes you. Boost cushioning fuels every step with energy, and the water-repellent upper keeps you going in cool weather.'
           ,3000000,3300000 ,5)

 -- 13--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('UV DREAMS ERA', 1,4
           ,'The Vans Era, originally called the Vans #95, was brought to life in 1976 and made popular by the legendary Z-Boys of Santa Monica. It was the first shoe to include our famous padded collar, and today, it remains a favorite for creative people worldwide. Featuring sturdy canvas and suede uppers with printed sidewalls, the UV Dreams Era energizes our timeless low top silhouette with effortless style. In addition to the supportive collar, this classic lace-up shoe comes equipped with metal eyelets and signature rubber waffle outsoles. • Vans’ legendary low top, lace-up shoe • Sturdy canvas and suede uppers • Printed sidewalls • Supportive padded collars • Metal eyelets • Signature rubber waffle outsoles'
           ,3000000,3300000 ,5)
 -- 14--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('ELECTRIC FLAME OLD SKOOL', 1,4
           ,'First known as the Vans #36, the Old Skool debuted in 1977 with a unique new addition: a random doodle drawn by founder Paul Van Doren, and originally referred to as the “jazz stripe.” Today, the famous Vans Sidestripe has become the unmistakable—and instantly recognizable—hallmark of the Vans brand. Featuring durable suede and canvas uppers with a neon flame print, the Electric Flame Old Skool pays homage to our heritage while ensuring that this low top, lace-up shoe remains as iconic as ever. It also includes re-enforced toe caps, supportive padded collars, and signature rubber waffle outsoles. Vans’ iconic low top, sidestripe shoe Durable suede and canvas uppers Neon flame print Lace-up closure Re-enforced toe caps Supportive padded collars Signature rubber waffle outsoles'
           ,3000000,3300000 ,5)

 -- 15--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('SENTRY SK8-HI WC', 5,4
           ,'Sentry Sk8-Hi WC'
           ,3000000,3330000 ,5)
 -- 16--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('OTW GALLERY CLASSIC SLIP-ON', 5,4
           ,'Together As Ourselves. Vans’ mission is to inspire and enable creative expression, and that cannot happen without free expression for everyone. To celebrate Pride 2022, Vans empowered three artists in the LGBTQ+ community to create a collection of footwear and apparel that showcases their experiences, individuality, and vision for a more inclusive world. Born in a small town around Bologna’s countryside in Italy, Sara Lorusso grew up fascinated by nature and the creatures that populated it. This knack for observation developed into a passion for photography, and a particular interest in how we can rediscover ourselves beyond society’s norms. Spreading a message of inclusion over objectification, Sara’s OTW Gallery Classic Slip-On tweaks the familiar look of a lipstick print by juxtaposing the design with an important reminder at the sidewall: love can save us. '
           ,3000000,3300000 ,5)

 -- 17--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('MIX MATCH CAYUCAS SLIDE MEGA PLATFORM', 6,4
           ,''
           ,1000000,2300000 ,10)
 -- 18--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('COLFAX SANDAL', 6,4
           ,'A brand new addition to the Vans family, the Colfax Sandal takes design cues from the Colfax Boot to create a comfortable, on-trend sandal with adjustable hook-and-loop closures to ensure a secure fit. Built on a Colfax cupsole with additional height for a platform look, this tonal sandal also comes equipped with a cushioned EVA footbed featuring additional arch support for all-day wear. A classic Vans hang flag and heel scab bring iconic Vans DNA to this modern sandal. • Cushioned EVA footbed with added arch support • Features a Colfax cupsole • Additional height for platform look • Adjustable hook-and-loop closure to ensure a secure fit • Hang flag and heel scab to incorporate Vans DNA'
           ,1000000,1700000 ,5)
 -- 19--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('OUTDOOR SUEDE TRI-LOCK', 6,4
           ,'The Outdoor Suede Tri-Lock features premium suede straps with hook-and-loop adjustability, so you can find your perfect fit. Built on an UltraCush Lite footbed for all day comfort, this retro sandal also includes lateral synthetic leather overlays for protection and support, durable rubber outsoles with sawtooth tread, and water-based inks and glues. • Premium suede straps with hook-and-loop adjustability • Durable lateral synthetic leather overlays for protection and support • UltraCush Lite footbed for all-day comfort • Durable rubber outsoles with sawtooth tread • Made with water-based inks and glues'
           ,3000000,3300000 ,5)

 -- 20--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('CHECKERBOARD LA COSTA SLIDE-ON', 3,4
           ,'Slip into comfort with the Checkerboard La Costa Slide-On. Inspired by Vans’ classic vulcanized roots, this slide-on sandal features a synthetic nubuck strap with the iconic Vans checkerboard print and soft rubber and stretch textile linings. Our super-soft UltraCush footbed includes built in arch support, and the lightweight, flexible, and durable injected UltraCush Lite waffle outsoles are ready for all-day wear. It is made with water-based inks and glues.'
           ,800000,1300000 ,5)
 -- 21--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('CHECKERBOARD LA COSTA SLIDE-ON', 8,4
           ,'Slip into comfort with the Checkerboard La Costa Slide-On. Inspired by Vans’ classic vulcanized roots, this slide-on sandal features a synthetic nubuck strap with the iconic Vans checkerboard print and soft rubber and stretch textile linings. Our super-soft UltraCush footbed includes built in arch support, and the lightweight, flexible, and durable injected UltraCush Lite waffle outsoles are ready for all-day wear. It is made with water-based inks and glues.'
           ,800000,1300000 ,5)
 -- 22--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('VANS LA COSTA SLIDE-ON', 3,4
           ,'Slip into comfort with the Checkerboard La Costa Slide-On. Inspired by Vans’ classic vulcanized roots, this slide-on sandal features a synthetic nubuck strap with the iconic Vans checkerboard print and soft rubber and stretch textile linings. Our super-soft UltraCush footbed includes built in arch support, and the lightweight, flexible, and durable injected UltraCush Lite waffle outsoles are ready for all-day wear. It is made with water-based inks and glues.'
           ,800000,1300000 ,5)
 -- 23--
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('VANS LA COSTA SLIDE-ON', 8,4
           ,'Slip into comfort with the Checkerboard La Costa Slide-On. Inspired by Vans’ classic vulcanized roots, this slide-on sandal features a synthetic nubuck strap with the iconic Vans checkerboard print and soft rubber and stretch textile linings. Our super-soft UltraCush footbed includes built in arch support, and the lightweight, flexible, and durable injected UltraCush Lite waffle outsoles are ready for all-day wear. It is made with water-based inks and glues.'
           ,800000,1300000 ,5)
-- 24 --
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Sandal Eva Phun Biti''s Hunter REMH00100XNH',2,5
,'',
800000,1500000,5)

-- 25 --
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Sandal Eva Biti''s Hunter REWH00100DEN',6,5
,'',
800000,1500000,5)

-- 26 --
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Sandal Eva Biti''s Hunter REWH00100DEN',2,5
,'',
800000,1500000,5)

-- 27 --
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Converse Chuck 70 Hi Festival Golden Mind',1,7
,'',
1300000,2000000,5)

-- 28 --
INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Converse Chuck 70 Hi Festival Golden Mind',5,7,'',1300000,2000000,5)

INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Giannis Immortality Basketball', 1 , 1 ,'Get inspired by your favorite MVP, Giannis Antetokounmpo, in the Unisex Nike Giannis Immortality Basketball Shoe.'
 ,1600000,1900000,5)

 INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Air Max SC Sneaker', 1 , 1 ,'Get an old school look in the Mens Nike Air Max SC Sneaker.'
 ,2200000,24900000,3)

 INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Adilette Slide Sandal', 3 , 2 ,'Classic comfort looks cool in the adidas Adilette Slide Sandal.'
 ,1300000,1500000,4)

 INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Oneonta Outdoor Sandal', 2 , 1 ,'Tackle tough trails with the Mens Nike Oneonta Sandal.'
 ,1000000,1200000,1)

 INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Victori Mix-Match Slide Sandal', 3 , 1 ,'Get legendary comfort from the beach to the bleachers with the Mens Nike Victori Mix-Match Slide Sandal.'
 ,1300000,1700000,2)
 --doi 6
  INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Vista Sandal', 2 , 1 ,'Get comfort from city to trail with the Mens Nike Vista Sandal.'
 ,700000,900000,1)
  INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Victori One Slide Sandal', 3 , 1 ,'Slide into the Mens Nike Victori One Slide Sandal.'
 ,1000000,1200000,2)
  INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Victori Shower Slide Sandal', 3 , 1 ,'Hit the showers in the Mens Nike Victori Shower Slide Sandal.'
 ,1000000,1400000,3)
  INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Off Court Slide Sandal', 3 , 1 ,'Comfort meets style in the Mens Nike Off Court Slide Sandal.'
 ,8000000,990000,1)
  INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES ('Mens Adilette Shower Slide Sandal', 3 , 2 ,'From gym to home in the Adilette Shower Slide Sandal from adidas.'
 ,1000000,1200000,1)

 

INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Racer TR21 Sneaker', 5 , 2 ,'Made for speed: the Nike Quest 4 Running Shoe.Breathable mesh upper in a running sneaker style with a round toeLace-up closure with Flywire cables provides midfoot supportPadded collar and tongue for increased comfort
Soft lining with cushioned insoleTextured foam midsoleDurable rubber outsole',4000000,430000,5);

 
 INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('Air Max Excee Sneaker', 5 , 2 ,'Get an iconic look in the Nike Air Max Excee Sneaker.Mesh, leather and suede upper in a lifestyle sneaker styleSlip-on entry with lace-up closurePadded collar and tongue for increased comfort
Synthetic leather overlaysSoft lining with cushioned insoleFoam midsole with durable rubber outsoleVisible Air unit',3000000,330000,5);


INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
('Court Vision Low Sneaker', 5 , 2 ,'Get old-school style in the Nike Court Vision Low Sneaker.Leather upper in a lifestyle sneaker style.Lace-up closure.Padded collar and tongue for increased comfort
For some styles the leather upper has been replaced with recycled and synthetic materials that keep the soul of the original style.Soft lining with cushioned insole.Durable rubber outsole.Some styles made with at least 20% recycled material by weight'
 ,2000000,270000,6);


 INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('Air Max AP Sneaker', 5 , 2 ,'Blur the lines between past and present in the sleek Nike Air Max AP Sneaker.Synthetic leather and airy mesh upper in a fashion sneaker style with a round toe.Lace-up closure
Padded collar and tongue for increased comfort.Heel pull tab.Soft lining with cushioned insole
Foam midsole adds plush cushioning.Full-length Max Air unit.Kli>Foam midsole.Durable rubber traction outsole'
 ,4000000,460000,6);


  INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('Court Vision Alta Sneaker', 5 , 2 ,'Stay on trend in the Nike Court Vision Alta Sneaker.
Transparent mesh and synthetic upper in a lifestyle sneaker style with a round toe.Lace-up closure.Heel pull tab.Padded tongue for increased comfort.Collapsible heel.
Soft lining with cushioned insole.Lifted platform foam midsole.Durable traction outsole',4100000,445000,3);


   INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('CAYUCAS SLIDE MEGA PLATFORM', 6 , 4 ,'Cayucas Slide Mega Platform',3100000,345000,3);


    INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('MIX MATCH CAYUCAS SLIDE MEGA PLATFORM', 6 , 4 ,'The Mix Match Cayucas Slide Mega Platform is an easy-wearing, slide-on sandal built on a platform base and made with UltraCush Lite footbeds for all-day comfort. The mixed textile straps include hook-and-loop adjustability for a customized fit, and the iconic checkerboard print will keep you rocking that laid-back look all season. Along with soft, rubber-backed stretch textile linings, this comfy sandal is made with durable rubber outsoles featuring our sawtooth tread. It’s finished with water-based inks and glues. • Premium textile straps with hook-and-loop adjustability • Soft, rubber-backed stretch textile lining • UltraCush Lite footbed • Stacked EVA platform durable rubber outsole with sawtooth tread • Made with water-based inks and glues • Upgraded with a 25.4 mm platform height'
 ,4100000,445000,3);


    INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('CAYUCAS SLIDE', 6 , 4 ,'The Cayucas Slide is an easy-wearing, slide-on sandal made with UltraCush Lite footbeds for all-day comfort. The synthetic leather straps include hook-and-loop adjustability for a customized fit, and the durable rubber outsoles feature our sawtooth tread to keep you rocking that laid-back look all season. Along with soft, rubber-backed stretch textile linings, this comfy sandal is made with water-based inks and glues. Synthetic leather straps with hook-and-loop adjustability Soft, rubber-backed stretch textile lining UltraCush Lite footbed Durable rubber outsole with sawtooth tread Made with water-based inks and glues'
 ,2100000,345000,3);
  
 
     INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('CROSS STRAP', 8 , 4 ,'Cross Strap'
 ,2900000,340000,5);


   INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES
 ('LEATHER DECON SLIDE', 8 , 4 ,'Built with full-grain leather straps, the brand new Womens Leather Decon Slide sandal offers the all-day comfort of our ULTRACUSH™ Lite footbed mixed with sophisticated debossed branding for an elevated, timeless fit. It is made with water-based inks and glues.'
 ,2940000,344500,5);

 
    INSERT INTO Products(ProductName,SubCategoryID,BrandID,Description,ImportPrice,UnitPrice,Discount)
VALUES('ULTRACUSH SLIDE-ON', 8 , 4 ,'UltraCush Slide-On',2440000,324500,5);
 --- insert image
 select * from Images
 INSERT INTO Images(ProductId,Url) values (1,'shoe1-1.png')
 INSERT INTO Images(ProductId,Url) values (1,'shoe1-2.png')
 INSERT INTO Images(ProductId,Url) values (1,'shoe1-3.png')
 INSERT INTO Images(ProductId,Url) values (1,'shoe1-4.png')
 INSERT INTO Images(ProductId,Url) values (1,'shoe1-5.png')
 INSERT INTO Images(ProductId,Url) values (1,'shoe1-6.png')

 INSERT INTO Images(ProductId,Url) values (2,'shoe2-1.png')
 INSERT INTO Images(ProductId,Url) values (2,'shoe2-2.png')
 INSERT INTO Images(ProductId,Url) values (2,'shoe2-3.png')
 INSERT INTO Images(ProductId,Url) values (2,'shoe2-4.png')

 INSERT INTO Images(ProductId,Url) values (3,'shoe3-1.png')
 INSERT INTO Images(ProductId,Url) values (3,'shoe3-2.png')
 INSERT INTO Images(ProductId,Url) values (3,'shoe3-3.png')
 INSERT INTO Images(ProductId,Url) values (3,'shoe3-4.png')

 INSERT INTO Images(ProductId,Url) values (4,'shoe4-1.png')
 INSERT INTO Images(ProductId,Url) values (4,'shoe4-2.png')
 INSERT INTO Images(ProductId,Url) values (4,'shoe4-3.png')
 INSERT INTO Images(ProductId,Url) values (4,'shoe4-4.png') 
 INSERT INTO Images(ProductId,Url) values (4,'shoe4-5.png')
 INSERT INTO Images(ProductId,Url) values (4,'shoe4-6.png')
 INSERT INTO Images(ProductId,Url) values (4,'shoe4-7.png')
 INSERT INTO Images(ProductId,Url) values (4,'shoe4-8.png')

 INSERT INTO Images(ProductId,Url) values (5,'shoe5-1.png')
 INSERT INTO Images(ProductId,Url) values (5,'shoe5-2.png')
 INSERT INTO Images(ProductId,Url) values (5,'shoe5-3.png')
 INSERT INTO Images(ProductId,Url) values (5,'shoe5-4.png')

 INSERT INTO Images(ProductId,Url) values (6,'shoe6-1.png')
 INSERT INTO Images(ProductId,Url) values (6,'shoe6-2.png')
 INSERT INTO Images(ProductId,Url) values (6,'shoe6-3.png')
 INSERT INTO Images(ProductId,Url) values (6,'shoe6-4.png')

 INSERT INTO Images(ProductId,Url) values (7,'shoe7-1.png')
 INSERT INTO Images(ProductId,Url) values (7,'shoe7-2.png')
 INSERT INTO Images(ProductId,Url) values (7,'shoe7-3.png')
 INSERT INTO Images(ProductId,Url) values (7,'shoe7-4.png')

 INSERT INTO Images(ProductId,Url) values (8,'shoe8-1.png')
 INSERT INTO Images(ProductId,Url) values (8,'shoe8-2.png')
 INSERT INTO Images(ProductId,Url) values (8,'shoe8-3.png')
 INSERT INTO Images(ProductId,Url) values (8,'shoe8-4.png')

  INSERT INTO Images(ProductId,Url) values (9,'shoe9-1.png')
 INSERT INTO Images(ProductId,Url) values (9,'shoe9-2.png')
 INSERT INTO Images(ProductId,Url) values (9,'shoe9-3.png')
 INSERT INTO Images(ProductId,Url) values (9,'shoe9-4.png')

 INSERT INTO Images(ProductId,Url) values (10,'shoe10-1.png')
 INSERT INTO Images(ProductId,Url) values (10,'shoe10-2.png')
 INSERT INTO Images(ProductId,Url) values (10,'shoe10-3.png')
 INSERT INTO Images(ProductId,Url) values (10,'shoe10-4.png')

 INSERT INTO Images(ProductId,Url) values (11,'shoe11-1.png')
 INSERT INTO Images(ProductId,Url) values (11,'shoe11-2.png')
 INSERT INTO Images(ProductId,Url) values (11,'shoe11-3.png')
 INSERT INTO Images(ProductId,Url) values (11,'shoe11-4.png') 
 INSERT INTO Images(ProductId,Url) values (11,'shoe11-5.png')
 INSERT INTO Images(ProductId,Url) values (11,'shoe11-6.png')

 INSERT INTO Images(ProductId,Url) values (12,'shoe12-1.png')
 INSERT INTO Images(ProductId,Url) values (12,'shoe12-2.png')
 INSERT INTO Images(ProductId,Url) values (12,'shoe12-3.png')
 INSERT INTO Images(ProductId,Url) values (12,'shoe12-4.png') 
 INSERT INTO Images(ProductId,Url) values (12,'shoe12-5.png')
 INSERT INTO Images(ProductId,Url) values (12,'shoe12-6.png')

 INSERT INTO Images(ProductId,Url) values (13,'shoe13-1.png')
 INSERT INTO Images(ProductId,Url) values (13,'shoe13-2.png')
 INSERT INTO Images(ProductId,Url) values (13,'shoe13-3.png')

 INSERT INTO Images(ProductId,Url) values (14,'shoe14-1.png')
 INSERT INTO Images(ProductId,Url) values (14,'shoe14-2.png')
 INSERT INTO Images(ProductId,Url) values (14,'shoe14-3.png')

 INSERT INTO Images(ProductId,Url) values (15,'shoe15-1.png')
 INSERT INTO Images(ProductId,Url) values (15,'shoe15-2.png')
 INSERT INTO Images(ProductId,Url) values (15,'shoe15-3.png')
 INSERT INTO Images(ProductId,Url) values (15,'shoe15-4.png') 
 INSERT INTO Images(ProductId,Url) values (15,'shoe15-5.png')
 INSERT INTO Images(ProductId,Url) values (15,'shoe15-6.png')

 INSERT INTO Images(ProductId,Url) values (16,'shoe16-1.png')
 INSERT INTO Images(ProductId,Url) values (16,'shoe16-2.png')
 INSERT INTO Images(ProductId,Url) values (16,'shoe16-3.png')
 INSERT INTO Images(ProductId,Url) values (16,'shoe16-4.png')

  INSERT INTO Images(ProductId,Url) values (17,'shoe17-1.png')
 INSERT INTO Images(ProductId,Url) values (17,'shoe17-2.png')
 INSERT INTO Images(ProductId,Url) values (17,'shoe17-3.png')
 INSERT INTO Images(ProductId,Url) values (17,'shoe17-4.png') 

 INSERT INTO Images(ProductId,Url) values (18,'shoe18-1.png')
 INSERT INTO Images(ProductId,Url) values (18,'shoe18-2.png')
 INSERT INTO Images(ProductId,Url) values (18,'shoe18-3.png')
 INSERT INTO Images(ProductId,Url) values (18,'shoe18-4.png') 

 INSERT INTO Images(ProductId,Url) values (19,'shoe19-1.png')
 INSERT INTO Images(ProductId,Url) values (19,'shoe19-2.png')
 INSERT INTO Images(ProductId,Url) values (19,'shoe19-3.png')

  INSERT INTO Images(ProductId,Url) values (20,'shoe20-1.png')
 INSERT INTO Images(ProductId,Url) values (20,'shoe20-2.png')
 INSERT INTO Images(ProductId,Url) values (20,'shoe20-3.png')
 INSERT INTO Images(ProductId,Url) values (20,'shoe20-4.png') 

 INSERT INTO Images(ProductId,Url) values (21,'shoe20-1.png')
 INSERT INTO Images(ProductId,Url) values (21,'shoe20-2.png')
 INSERT INTO Images(ProductId,Url) values (21,'shoe20-3.png')
 INSERT INTO Images(ProductId,Url) values (21,'shoe20-4.png') 

 INSERT INTO Images(ProductId,Url) values (22,'shoe22-1.png')
 INSERT INTO Images(ProductId,Url) values (22,'shoe22-2.png')
 INSERT INTO Images(ProductId,Url) values (22,'shoe22-3.png')

 INSERT INTO Images(ProductId,Url) values (23,'shoe22-1.png') 
 INSERT INTO Images(ProductId,Url) values (23,'shoe22-2.png')
 INSERT INTO Images(ProductId,Url) values (23,'shoe22-3.png')

 INSERT INTO Images(ProductId,Url) values (24,'shoe24-1.png')
 INSERT INTO Images(ProductId,Url) values (24,'shoe24-2.png')
 INSERT INTO Images(ProductId,Url) values (24,'shoe24-3.png')

  INSERT INTO Images(ProductId,Url) values (25,'shoe25-1.png')
 INSERT INTO Images(ProductId,Url) values (25,'shoe25-2.png')
 INSERT INTO Images(ProductId,Url) values (25,'shoe25-3.png')

  INSERT INTO Images(ProductId,Url) values (26,'shoe25-1.png')
 INSERT INTO Images(ProductId,Url) values (26,'shoe25-2.png')
 INSERT INTO Images(ProductId,Url) values (26,'shoe25-3.png')

 INSERT INTO Images(ProductId,Url) values (27,'shoe27-1.png')
 INSERT INTO Images(ProductId,Url) values (27,'shoe27-2.png')
 INSERT INTO Images(ProductId,Url) values (27,'shoe27-3.png')
 INSERT INTO Images(ProductId,Url) values (27,'shoe27-4.png') 

 INSERT INTO Images(ProductId,Url) values (28,'shoe27-1.png')
 INSERT INTO Images(ProductId,Url) values (28,'shoe27-2.png')
 INSERT INTO Images(ProductId,Url) values (28,'shoe27-3.png')
 INSERT INTO Images(ProductId,Url) values (28,'shoe27-4.png') 

 INSERT INTO Images(ProductId,Url) VALUES (29,'41_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_4.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_5.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_6.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_7.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_8.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_a.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_b.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_c.png')
 INSERT INTO Images(ProductId,Url) VALUES (29,'41_d.png')

 INSERT INTO Images(ProductId,Url) VALUES (30,'42_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_4.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_5.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_6.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_7.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_8.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_a.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_b.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_c.png')
 INSERT INTO Images(ProductId,Url) VALUES (30,'42_d.png')

 INSERT INTO Images(ProductId,Url) VALUES (31,'43_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_4.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_5.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_6.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_7.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_8.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_a.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_b.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_c.png')
 INSERT INTO Images(ProductId,Url) VALUES (31,'43_d.png')

 INSERT INTO Images(ProductId,Url) VALUES (32,'44_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (32,'44_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (32,'44_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (32,'44_4.png')
 INSERT INTO Images(ProductId,Url) VALUES (32,'44_5.png')
 INSERT INTO Images(ProductId,Url) VALUES (32,'44_6.png')
 

 INSERT INTO Images(ProductId,Url) VALUES (33,'45_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (33,'45_2.png')
 
 INSERT INTO Images(ProductId,Url) VALUES (34,'46_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (34,'46_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (34,'46_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (34,'46_4.png')

 INSERT INTO Images(ProductId,Url) VALUES (35,'47_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (35,'47_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (35,'47_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (35,'47_4.png')
 INSERT INTO Images(ProductId,Url) VALUES (35,'47_5.png')
 INSERT INTO Images(ProductId,Url) VALUES (35,'47_6.png')
 INSERT INTO Images(ProductId,Url) VALUES (35,'47_7.png')
 INSERT INTO Images(ProductId,Url) VALUES (35,'47_8.png')

 INSERT INTO Images(ProductId,Url) VALUES (36,'48_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (36,'48_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (36,'48_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (36,'48_4.png')
 
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_4.png')
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_5.png')
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_6.png')
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_7.png')
 INSERT INTO Images(ProductId,Url) VALUES (37,'49_8.png')

 INSERT INTO Images(ProductId,Url) VALUES (38,'50_1.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_2.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_3.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_4.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_5.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_6.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_7.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_8.png')
 INSERT INTO Images(ProductId,Url) VALUES (38,'50_9.png')

 INSERT INTO Images(ProductId,Url) values (39,'Sneaker1.png')
 INSERT INTO Images(ProductId,Url) values (39,'Sneaker1-2.png')
 INSERT INTO Images(ProductId,Url) values (39,'Sneaker1-3.png')
 INSERT INTO Images(ProductId,Url) values (39,'Sneaker1-4.png')
 INSERT INTO Images(ProductId,Url) values (39,'Sneaker1-5.png')
 INSERT INTO Images(ProductId,Url) values (39,'Sneaker1-6.png')

 INSERT INTO Images(ProductId,Url) values (40,'Sneaker2.png')
 INSERT INTO Images(ProductId,Url) values (40,'Sneaker2-1.png')
 INSERT INTO Images(ProductId,Url) values (40,'Sneaker2-2.png')
 INSERT INTO Images(ProductId,Url) values (40,'Sneaker2-3.png')
 INSERT INTO Images(ProductId,Url) values (40,'Sneaker2-4.png')
 INSERT INTO Images(ProductId,Url) values (40,'Sneaker2-5.png')

 INSERT INTO Images(ProductId,Url) values (41,'Sneaker3.png')
 INSERT INTO Images(ProductId,Url) values (41,'Sneaker3-1.png')
 INSERT INTO Images(ProductId,Url) values (41,'Sneaker3-2.png')
 INSERT INTO Images(ProductId,Url) values (41,'Sneaker3-3.png')
 INSERT INTO Images(ProductId,Url) values (41,'Sneaker3-4.png')
 INSERT INTO Images(ProductId,Url) values (41,'Sneaker3-5.png')

 INSERT INTO Images(ProductId,Url) values (42,'Sneaker4.png')
 INSERT INTO Images(ProductId,Url) values (42,'Sneaker4-1.png')
 INSERT INTO Images(ProductId,Url) values (42,'Sneaker4-2.png')
 INSERT INTO Images(ProductId,Url) values (42,'Sneaker4-3.png')
 INSERT INTO Images(ProductId,Url) values (42,'Sneaker4-4.png')
 INSERT INTO Images(ProductId,Url) values (42,'Sneaker4-5.png')
 INSERT INTO Images(ProductId,Url) values (42,'Sneaker4-6.png')

 INSERT INTO Images(ProductId,Url) values (43,'Sneaker5.png')
 INSERT INTO Images(ProductId,Url) values (43,'Sneaker5-1.png')
 INSERT INTO Images(ProductId,Url) values (43,'Sneaker5-2.png')
 INSERT INTO Images(ProductId,Url) values (43,'Sneaker5-3.png')
 INSERT INTO Images(ProductId,Url) values (43,'Sneaker5-4.png')
 INSERT INTO Images(ProductId,Url) values (43,'Sneaker5-5.png')

 INSERT INTO Images(ProductId,Url) values (44,'Scandal1.png')
 INSERT INTO Images(ProductId,Url) values (44,'Scandal1-2.png')
 INSERT INTO Images(ProductId,Url) values (44,'Scandal1-3.png')
 INSERT INTO Images(ProductId,Url) values (44,'Scandal1-4.png')
 INSERT INTO Images(ProductId,Url) values (44,'Scandal1-5.png')

 INSERT INTO Images(ProductId,Url) values (45,'Scandal2.png')
 INSERT INTO Images(ProductId,Url) values (45,'Scandal2-1.png')
 INSERT INTO Images(ProductId,Url) values (45,'Scandal2-2.png')
 INSERT INTO Images(ProductId,Url) values (45,'Scandal2-3.png')
 INSERT INTO Images(ProductId,Url) values (45,'Scandal2-4.png')
 INSERT INTO Images(ProductId,Url) values (45,'Scandal2-5.png')

 INSERT INTO Images(ProductId,Url) values (46,'Scandal3.png')
 INSERT INTO Images(ProductId,Url) values (46,'Scandal3-1.png')
 INSERT INTO Images(ProductId,Url) values (46,'Scandal3-2.png')
 INSERT INTO Images(ProductId,Url) values (46,'Scandal3-3.png')
 INSERT INTO Images(ProductId,Url) values (46,'Scandal3-4.png')

 INSERT INTO Images(ProductId,Url) values (47,'Sliper1.png')
 INSERT INTO Images(ProductId,Url) values (47,'Sliper1-2.png')
 INSERT INTO Images(ProductId,Url) values (47,'Sliper1-3.png')
 INSERT INTO Images(ProductId,Url) values (47,'Scandal1-4.png')
 INSERT INTO Images(ProductId,Url) values (47,'Scandal1-5.png')

 INSERT INTO Images(ProductId,Url) values (48,'Sliper2.png')
 INSERT INTO Images(ProductId,Url) values (48,'Sliper2-1.png')
 INSERT INTO Images(ProductId,Url) values (48,'Sliper2-2.png')
 INSERT INTO Images(ProductId,Url) values (48,'Scandal2-3.png')
 INSERT INTO Images(ProductId,Url) values (48,'Scandal2-4.png')

 INSERT INTO Images(ProductId,Url) values (49,'Sliper3.png')
 INSERT INTO Images(ProductId,Url) values (49,'Sliper3-1.png')
 INSERT INTO Images(ProductId,Url) values (49,'Sliper3-2.png')
 INSERT INTO Images(ProductId,Url) values (49,'Scandal3-3.png')
 INSERT INTO Images(ProductId,Url) values (49,'Scandal3-4.png')

 --- insert product details
 select * from ProductDetails
 --- Jordan Series Mid : Orange , Gray , Black
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'38','Orange',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'39','Orange',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'40','Orange',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'41','Orange',20)
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'38','Gray',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'39','Gray',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'40','Gray',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'41','Gray',20)
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'38','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'39','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'40','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (1,'41','Black',20)

 ---product 2 : 1 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (2,'38','Silver/Gold',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (2,'39','Silver/Gold',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (2,'40','Silver/Gold',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (2,'41','Silver/Gold',20)

 --- product 3 : 1 màu
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (3,'38','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (3,'39','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (3,'40','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (3,'41','White',20)

 --- product 4 : 2 màu : while/black , while/orange
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'38','White/Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'39','White/Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'40','White/Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'41','White/Black',20)
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'38','White/Orange',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'39','White/Orange',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'40','White/Orange',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (4,'41','White/Orange',20)

 --- product 5 : 1 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (5,'38','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (5,'39','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (5,'40','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (5,'41','White',20)

  --- product 6 : 1 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (6,'38','Gray/Red',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (6,'39','Gray/Red',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (6,'40','Gray/Red',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (6,'41','Gray/Red',20)

   --- product 7 : 1 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (7,'38','White/Pink',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (7,'39','White/Pink',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (7,'40','White/Pink',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (7,'41','White/Pink',20)

  --- product 8 : 1 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (8,'38','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (8,'39','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (8,'40','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (8,'41','White',20)

   --- product 9 : 1 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (9,'38','Chalk White / Cloud White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (9,'39','Chalk White / Cloud White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (9,'40','Chalk White / Cloud White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (9,'41','Chalk White / Cloud White',20)
		    
			 --- product 10 : 1 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (10,'38',' Cloud White / Supplier Colour',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (10,'39',' Cloud White / Supplier Colour',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (10,'40',' Cloud White / Supplier Colour',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (10,'41',' Cloud White / Supplier Colour',20)

 	 --- product 11 : 2 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'38','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'39','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'40','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'41','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'38','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'39','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'40','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (11,'41','Black',20)

  	 --- product 12 : 2 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'38','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'39','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'40','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'41','White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'38','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'39','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'40','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (12,'41','Black',20)


   	 --- product 13 : 1 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (13,'38','BLANC DE BLANC/TRUE WHITE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (13,'39','BLANC DE BLANC/TRUE WHITE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (13,'40','BLANC DE BLANC/TRUE WHITE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (13,'41','BLANC DE BLANC/TRUE WHITE',20)

   	 --- product 14 : 1 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (14,'38','BLACK/TRUE WHITE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (14,'39','BLACK/TRUE WHITE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (14,'40','BLACK/TRUE WHITE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (14,'41','BLACK/TRUE WHITE',20)

    	 --- product 15 : 2 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'38',' PASTEL TIE DYE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'39',' PASTEL TIE DYE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'40',' PASTEL TIE DYE',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'41',' PASTEL TIE DYE',20)
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'38','MARSHMALLOW',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'39',' MARSHMALLOW',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'40',' MARSHMALLOW',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (15,'41',' MARSHMALLOW',20)

    	 --- product 16 : 1 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (16,'38','SARA LORUSSO',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (16,'39','SARA LORUSSO',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (16,'40','SARA LORUSSO',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (16,'41','SARA LORUSSO',20)

 --- product 17 : 2 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'38',' MULTI/MARSHMALLOW',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'39',' MULTI/MARSHMALLOW',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'40',' MULTI/MARSHMALLOW',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'41',' MULTI/MARSHMALLOW',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'38','CELADON GREEN',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'39',' CELADON GREEN',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'40',' CELADON GREEN',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (17,'41',' CELADON GREEN',20)

  --- product 18 : 2 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (18,'38',' White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (18,'39',' White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (18,'40',' White',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (18,'38',' Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (18,'39',' Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (18,'40',' Black',20)

     	 --- product 19 : 1 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (19,'38','WALNUT',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (19,'39','WALNUT',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (19,'40','WALNUT',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (19,'41','WALNUT',20)

   	 --- product 20 : 2 màu
   INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'38',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'39',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'40',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'41',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'38','TRUE WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'39','TRUE WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'40','TRUE WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (20,'41','TRUE WHITE/BLACK',20)

   	 --- product 21 : 2 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'38',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'39',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'40',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'41',' BLACK/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'38','TRUE WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'39','TRUE WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'40','TRUE WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (21,'41','TRUE WHITE/BLACK',20)

    	 --- product 22 : 1 màu

 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (22,'38','WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (22,'39','WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (22,'40','WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (22,'41','WHITE/BLACK',20)

    	 --- product 23 : 1 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (23,'38',' WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (23,'39','WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (23,'40','WHITE/BLACK',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (23,'41','WHITE/BLACK',20)
  --- product 24 : 1 màu
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (24,'38','Viscous Green',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (24,'39','Viscous Green',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (24,'40','Viscous Green',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (24,'41','Viscous Green',20)

 --- product 25 : 1 màu
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (25,'38','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (25,'39','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (25,'40','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (25,'41','Black',20)

 --- product 26 : 1 màu
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (26,'38','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (26,'39','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (26,'40','Black',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (26,'41','Black',20)

  --- product 27 : 1 màu
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (27,'38','Golden Mind',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (27,'39','Golden Mind',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (27,'40','Golden Mind',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (27,'41','Golden Mind',20)
  --- product 28 : 1 màu
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (28,'38','Golden Mind',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (28,'39','Golden Mind',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (28,'40','Golden Mind',20)
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) values (28,'41','Golden Mind',20)

 -- prduct 29
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'38', 'White/Red/Pink', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'39', 'White/Red/Pink', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'40', 'White/Red/Pink', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'41', 'White/Red/Pink', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'38', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'39', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'40', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'41', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'38', 'Black/Lime/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'39', 'Black/Lime/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'40', 'Black/Lime/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (29,'41', 'Black/Lime/Orange', 20 )
 --doi 30
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'38', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'39', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'40', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'41', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'38', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'39', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'40', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'41', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'38', 'Grey/Blue/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'39', 'Grey/Blue/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'40', 'Grey/Blue/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (30,'41', 'Grey/Blue/Orange', 20 )

 --doi 31
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'38', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'39', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'40', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'41', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'38', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'39', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'40', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'41', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'38', 'Rainbow', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'39', 'Rainbow', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'40', 'Rainbow', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (31,'41', 'Rainbow', 20 )
  --doi 32
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'38', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'39', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'40', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'41', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'38', 'Green/Obsidian', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'39', 'Green/Obsidian', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'40', 'Green/Obsidian', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (32,'41', 'Green/Obsidian', 20 )
  --doi 33
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (33,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (33,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (33,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (33,'41', 'Black/White', 20 )
  --doi 34
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (34,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (34,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (34,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (34,'41', 'Black/White', 20 )
  --doi 35
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'38', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'39', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'40', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'41', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'38', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'39', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'40', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'41', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (35,'41', 'Black/White', 20 )
  --doi 36
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (36,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (36,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (36,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (36,'41', 'Black/White', 20 )
  --doi 37
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'38', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'38', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'38', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'41', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'39', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'39', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'39', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'41', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'40', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'40', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'40', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (37,'41', 'Black/Anthracite', 20 )
 --doi 38
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'38', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'39', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'40', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'41', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'38', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'39', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'40', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'41', 'Red/White', 20 )
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'38', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'39', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'40', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (38,'41', 'White/Black', 20 )
 -- P39
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'38', 'White/Red/Pink', 30 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'39', 'White/Red/Pink', 30 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'40', 'White/Red/Pink', 30 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'41', 'White/Red/Pink', 30 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'38', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'39', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'40', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'41', 'Black/White/Volt', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'38', 'Black/Lime/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'39', 'Black/Lime/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'40', 'Black/Lime/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (39,'41', 'Black/Lime/Orange', 20 )
 --P40
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'38', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'39', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'40', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'41', 'Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'38', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'39', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'40', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'41', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'38', 'Grey/Blue/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'39', 'Grey/Blue/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'40', 'Grey/Blue/Orange', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (40,'41', 'Grey/Blue/Orange', 20 )

 --P41
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'38', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'39', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'40', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'41', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'38', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'39', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'40', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'41', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'38', 'Rainbow', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'39', 'Rainbow', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'40', 'Rainbow', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (41,'41', 'Rainbow', 20 )
  --P42
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'38', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'39', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'40', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'41', 'Black/Wolf Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'38', 'Green/Obsidian', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'39', 'Green/Obsidian', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'40', 'Green/Obsidian', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (42,'41', 'Green/Obsidian', 20 )
  --P43
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (43,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (43,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (43,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (43,'41', 'Black/White', 20 )
  --P44
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (44,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (44,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (44,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (44,'41', 'Black/White', 20 )
  --P45
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'38', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'39', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'40', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'41', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'38', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'39', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'40', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'41', 'Orange/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (45,'41', 'Black/White', 20 )
  --P46
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (46,'38', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (46,'39', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (46,'40', 'Black/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (46,'41', 'Black/White', 20 )
  --P47
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'38', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'38', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'38', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'41', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'39', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'39', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'39', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'41', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'40', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'40', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'40', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (47,'41', 'Black/Anthracite', 20 )
 --P48
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'38', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'39', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'40', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'41', 'Royal Blue', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'38', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'39', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'40', 'Red/White', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'41', 'Red/White', 20 )
  INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'38', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'39', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'40', 'White/Black', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (48,'41', 'White/Black', 20 )

   --P49
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'38', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'38', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'38', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'41', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'39', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'39', 'Blue/White/Red', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'39', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'41', 'Black/White/Grey', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'40', 'Black/Anthracite', 20 )
 INSERT INTO ProductDetails(ProductId,Size,Color,QuantityInStock) VALUES (49,'40', 'Blue/White/Red', 20 )



 select * from SubCategories
 select * from Brands
 select * from Products
 select *from Images
 select * from ProductDetails




