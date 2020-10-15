Create Database ShoeStore
  go
  USE ShoeStore 
  Go
	 create table LoaiTK(
	 loaiTK int primary key,
	 TenLoaiTK nvarchar(20)

	 )
	 go
	 insert into LoaiTK values(01,N'Admin')
	 insert into LoaiTK values(02,N'Customer')
	 go

	 create table Users(
	 userId int identity(1,1) primary key,
	 UserName nvarchar(100) ,
	 MatKhau nvarchar(100),
	 phoneNumber int,
	 address nvarchar(100),
	 gmail nvarchar(100),
	 anh ntext,
	 loaiTK int,
	 foreign key(loaiTK) references LoaiTK(loaiTK),
	 )
	 go  
	 CREATE TABLE ShoeType
   (
     TypeId int identity(1,1) PRIMARY KEY,
     Name NVARCHAR(100)
   )
   GO
   create table NhaCungCap
   (
		id int identity(1,1) primary key,
	    TenNhaCC NVARCHAR(100),
	    ĐiaChiNCC NVARCHAR(100),
        SDTNCC int,
        GmailNCC nvarchar(20),  
   ) 
   go

CREATE TABLE SanPham
	(
	MaSP int identity(1,1) PRIMARY KEY,
	TenSP NVARCHAR(100),
	TypeId int,
	maNcc int,
	FOREIGN KEY (TypeId) REFERENCES ShoeType(TypeId),
	FOREIGN KEY (maNcc) REFERENCES NhaCungCap(id)
	)
	go
	CREATE TABLE Cart
  (
    Cartid int IDENTITY(1,1) PRIMARY KEY ,
	userId int,
	TongTien int,
	FOREIGN KEY (userId) REFERENCES Users(userId),
	)
	GO
	Create table Size(
	 SizeId int identity(1,1) primary key,
	 name nvarchar(100)
	)
	CREATE TABLE CartDetail
	(
	 Cartid int,
	 MaSP int,
	 SizeId int,
	 KichThuoc NVARCHAR (100),
	 SoLuong INT,	
	 TongTien int

	primary key (Cartid, MaSP, SizeId, KichThuoc),

	FOREIGN KEY (Cartid) REFERENCES Cart (Cartid),
	FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
	FOREIGN KEY (SizeId) references Size(SizeId),
	)
	GO
	
	
	
	

   CREATE TABLE CTSP
   (
   MaSP int,
   MauSac NVARCHAR (100),
   maSize int,
   GiaBan int,   
   SoLuongTon int,
   anh ntext,
   PRIMARY KEY(MaSP,MauSac,maSize),
   Foreign key (MaSP) REFERENCES SanPham(MaSP),
   Foreign key(maSize) References Size(SizeId)
   )  
   GO