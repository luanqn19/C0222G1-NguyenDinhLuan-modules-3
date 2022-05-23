create database furama_database;
use furama_database;
DROP database furama_database;
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
        REFERENCES vi_tri (ma_vi_tri)
        ON DELETE CASCADE,
    ma_trinh_do INT,
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do)
        ON DELETE CASCADE,
    ma_bo_phan INT,
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
        ON DELETE CASCADE
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT,
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
        ON DELETE CASCADE,
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
        REFERENCES kieu_thue (ma_kieu_thue)
        ON DELETE CASCADE,
    ma_loai_dich_vu INT,
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
        ON DELETE CASCADE
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien)
        ON DELETE CASCADE,
    ma_khach_hang INT,
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang)
        ON DELETE CASCADE,
    ma_dich_vu INT,
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
        ON DELETE CASCADE
);

CREATE TABLE chi_tiet_hop_dong (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    ma_hop_dong INT,
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong)
        ON DELETE CASCADE,
    ma_dich_vu_di_kem INT,
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
        ON DELETE CASCADE,
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
    ifnull(dv.chi_phi_thue + (cthd.so_luong * dvdk.gia), dv.chi_phi_thue) AS tong_tien
FROM
    (((((hop_dong AS hd
    LEFT JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
    RIGHT JOIN khach_hang AS kh ON (hd.ma_khach_hang = kh.ma_khach_hang))
    LEFT JOIN dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu)
    LEFT JOIN loai_khach AS lk ON (kh.ma_loai_khach = lk.ma_loai_khach))
    LEFT JOIN dich_vu_di_kem AS dvdk ON (cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem));

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
HAVING SUM(cthd.so_luong) = (SELECT MAX(so_luong_srv) FROM (SELECT sum(cthd.so_luong) as so_luong_srv FROM chi_tiet_hop_dong AS cthd GROUP BY cthd.ma_dich_vu_di_kem) AS TEMP);

-- Task 14
SELECT 
    dvdk.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    dvdk.gia,
    dvdk.don_vi,
    dvdk.trang_thai,
    SUM(cthd.so_luong) AS tong_so_luong_dich_vu_di_kem
FROM
    ((hop_dong AS hd
    INNER JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
    INNER JOIN dich_vu_di_kem AS dvdk ON cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING SUM(cthd.so_luong) = (SELECT 
        MIN(so_luong_srv)
    FROM
        (SELECT 
            SUM(cthd.so_luong) AS so_luong_srv
        FROM
            chi_tiet_hop_dong AS cthd
        GROUP BY cthd.ma_dich_vu_di_kem) AS TEMP);

-- Task 15
select 
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.dia_chi,
    nv.so_dien_thoai,
    COUNT(nv.ma_nhan_vien) as so_luong_hop_dong_duoc_lap
from hop_dong as hd
inner join nhan_vien as nv on hd.ma_nhan_vien = nv.ma_nhan_vien
inner join bo_phan as bp on nv.ma_bo_phan = bp.ma_bo_phan
inner join trinh_do as td on nv.ma_trinh_do = td.ma_trinh_do
group by nv.ma_nhan_vien
having so_luong_hop_dong_duoc_lap <= 3;

-- Task 16
select 
	nv.ma_nhan_vien,
    nv.ho_ten
from nhan_vien as nv
where nv.ma_nhan_vien NOT IN (
select nv.ma_nhan_vien
from hop_dong as hd
inner join nhan_vien as nv on hd.ma_nhan_vien = nv.ma_nhan_vien
);

-- Task 17
UPDATE khach_hang as kh
SET kh.ma_loai_khach = 1
WHERE kh.ma_khach_hang IN (SELECT ma_khach_hang FROM (SELECT 
    kh.ma_khach_hang
FROM
    hop_dong AS hd
    LEFT JOIN chi_tiet_hop_dong AS cthd ON (hd.ma_hop_dong = cthd.ma_hop_dong)
    LEFT JOIN khach_hang AS kh ON (hd.ma_khach_hang = kh.ma_khach_hang AND kh.ma_loai_khach = 2)
    LEFT JOIN dich_vu AS dv ON (hd.ma_dich_vu = dv.ma_dich_vu)
    LEFT JOIN dich_vu_di_kem AS dvdk ON (cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021 AND dv.chi_phi_thue + (cthd.so_luong * dvdk.gia) > 10000000) as temp);

-- Task 18
DELETE FROM khach_hang as kh
WHERE kh.ma_khach_hang IN (SELECT temp_ma_khach_hang.ma_khach_hang FROM(
SELECT kh.ma_khach_hang
FROM hop_dong as hd
	LEFT JOIN chi_tiet_hop_dong AS cthd ON (hd.ma_hop_dong = cthd.ma_hop_dong)
    LEFT JOIN khach_hang AS kh ON (hd.ma_khach_hang = kh.ma_khach_hang)
    LEFT JOIN dich_vu_di_kem AS dvdk ON (cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
WHERE YEAR(ngay_lam_hop_dong) = 2020
GROUP BY ma_khach_hang) as temp_ma_khach_hang);

-- Task 19
UPDATE dich_vu_di_kem AS dvdk 
SET 
    dvdk.gia = dvdk.gia * 2
WHERE
    dvdk.ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            (SELECT 
                dvdk.ma_dich_vu_di_kem
            FROM
                ((hop_dong AS hd
            INNER JOIN chi_tiet_hop_dong AS cthd ON hd.ma_hop_dong = cthd.ma_hop_dong)
            INNER JOIN dich_vu_di_kem AS dvdk ON cthd.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)
            GROUP BY dvdk.ma_dich_vu_di_kem
            HAVING dvdk.ma_dich_vu_di_kem IN (SELECT 
                    temp_dich_vu.ma_dich_vu_di_kem
                FROM
                    (SELECT 
                    cthd.ma_dich_vu_di_kem, SUM(cthd.so_luong) AS so_luong_srv
                FROM
                    chi_tiet_hop_dong AS cthd
                GROUP BY cthd.ma_dich_vu_di_kem
                HAVING SUM(cthd.so_luong) > 10) AS temp_dich_vu)) AS id_dich_vu);

-- Task 20
SELECT nv.ma_nhan_vien as id,
	   nv.ho_ten,
       nv.email,
       nv.so_dien_thoai,
       nv.ngay_sinh,
       nv.dia_chi
FROM nhan_vien as nv
UNION ALL
SELECT kh.ma_khach_hang,
       kh.ho_ten,
       kh.email,
       kh.so_dien_thoai,
       kh.ngay_sinh,
       kh.dia_chi
FROM khach_hang as kh;

-- Task 21
CREATE VIEW v_nhan_vien as
select 
    nv.ma_nhan_vien,
    nv.ho_ten,
    nv.dia_chi,
    nv.so_dien_thoai
from hop_dong as hd
inner join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
inner join nhan_vien as nv on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi LIKE "%Da Nang%" AND year(hd.ngay_lam_hop_dong) = 2021;

SELECT * FROM v_nhan_vien;

-- Task 22
UPDATE v_nhan_vien as views
SET views.dia_chi = "22 Yen Bai, Lien Chieu, Da Nang";

-- Task 23
DELIMITER $$
CREATE PROCEDURE sp_xoa_khach_hang (IN ma_kh INT)
BEGIN
	DELETE FROM khach_hang AS kh
    WHERE kh.ma_khach_hang = ma_kh;
END$$
DELIMITER ;

-- Task 24

-- name_table VARCHAR(50), id_text VARCHAR(50) only store procedure not support for function or trigger
-- 	SET @table := name_table;
--     SET @id := id_text;
--     SET @sql_text := CONCAT('SELECT ',@table,'MAX(',@table,'.',@id,') INTO _id FROM ',@table);
--     PREPARE stmt from @sql_text;
--     EXECUTE stmt;

DELIMITER $$
CREATE FUNCTION get_last_id (name_table INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE _id INT;
    CASE name_table
    WHEN 1 THEN SELECT MAX(chi_tiet_hop_dong.ma_hop_dong_chi_tiet) INTO _id FROM chi_tiet_hop_dong;
    WHEN 2 THEN SELECT MAX(hop_dong.ma_hop_dong) INTO _id FROM hop_dong;
    WHEN 3 THEN SELECT MAX(khach_hang.ma_khach_hang) INTO _id FROM khach_hang;
    WHEN 4 THEN SELECT MAX(nhan_vien.ma_nhan_vien) INTO _id FROM nhan_vien;
	END CASE;
    RETURN _id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_them_moi_hop_dong (
	IN ngay_lam_hd DATETIME,
    IN ngay_ket_thuc_hd DATETIME,
    IN tien_dat_coc_hd DOUBLE,
    IN ma_nhan_vien_hd INT,
    IN ma_khach_hang_hd INT,
    IN ma_dich_vu_hd INT
)
BEGIN
	IF (ma_nhan_vien_hd > get_last_id(4) 
    OR ma_nhan_vien_hd < 0 
    OR ISNULL(ma_nhan_vien_hd) = 1) 
    THEN
		SET ma_nhan_vien_hd = ROUND(RAND() * (get_last_id(4) - 1) + 1);
	ELSEIF (ma_khach_hang_hd > get_last_id(3) 
    OR ma_khach_hang_hd < 0 
    OR ISNULL(ma_khach_hang_hd) = 1) 
    THEN
		SET ma_khach_hang_hd = ROUND(RAND() * (get_last_id(3) - 1) + 1);
    END IF;
    SET FOREIGN_KEY_CHECKS=0;
    INSERT INTO hop_dong(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
    VALUES ((get_last_id(2) + 1), ngay_lam_hd, ngay_ket_thuc_hd, tien_dat_coc_hd, ma_nhan_vien_hd, ma_khach_hang_hd, ma_dich_vu_hd);
    SET FOREIGN_KEY_CHECKS=1;
END $$
DELIMITER ;

SHOW TRIGGERS;

CREATE TABLE hd_log(
	id INT PRIMARY KEY AUTO_INCREMENT,
    ma_hd INT,
    ngay_tao DATE
);

DROP TRIGGER IF EXISTS add_new_log;

DELIMITER $$
CREATE TRIGGER add_new_log
AFTER INSERT 
ON hop_dong FOR EACH ROW
BEGIN
	INSERT INTO hd_log
    SET ma_hd = new.ma_hop_dong,
    ngay_tao = NOW();
END$$
DELIMITER ;

call sp_them_moi_hop_dong("2021-02-10","2021-04-30",1000,20,20,20);