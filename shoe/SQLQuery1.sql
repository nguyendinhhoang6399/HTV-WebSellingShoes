select * from CTSP
drop table ctsp
 CREATE TABLE CTSP
	(
		 MaSP int,
		 MauSac NVARCHAR (100),
		 maSize int,
		GiaBan int,   
		SoLuongTon int,
		anh nvarchar(300),
		PRIMARY KEY(MaSP,MauSac,maSize),
		Foreign key (MaSP) REFERENCES SanPham(MaSP),
		 Foreign key(maSize) References Size(SizeId)
	)  
   GO
   select * from SanPham
    insert into CTSP values('2',N'Trắng','1','400','0','~/img/item/item1.jpg')
	insert into CTSP values('2',N'Trắng','2','480','0','~/img/item/item1.jpg')
	insert into CTSP values('3',N'Cam','1','280','0','~/img/item/hihi.jpg')
	insert into CTSP values('5',N'Xanh Lam','4','780','0','~/img/item/dumamay.jpg')
		insert into CTSP values('5',N'Xanh Lam','3','780','12','~/img/item/dumamay.jpg')
	delete ctsp where MaSP=5