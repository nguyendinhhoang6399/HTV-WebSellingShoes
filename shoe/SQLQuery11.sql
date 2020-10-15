select * from Users
select * from Cart
select * from CTSP
select * from SanPham
select * from ShoeType
insert into SanPham(TenSP,TypeId,maNcc) values(N'Giày Nike Air Jordan Cho Nam','1','2')
select * from CartDetail
insert into CTSP values('2',N'Đen','1','400','0','~/img/item/black.jpg')
insert into CTSP values('5',N'Xanh','3','720','10','~/img/item/blue.jpg')
insert into CTSP values('3',N'Trắng','1','320','10','~/img/item/white.jpg')
insert into CTSP values('3',N'Xanh','1','720','10','~/img/item/nuxanh.jpg')
insert into CTSP values('3',N'Hồng','1','820','10','~/img/item/nuhong.jpg')
insert into CTSP values('3',N'Hồng','2','850','10','~/img/item/nuhong.jpg')
insert into CTSP values('3',N'Hồng','3','825','10','~/img/item/nuhong.jpg')
insert into CTSP values('5',N'Xanh','4','820','10','~/img/item/blue.jpg')
insert into CTSP values('5',N'Hồng','4','1300','10','~/img/item/pink.jpg')
insert into CTSP values('5',N'Xám','4','390','10','~/img/item/xam.jpg')
insert into CTSP values('6',N'Trắng','3','990','10','~/img/item/namtrang.jpg')
insert into CTSP values('6',N'Trắng','4','990','10','~/img/item/namtrang.jpg')
insert into CTSP values('6',N'Đen','3','990','10','~/img/item/namden.jpg')
insert into CTSP values('6',N'Đỏ Đen','3','920','10','~/img/item/doden.jpg')
CREATE TABLE CartDetail
	(
	 Cartid int,
	 MaSP int,
	 SizeId int,
	 MauSac NVARCHAR (100),
	 SoLuong INT,
	 giaBan int,
	primary key (Cartid, MaSP, SizeId, MauSac),

	FOREIGN KEY (Cartid) REFERENCES Cart (Cartid),
	FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
	FOREIGN KEY (SizeId) references Size(SizeId),
	)
	GO
	create trigger tg_CartDetail_in on CartDetail for insert
	as begin
	Declare @cardId int,@soLuong int,@GiaBan int
	select @cardId=cartId,@soLuong=Soluong,@GiaBan=giaBan from inserted
	update Cart set TongTien=TongTien+(@soLuong*@GiaBan) where Cartid=@cardId
	end
	create trigger tg_CartDetail_up on CartDetail for update
	as begin
	Declare @cardId int,@soLuong int,@GiaBan int,@soLuongCu int
	select @soLuongCu=soLuong from deleted
	select @cardId=cartId,@soLuong=Soluong,@GiaBan=giaBan from inserted
	update Cart set TongTien=TongTien+(@soLuong*@GiaBan)-(@soLuongCu*@GiaBan) where Cartid=@cardId
	end

	create trigger tg_CartDetail_dele on CartDetail for delete
	as begin
	Declare @cardId int,@soLuong int,@GiaBan int
	select @cardId=cartId,@soLuong=Soluong,@GiaBan=giaBan from deleted
	update Cart set TongTien=TongTien+(@soLuong*@GiaBan) where Cartid=@cardId
	end
