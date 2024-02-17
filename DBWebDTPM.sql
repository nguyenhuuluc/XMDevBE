CREATE DATABASE [DBWebDTPM]
GO

USE [DBWebDTPM]
GO

CREATE TABLE SANPHAM (
	Id INT PRIMARY KEY IDENTITY(1,1),
	TenSP NVARCHAR(max) NOT NULL,
	LoaiSP_Id INT NOT NULL,
	ThuongHieu_Id INT NOT NULL,
	GiaNhap DECIMAL NOT NULL,
	GiaBan DECIMAL NOT NULL,
	SoLuong INT NOT NULL,
	HinhAnh NVARCHAR(max) NOT NULL,
	MoTa NVARCHAR(max) NOT NULL,
	IsActive bit,
    IsDeleted bit
)
GO

SELECT * FROM SANPHAM

CREATE TABLE LOAISANPHAM (
	Id INT PRIMARY KEY IDENTITY(1,1),
	TenLoaiSP VARCHAR(255) NOT NULL,
	SoLuong INT NOT NULL,
	MoTa NVARCHAR(max) NULL,
	CONSTRAINT UC_LOAISANPHAM UNIQUE (TenLoaiSP)
)
GO

CREATE TABLE THUONGHIEU (
	Id INT PRIMARY KEY IDENTITY(1,1),
	TenThuongHieu VARCHAR(255) NOT NULL,
	MoTa NVARCHAR(max) NULL,
	CONSTRAINT UK_THUONGHIEU UNIQUE (TenThuongHieu)
)
GO

CREATE TABLE DONHANG (
	Id INT PRIMARY KEY IDENTITY(1,1),
	NV_Id INT NOT NULL,
	KH_Id INT NOT NULL,
	NgayBan DATETIME NOT NULL,
	TongTien DECIMAL NOT NULL
)
GO

CREATE TABLE CHITIETDONHANG (
	DH_Id INT NOT NULL,
	SP_Id INT NOT NULL,
	ThuongHieu_Id INT NOT NULL,
	BH_Id INT NOT NULL, 
	SoLuong INT NOT NULL,
	DiaChiNhan NVARCHAR(max) NOT NULL
)
GO

CREATE TABLE DONNHAP(
	Id INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	NV_Id INT NOT NULL,	
	NgayNhap DATETIME NOT NULL,
)
GO

CREATE TABLE CHITIETDONNHAP(
	DN_Id INT NOT NULL,
	SP_Id INT NOT NULL,
	TenSP NVARCHAR(max) NOT NULL,
	ThuongHieu_Id INT NOT NULL,
	LoaiSP_Id INT NOT NULL,	
	SoLuongNhap INT NOT NULL,
	DonGia DECIMAL NOT NULL,
	TienHang DECIMAL NOT NULL
)
GO

CREATE TABLE KHACHHANG (
	Id INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	DangNhap_Id INT NOT NULL,
	TenKH NVARCHAR(max) NOT NULL,
	DIACHI NVARCHAR(max) NULL,
	EMAIL VARCHAR(255)  NULL,
	SDT VARCHAR(10) NOT NULL,
	CONSTRAINT UK_KHACHHANG UNIQUE (EMAIL, SDT)
)
GO

CREATE TABLE ACCOUNT (
	Id INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	TenDN VARCHAR(255) NOT NULL,
	MatKhau NVARCHAR(10) NOT NULL,
	HoTen NVARCHAR(max) NOT NULL,
	PhanQuyen NVARCHAR(10) NOT NULL,
	CONSTRAINT UK_ACCOUNT UNIQUE (TenDN)
)
GO

CREATE TABLE PHIEUBAOHANH (
	Id INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	ThoiGianBH NVARCHAR(max) NOT NULL
) 
GO

CREATE TABLE NHANVIEN (
	Id INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
	DangNhap_Id INT NOT NULL,
	TenNV NVARCHAR(max) NOT NULL,
	GioiTinh NVARCHAR(5) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	NgaySinh DATETIME NOT NULL,
	SoDienThoai VARCHAR(10) NOT NULL,
	TongLuong DECIMAL NOT NULL,
	CONSTRAINT UK_NHANVIEN UNIQUE (Email, SoDienThoai)
)
GO

ALTER TABLE [SANPHAM] ADD CONSTRAINT [FK_LOAISANPHAM_SANPHAM] FOREIGN KEY ([LoaiSP_Id]) REFERENCES [LOAISANPHAM] ([Id]);

ALTER TABLE [SANPHAM] ADD CONSTRAINT [FK_THUONGHIEU_SANPHAM] FOREIGN KEY ([ThuongHieu_Id]) REFERENCES [THUONGHIEU] ([Id]);

ALTER TABLE [CHITIETDONHANG] ADD CONSTRAINT [FK_SANPHAM_CHITIETDONHANG] FOREIGN KEY ([SP_Id]) REFERENCES [SANPHAM] ([Id]);

ALTER TABLE [CHITIETDONNHAP] ADD CONSTRAINT [FK_SANPHAM_CHITIETDONNHAP] FOREIGN KEY ([SP_Id]) REFERENCES [SANPHAM] ([Id]);

ALTER TABLE [CHITIETDONHANG] ADD CONSTRAINT [FK_DONHANG_CHITIETDONHANG] FOREIGN KEY ([DH_Id]) REFERENCES [DONHANG] ([Id]);

ALTER TABLE [DONHANG] ADD CONSTRAINT [FK_NHANVIEN_DONHANG] FOREIGN KEY ([NV_Id]) REFERENCES [NHANVIEN] ([Id]);

ALTER TABLE [DONNHAP] ADD CONSTRAINT [FK_NHANVIEN_DONNHAP] FOREIGN KEY ([NV_Id]) REFERENCES [NHANVIEN] ([Id]);

ALTER TABLE [CHITIETDONNHAP] ADD CONSTRAINT [FK_DONNHAP_CHITIETDONNHAP] FOREIGN KEY ([DN_Id]) REFERENCES [DONNHAP] ([Id]);

ALTER TABLE [CHITIETDONHANG] ADD CONSTRAINT [FK_PHIEUBAOHANH_CHITIETDONHANG] FOREIGN KEY ([BH_Id]) REFERENCES [PHIEUBAOHANH] ([Id]);

ALTER TABLE [KHACHHANG] ADD CONSTRAINT [FK_ACCOUNT_KHACHHANG] FOREIGN KEY ([DangNhap_Id]) REFERENCES [ACCOUNT] ([Id]);

ALTER TABLE [NHANVIEN] ADD CONSTRAINT [FK_ACCOUNT_NHANVIEN] FOREIGN KEY ([DangNhap_Id]) REFERENCES [ACCOUNT] ([Id]);

ALTER TABLE [DONHANG] ADD CONSTRAINT [FK_KHACHHANG_DONHANG] FOREIGN KEY ([KH_Id]) REFERENCES [KHACHHANG] ([Id]);

ALTER TABLE [CHITIETDONNHAP] ADD CONSTRAINT [FK_THUONGHIEU_CHITIETDONNHAP] FOREIGN KEY ([ThuongHieu_Id]) REFERENCES [THUONGHIEU] ([Id]);

ALTER TABLE [CHITIETDONHANG] ADD CONSTRAINT [FK_THUONGHIEU_CHITIETDONHANG] FOREIGN KEY ([ThuongHieu_Id]) REFERENCES [THUONGHIEU] ([Id]);

ALTER TABLE [CHITIETDONNHAP] ADD CONSTRAINT [FK_LOAISANPHAM_CHITIETDONNHAP] FOREIGN KEY ([LoaiSP_Id]) REFERENCES [LOAISANPHAM] ([Id]);

-- INSERT --

INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Bàn uống nước 1', 1, 1, 1500000, 2000000, 10, 'https://noithatluongson.vn/wp-content/uploads/2019/06/b1.png', N'Bàn trà, bàn sofa 2 ngăn kéo đen BT21 huyền bí', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Bàn uống nước 3', 1, 2, 2100000, 2600000, 9, 'https://hoaphatmiennam.vn/wp-content/uploads/2018/04/ban-tra-cao-cap-kieu-nhat.jpg', N'Bàn uống nước hình vuông chất liệu là gỗ công nghiệp melamine cao cấp', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Bàn uống nước 4', 1, 2, 1300000, 1800000, 8, 'https://hoaphatmiennam.vn/wp-content/uploads/2018/04/ban-tra-chan-sat-hinh-tron.jpg', N'Bàn uống nước chân sắt chữ thập tạo độ chắc chắn', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Bàn uống nước 5', 1, 2, 1390000, 1890000, 7, 'https://hoaphatmiennam.vn/wp-content/uploads/2018/04/ban-tra-F3177A.jpg', N'Bàn uống nước có hộc để đồ bên dưới', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Bàn uống nước 6', 1, 2, 2500000, 3000000, 11, 'https://hoaphatmiennam.vn/wp-content/uploads/2018/04/ban-tra-go-co-hoc-de-do.jpg', N'Vẫn là mẫu bàn uống nước có hộc nhưng theo một phong cách thiết kế mới', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Giường ngủ 1', 2, 3, 3500000, 4000000, 12, 'http://pula.vn/storage/images/medium/2021/11/19/giuong-pula-pb01.webp', N'Giường ngủ đẹp viền vàng Pula PB03', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Bàn ăn 1', 3, 4, 2000000, 2500000, 8, 'https://bizweb.dktcdn.net/100/153/764/products/ban-an-mat-da-161s.jpg?v=1591234722027', N'Bàn Ăn Cao Cấp 161S', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Bồn rửa tay 1', 4, 5, 5000000, 5500000, 13, 'http://api.vibavietnam.vn/storage/images/originals/b5a146c9a842917daadfa4feaf66cc95.webp', N'Bộ Tủ Chậu Phòng Tắm Thông Minh - VIBA CD07', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Giường tầng trẻ em ', 2, 5, 4300000, 4800000, 12, 'https://azfuni.com/wp-content/uploads/2022/04/giuong-tang-cho-be-gai-2-768x768.jpg', N'Giường tầng kết hợp cầu trượt cho bé gái dễ thương GT06', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Văn phòng', 5, 6, 1500000, 2000000, 12, 'https://noithatkienhung.vn/wp-content/uploads/2023/04/cum-ban-lam-viec-6-nguoi-blv-34-768x768.jpg', N'Cụm bàn làm việc 6 người KH29', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Cầu thang', 6, 7, 5500000, 6000000, 14, 'https://noithatmanhhe.vn/media/27462/trang-tri-tieu-canh-kho-gam-cau-thang.jpg', N'Cầu Thang Vuông Và Kính Inox 4m, 5m Cho Nhà Ống Đẹp Và Hiện Đại Hơn', 1, 0);
INSERT INTO SANPHAM (TenSP, LoaiSP_Id, ThuongHieu_Id, GiaNhap, GiaBan, SoLuong, HinhAnh, MoTa, IsActive, IsDeleted) VALUES (N'Trang trí', 7, 7, 3500000, 4000000, 15, 'https://anandecor.vn/wp-content/uploads/2020/10/Layer-88.png', N'Đèn chùm thả 3 tầng viền cafe mỏng T 7491 VCF', 1, 0);

INSERT INTO LOAISANPHAM (TenLoaiSP, SoLuong, MoTa) VALUES (N'Bàn uống nước', 45, N'Bàn uống nước với nhiều mẫu mã đẹp, được thiết kế độc đáo, tỉ mỉ và được làm từ rất nhiều chất liệu khác nhau giúp người dùng có thêm nhiều lựa chọn.');
INSERT INTO LOAISANPHAM (TenLoaiSP, SoLuong, MoTa) VALUES (N'Giường ngủ', 24, N'Giường ngủ với nhiều mẫu mã đẹp phù hợp cho tất cả các hộ gia đình và đặc biệt có thiết kế riêng giành cho trẻ em.');
INSERT INTO LOAISANPHAM (TenLoaiSP, SoLuong, MoTa) VALUES (N'Bàn ăn', 8, N'Bàn ăn cao cấp với nhiều thiết kế sang trọng, phù hợp với nhu cầu sử dụng của các hộ gia đình.');
INSERT INTO LOAISANPHAM (TenLoaiSP, SoLuong, MoTa) VALUES (N'Bồn rửa tay', 13, N'Bồn rửa tay được thiết kế phù hợp với nhu cầu của rất nhiều người sử dụng và kết hợp với một số thông minh.');
INSERT INTO LOAISANPHAM (TenLoaiSP, SoLuong, MoTa) VALUES (N'Văn phòng', 12, N'Được thiết kế để giúp văn phòng của bạn trở nên tối giản nhưng vẫn toát lên được sự tinh tế và một phần tính cách của bạn.');
INSERT INTO LOAISANPHAM (TenLoaiSP, SoLuong, MoTa) VALUES (N'Cầu thang', 14, N'Cầu thang được thiết kế đơn gian, nhưng được làm từ những chất liệu chắc chắn đảm bảo sự an toàn và đẹp.');
INSERT INTO LOAISANPHAM (TenLoaiSP, SoLuong, MoTa) VALUES (N'Trang trí', 15, N'Trang trí đang dần trở nên thiết yếu đối với ngôi nhà của chúng ta, chính vì thế những đồ vật này giúp cho ngôi nhà của chúng ta trở nên sang trọng hơn.');

INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES (N'Nội Thất Lương Sơn', N'Lương Sơn là một thương hiệu đã có tên tuổi trên thị trường đồ nội thất tại Việt Nam.');
INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES (N'Nội Thất Hòa Phát', N'Hòa Phát là một tập đoàn tư nhân tại Việt Nam. Khởi đầu từ công ty buôn bán máy móc xây dựng, hiện tại Hòa Phát đã trở thành một tập đoàn kinh doanh đa ngành nghề.');
INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES (N'Nội Thất Pula', N'Pula là một thương hiệu nước ngoài với nhiều dự án kết hợp với một số quán cà phê và các trung tập dạy học.');
INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES (N'Nội Thất Bizweb', N'Bizweb là một thương hiệu nước ngoài mới được du nhập vào thị trường Việt Nam dạo gần đầy và thu hút rất nhiều khách hàng.'); 
INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES (N'Nội Thất Viba', N'Công ty cổ phần Viba Việt Nam là một trong những đơn vị hàng đầu tại Việt Nam chuyên sản xuất và cung cấp các sản phẩm trang trí nội thất decor.'); 
INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES (N'Nội Thất Kiến Hưng', N'Nội Thất Kiến Hưng là một doanh nghiệp lâu năm trong lĩnh vực nội thất, chuyên cung cấp nội thất văn phòng, trường học…'); 
INSERT INTO ThuongHieu (TenThuongHieu, MoTa) VALUES (N'Nội Thất Mạnh Hệ', N'Nội thất Mạnh Hệ là 1 công ty chuyên thiết kế nội thất & thi công nội thất uy tín tại TP.HCM & HN. Với nhà xưởng rộng 1500m2 & nhiều trang thiết bị hiện đại ...'); 

INSERT INTO PHIEUBAOHANH (ThoiGianBH) VALUES (N'6 tháng');
INSERT INTO PHIEUBAOHANH (ThoiGianBH) VALUES (N'12 tháng');
INSERT INTO PHIEUBAOHANH (ThoiGianBH) VALUES (N'18 tháng');
INSERT INTO PHIEUBAOHANH (ThoiGianBH) VALUES (N'24 tháng');

INSERT INTO DONHANG (NV_Id, KH_Id, NgayBan, TongTien) VALUES (3, 3, '2023-11-21', 20000000);
INSERT INTO DONHANG (NV_Id, KH_Id, NgayBan, TongTien) VALUES (4, 2, '2023-11-22', 30000000);
INSERT INTO DONHANG (NV_Id, KH_Id, NgayBan, TongTien) VALUES (4, 4, '2023-11-24', 25000000);
INSERT INTO DONHANG (NV_Id, KH_Id, NgayBan, TongTien) VALUES (3, 1, '2023-11-27', 10000000);

INSERT INTO CHITIETDONHANG (DH_Id, SP_Id, ThuongHieu_Id, BH_Id, SoLuong, DiaChiNhan) VALUES (17, 13, 1, 1, 2, N'105 - D6, ngõ 4B Đặng Văn Ngữ');
INSERT INTO CHITIETDONHANG (DH_Id, SP_Id, ThuongHieu_Id, BH_Id, SoLuong, DiaChiNhan) VALUES (18, 15, 2, 2, 3, N'70 Tô Hiến Thành');
INSERT INTO CHITIETDONHANG (DH_Id, SP_Id, ThuongHieu_Id, BH_Id, SoLuong, DiaChiNhan) VALUES (19, 20, 5, 3, 4, N'342 Cầu Giấy');
INSERT INTO CHITIETDONHANG (DH_Id, SP_Id, ThuongHieu_Id, BH_Id, SoLuong, DiaChiNhan) VALUES (20, 19, 4, 4, 3, N'46 Đông Các');

INSERT INTO DONNHAP (NV_Id, NgayNhap) VALUES (3, '2023-8-20');
INSERT INTO DONNHAP (NV_Id, NgayNhap) VALUES (4, '2023-9-20');
INSERT INTO DONNHAP (NV_Id, NgayNhap) VALUES (3, '2023-10-21');
INSERT INTO DONNHAP (NV_Id, NgayNhap) VALUES (4, '2023-11-19');

INSERT INTO CHITIETDONNHAP (DN_Id, SP_Id, TenSP, ThuongHieu_Id, LoaiSP_Id, SoLuongNhap, DonGia, TienHang) VALUES (13, 13, N'Bàn uống nước 1', 1, 1, 10, 1500000, 15000000);
INSERT INTO CHITIETDONNHAP (DN_Id, SP_Id, TenSP, ThuongHieu_Id, LoaiSP_Id, SoLuongNhap, DonGia, TienHang) VALUES (14, 14, N'Bàn uống nước 3', 2, 1, 10, 2100000, 21000000);
INSERT INTO CHITIETDONNHAP (DN_Id, SP_Id, TenSP, ThuongHieu_Id, LoaiSP_Id, SoLuongNhap, DonGia, TienHang) VALUES (15, 18, N'Giường ngủ 1', 3, 2, 10, 3500000, 35000000);
INSERT INTO CHITIETDONNHAP (DN_Id, SP_Id, TenSP, ThuongHieu_Id, LoaiSP_Id, SoLuongNhap, DonGia, TienHang) VALUES (16, 19, N'Bàn ăn 1', 4, 3, 10, 2000000, 20000000);

INSERT INTO ACCOUNT (TenDN, MatKhau, HoTen, PhanQuyen) VALUES (N'Admin', N'admin123', N'',N'Admin');
INSERT INTO ACCOUNT (TenDN, MatKhau, HoTen, PhanQuyen) VALUES (N'chitung', N'tung123', N'Nguyễn Chí Tùng', N'Khách hàng');
INSERT INTO ACCOUNT (TenDN, MatKhau, HoTen, PhanQuyen) VALUES (N'haidang', N'dang123', N'Nguyễn Hải Đăng', N'Khách hàng');
INSERT INTO ACCOUNT (TenDN, MatKhau, HoTen, PhanQuyen) VALUES (N'huuluc', N'luc123', N'Nguyễn Hữu Lực', N'Nhân viên');
INSERT INTO ACCOUNT (TenDN, MatKhau, HoTen, PhanQuyen) VALUES (N'thanhthai', N'thai123', N'Phạm Thành Thái', N'Nhân viên');
INSERT INTO ACCOUNT (TenDN, MatKhau, HoTen, PhanQuyen) VALUES (N'trongtinh', N'tinh123', N'Lê Trọng Tĩnh', N'Khách hàng');
INSERT INTO ACCOUNT (TenDN, MatKhau, HoTen, PhanQuyen) VALUES (N'ductrong', N'trong123', N'Nguyễn Đức Trọng', N'Khách hàng');

INSERT INTO KHACHHANG (DangNhap_Id, TenKH, DIACHI, EMAIL, SDT) VALUES (2, N'Nguyễn Chí Tùng', N'Từ Sơn, Bắc Ninh',N'chitung@gmail.com',N'0331262215');
INSERT INTO KHACHHANG (DangNhap_Id, TenKH, DIACHI, EMAIL, SDT) VALUES (3, N'Nguyễn Hải Đăng', N'Hoằng Hóa, Thanh Hóa',N'haidang@gmail.com',N'0331262216');
INSERT INTO KHACHHANG (DangNhap_Id, TenKH, DIACHI, EMAIL, SDT) VALUES (6, N'Lê Trọng Tĩnh', N'Sơn La', N'trongtinh@gmail.com',N'0331262217');
INSERT INTO KHACHHANG (DangNhap_Id, TenKH, DIACHI, EMAIL, SDT) VALUES (7, N'Nguyễn Đức Trọng', N'Bắc Giang', N'ductrong@gmail.com',N'0331262218');

INSERT INTO NHANVIEN (DangNhap_Id, TenNV, GioiTinh, Email, NgaySinh, SoDienThoai, TongLuong) VALUES (4, N'Nguyễn Hữu Lực', N'Nam', N'huuluc@gmail.com', '2002-09-25', N'0337216220', 30000000);
INSERT INTO NHANVIEN (DangNhap_Id, TenNV, GioiTinh, Email, NgaySinh, SoDienThoai, TongLuong) VALUES (5, N'Phạm Thành Thái', N'Nam', N'thanhthai@gmail.com', '2002-10-27', N'0337216221', 30000000);
