--cau 1 : 
select *
from HocVien
where Ho like N'Nguyen%'
go
--cau2 cho biet so luong lop hoc o moi khoa học
select count (Lophoc.MaKH) as slkh
from KhoaHoc join LopHoc on KhoaHoc.MaKH =LopHoc.MaKH
--cau 3
select TenLop, count(HOCVIEN.maHV) as soluongKhongdat
from LopHoc join BienLail on LopHoc.MaLH-Bien Lai1.MaLH join HocVien on HocVien. MaHV=BienLai1.MaHV
where KetQua like N'Khong Dau%
group by TenLop
--cau4 cho biet ten lop va so luong hoc sinh dat kha gioi
select TenLop, count(HOCVIEN.maHV) as soluongKhaGioi
from LopHoc join BienLail on LopHoc.MaLH-Bien Lai1.MaLH join HocVien on HocVien. MaHV=BienLai1.MaHV
where XepLoai like N'Kha%' Or XepLoai like N'Gioi'
group by TenLop
go
--cau5 cho biet ten lop hoc co so luong hoc vien dong nhat
select TenLop, count(MaHV) as soLuongHocVien
from LopHoc join BienLail on LopHoc.MaLH =BienLai1.MaLH
group by TenLop
(
having count (MaHV) >= all
select count (MaHV)
from LopHoc join BienLail on LopHoc.MaLH BienLai1.MaLH
group by MaHV
)
go
6)
select TenLop, TenGV, SiSo, MaLH as [Phòng học]
from LopHoc join GiaoVien on LopHoc.MaGV=GiaoVien.MaGV
join KhoaHoc on LopHoc.MaKH=KhoaHoc. MaKH
where '04/17/1997' between NgayBD and NgayKT
7)
select
8)
select HocVien.
from HocVien join BienLai on HocVien. MaHV-BienLai.MaHV
join KhoaHoc on KhoaHoc.MaKH=BienLai.MaKH
where TenKH in (select *
from KhoaHoc
where year(NgayBD)=1997 and TenKH like N'Tieng Phap Pho
Thong%')
--cau 9
select diem ,ketqua,xeploai
from GiaoVien join LopHoc on GiaoVien.MaGV =LopHoc.MaGV join BienLai1 on BienLai1.MaLH =LopHoc.MaLH
where (HoTen like N'%Tran Thanh' or HoTen like N'%Ho Nhan') and BienLai1.MaKH like N'PT197%'
go
