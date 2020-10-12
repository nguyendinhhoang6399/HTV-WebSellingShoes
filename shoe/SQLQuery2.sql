	insert into SanPham(TenSP,TypeId,maNcc) values(N'Giày Sneaker cho Nữ','1','2')
		insert into SanPham(TenSP,TypeId,maNcc) values(N'Giày Sneaker cho Trẻ Em','1','2')
		insert into SanPham(TenSP,TypeId,maNcc) values(N'Giày football cho Nam','1','2')

		select * from SanPham
		select * from CTSP

		   insert into CTSP values('2',N'Trắng','1','400','0','~/img/item/item1.jpg')
		   insert into CTSP values('2',N'Đen','1','400','0','~/img/item/item2.jpg')
		   insert into CTSP values('5',N'Xanh','3','700','3','~/img/item/item3.jpg')
		   select S.MaSP,S.TenSP,C.GiaBan,C.anh from CTSP C,SanPham S where C.MaSP=S.MaSP