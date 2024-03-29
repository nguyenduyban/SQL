--CAU 1

CREATE TABLE LOAIVATU(
Maloai nchar(5),
TenLoai nvarchar(50),
Mota nvarchar(200),
PRIMARY KEY (Maloai)
)
-- CAU 2
ALTER TABLE VATTU ADD CONSTRAINT FK_LOAIVATTU
FOREIGN KEY (MALOAI) REFERENCES LOAIVATTU (MALOAI)


--CAU 3

ALTER TABLE DONHANG ADD CONSTRAINT CHECK1
CHECK(year(NGAYDATHANG)<=(GETDATE()))

--CAU 4 thêm dữ liệu cho phiếu nhập
INSERT INTO PHIEUNHAP(MAPN,MAVT,SOLUONG)
VALUES('N05','V07','1000')
ALTER TABLE PHIEUNHAP ADD CONSTRAINT FK_MAVATTU
FOREIGN KEY (MAVT) REFERENCES VATTU (MAVT)
INSERT INTO DONGIAMUA
SELECT *DONGIA
FROM PHIEUNHAP PN JOIN VATTU VT ON PN.MAVT=VT.MAVT
WHERE DONGIA = 1/2

-- CAU 5 lọc ra thông tin vật tư có đơn giá cao nhất
SELECT *
FROM VATTU
WHERE DONGIA = (SELECT MAX(DONGIA) FROM VATTU);

--CAU 6 lọc ra MaPN,MaVT,TenVT , SOLUONG, DONGIAMUA có tên vật tư 'Đá Mi' và sắp xếp leo số lượng
SELECT MAPN,MAVT,TENVT,TENVT,SOLUONG,DONGIAMUA
FROM VATU VT JOIN CHITIETNHAPHANG CT ON VT.MAVT=CT.MAVT
WHERE TENVT = N'Đá Mi%'
Oder By Soluong desc

--cau 7 lọc ra những thông tin có đơn đặt hàng có cùng ngày đặt hàng và sắp xếp giảm dần theo ngày đặt
select *
from donhang don1, donghang don2
where don1.maddh<> don2.maddh and don1.ngaydathang = don2.maddh
oder by don1.ngaydathang desc

--Cau 8 lọc tt gồm MaPN,NgayNhap, tổng tiền thanh toán của từng phiếu nhập, Tổng tiền thanh toán = sum(soluong * dongiamua)
select phieunhap,MaxPN,ngaynhap,sum(soluong *dongiamua) as TongTien
from chitietnhaphang join phieunhap on chitiet nhaphang.MaPN = phieunhap.MaPN
Group by phieunhap.MaPN,NgayNhap

--cau 9 Lọc ra những vật tư chưa nhập hàng lần nào.
select *
from vattu
where MaVT not in(select MaVT from chitietdonhang)

--Cau 10 Lọc MaPN,NgayNhap của các phiếu nhập có tổng tiền thanh toán k là cao nhất
select *
from vattu
where dongia>(select AVG(dongia) from vattu)
