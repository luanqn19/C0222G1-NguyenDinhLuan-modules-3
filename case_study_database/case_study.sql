create database furama_database;
use furama_database;
-- DROP database furama_database;
-- Task 1
CREATE TABLE vi_tri (
    ma_vi_tri INT,
    ten_vi_tri VARCHAR(45),
    PRIMARY KEY (ma_vi_tri)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT,
    ten_trinh_do VARCHAR(45),
    PRIMARY KEY (ma_trinh_do)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT,
    ten_bo_phan VARCHAR(45),
    PRIMARY KEY (ma_bo_phan)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    ma_trinh_do INT,
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    ma_bo_phan INT,
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach),
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh ENUM('0', '1'),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    ma_kieu_thue INT,
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    ma_loai_dich_vu INT,
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    ma_khach_hang INT,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    ma_dich_vu INT,
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE chi_tiet_hop_dong (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem),
    so_luong INT
);

-- Task 2
SELECT 
    *
FROM
    nhan_vien
WHERE
    ((ho_ten LIKE 'H%') OR (ho_ten LIKE 'T%'))
        AND (LENGTH(ho_ten) <= 15);

-- Task 3
SELECT 
    *
FROM
    khach_hang
WHERE
    ((dia_chi LIKE '%Da Nang')
        OR (dia_chi LIKE '%Quang Tri'))
        AND (((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) >= 18
        AND ((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) <= 50);
        
-- Task 4
SELECT 
    kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_hop_dong) AS so_luong_dat
FROM hop_dong AS hd
   INNER JOIN khach_hang AS kh ON hd.ma_khach_hang = kh.ma_khach_hang AND kh.ma_loai_khach = 1
GROUP BY ma_khach_hang
ORDER BY so_luong_dat ASC;

-- Task 5
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    dv.chi_phi_thue + (cthd.so_luong * dvdk.gia) AS tong_tien
FROM
    (((((hop_dong AS hd
    LEFT JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
    LEFT JOIN khach_hang AS kh ON (hd.ma_khach_hang = kh.ma_khach_hang))
    LEFT JOIN dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu)
    LEFT JOIN loai_khach AS lk ON (hd.ma_khach_hang = kh.ma_khach_hang
        AND kh.ma_loai_khach = lk.ma_loai_khach))
    LEFT JOIN dich_vu_di_kem AS dvdk ON (hd.ma_hop_dong = cthd.ma_hop_dong
        AND cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem));

-- Task 6
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    ((hop_dong AS hd
    INNER JOIN dich_vu AS dv ON (hd.ma_dich_vu = dv.ma_dich_vu AND YEAR(hd.ngay_lam_hop_dong) = 2021))
    INNER JOIN loai_dich_vu AS ldv ON hd.ma_dich_vu = dv.ma_dich_vu
        AND dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu)
WHERE MONTH(hd.ngay_ket_thuc) NOT IN (1 , 2, 3)
GROUP BY ma_dich_vu;


-- Task 7
SELECT 
	hd.ma_hop_dong,
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    dv.so_nguoi_toi_da,
    ldv.ten_loai_dich_vu
FROM
    ((hop_dong AS hd
    LEFT JOIN dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu AND YEAR(hd.ngay_lam_hop_dong) = 2020)
    LEFT JOIN loai_dich_vu AS ldv ON hd.ma_dich_vu = dv.ma_dich_vu
        AND dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu)
WHERE hd.ma_dich_vu NOT IN (
    SELECT hd.ma_dich_vu
	FROM hop_dong AS hd
	WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
    );

-- Task 8
-- Cach 1
SELECT DISTINCT ho_ten FROM khach_hang;
-- Cach 2
SELECT ho_ten FROM khach_hang GROUP BY ho_ten;
-- Cach 3
SELECT ho_ten FROM khach_hang
UNION
SELECT ho_ten FROM khach_hang;

-- Task 9
SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS Thang,
    COUNT(MONTH(hd.ngay_lam_hop_dong)) AS So_Lan_Dat
FROM
    (hop_dong AS hd
    INNER JOIN dich_vu AS dv ON (hd.ma_dich_vu = dv.ma_dich_vu AND YEAR(hd.ngay_lam_hop_dong) = 2021))
GROUP BY Thang 
ORDER BY Thang ASC;

-- Tast 10
SELECT
	hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    SUM(cthd.so_luong) as so_luong_dich_vu_di_kem
FROM 
	hop_dong AS hd
LEFT JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong
GROUP BY ma_hop_dong;

-- Task 11
SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem
FROM (((hop_dong AS hd
INNER JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
INNER JOIN dich_vu_di_kem AS dvdk ON cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
INNER JOIN khach_hang as kh ON hd.ma_khach_hang = kh.ma_khach_hang AND kh.ma_loai_khach = 1)
WHERE kh.dia_chi LIKE "%Vinh" OR "%Quang Ngai";

-- Task 12
SELECT
	hd.ma_hop_dong,
    nv.ho_ten as ho_ten_nhan_vien,
    c.ho_ten as ho_ten_khach_hang,
    c.so_dien_thoai as sdt_khach_hang,
    hd.ma_dich_vu,
    dv.ten_dich_vu,
    SUM(cthd.so_luong) as so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM 
	((((hop_dong AS hd
LEFT JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
INNER JOIN nhan_vien AS nv ON hd.ma_nhan_vien = nv.ma_nhan_vien)
INNER JOIN khach_hang as c ON hd.ma_khach_hang = c.ma_khach_hang)
INNER JOIN dich_vu as dv ON hd.ma_dich_vu = dv.ma_dich_vu)
WHERE (YEAR(ngay_lam_hop_dong) = 2020 AND QUARTER(ngay_lam_hop_dong) = 4) 
AND ngay_lam_hop_dong NOT IN(
SELECT
	hd.ngay_lam_hop_dong
FROM 
	((((hop_dong AS hd
LEFT JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
INNER JOIN nhan_vien AS nv ON hd.ma_nhan_vien = nv.ma_nhan_vien)
INNER JOIN khach_hang as c ON hd.ma_khach_hang = c.ma_khach_hang)
INNER JOIN dich_vu as dv ON hd.ma_dich_vu = dv.ma_dich_vu)
WHERE (YEAR(ngay_lam_hop_dong) = 2021 AND (QUARTER(ngay_lam_hop_dong) IN (1,2)))
)
GROUP BY ma_hop_dong;

-- Task 13
SELECT
	dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    dvdk.don_vi,
    dvdk.trang_thai,
    SUM(cthd.so_luong) as tong_so_luong_dich_vu_di_kem
FROM 
	((hop_dong AS hd
INNER JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
INNER JOIN dich_vu_di_kem AS dvdk ON cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING SUM(cthd.so_luong) = (SELECT MAX(cthd.so_luong) FROM chi_tiet_hop_dong AS cthd);

-- Task 14
SELECT
	dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    dvdk.don_vi,
    dvdk.trang_thai,
    SUM(cthd.so_luong) as tong_so_luong_dich_vu_di_kem
FROM 
	((hop_dong AS hd
INNER JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
INNER JOIN dich_vu_di_kem AS dvdk ON cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING SUM(cthd.so_luong) = (SELECT MIN(cthd.so_luong) FROM chi_tiet_hop_dong AS cthd);

