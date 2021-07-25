
use master
go

drop database ps11306_HOHUYNHTHONG_asm_java5
go

CREATE DATABASE ps11306_HOHUYNHTHONG_asm1_java5
go
use ps11306_HOHUYNHTHONG_asm1_java5
go

CREATE TABLE accounts
(
	 username   varchar (50) primary key,
	 activated   bit  NOT NULL,
	 admin   bit  NOT NULL,
	 email   varchar (50) NULL,
	 fullname   nvarchar (50) NULL,
	 password   varchar (50) NULL,
	 photo   varchar (50) NULL,
)
GO
CREATE TABLE  categories (
	 id   varchar (10) primary key,
	 name   nvarchar (50) NULL,
)
go

CREATE TABLE  products (
	 id   int  IDENTITY(1,1) primary key,
	 available   bit  NULL,
	 createdate   date  NULL,
	 image   varchar (50) NULL,
	 name   nvarchar (50) NULL,
	 price   float  NULL,
	 categoryid   varchar (10) references categories(id)
)
go
CREATE TABLE  orders (
	 id   int  IDENTITY(1,1) primary key,
	 address   nvarchar (50) NULL,
	 createdate   date  NULL,
	 username   varchar (50) references accounts(username)
)
go

CREATE TABLE  orderdetails (
	 id   int  IDENTITY(1,1) primary key,
	 price   float  NULL,
	 quantity   int  NULL,
	 orderid   int  references orders(id),
	 productid   int  references products(id)
)
GO

select * from accounts
go
select * from categories
go
select * from products
go
select * from orders
go
select * from orderdetails
go

INSERT INTO accounts values
(N'admin',1,1,'admin123@gmail.com',N'Admin',N'123',N'admin.png'),
(N'user',0,0,'user456@gmail.com',N'User',N'123',N'user.png')

INSERT [dbo].[categories] ([id], [name]) VALUES (N'1', N'sunglasses')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'2', N'glasses')



SET IDENTITY_INSERT [dbo].[products] ON 
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (1, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 01', 1700, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (2, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 02', 1600, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (3, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 03', 1100, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (4, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 04', 1200, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (5, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 05', 1100, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (6, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 06', 1300, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (7, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 07', 1400, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (8, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 01 SUNGLASSES', 1500, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (9, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 02 SUNGLASSES', 1600, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (10, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 03 SUNGLASSES', 1700, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (11, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 04 SUNGLASSES', 1500, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (12, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 05 SUNGLASSES', 1300, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (13, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 06 SUNGLASSES', 1200, N'1')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (14, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 07 SUNGLASSES', 1500, N'2')
INSERT [dbo].[products] ([id], [available], [createdate], [image], [name], [price], [categoryid]) VALUES (15, 1, CAST(N'2000-01-01' AS Date), N'1.jpg', N'THE ASSEMBLED 08 SUNGLASSES', 1300, N'2')
SET IDENTITY_INSERT [dbo].[products] OFF

