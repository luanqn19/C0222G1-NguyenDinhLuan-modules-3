create database quanlykho;
use quanlykho;

CREATE TABLE vat_tu (
    ma_vat_tu VARCHAR(5),
    ten_vat_tu VARCHAR(50),
    PRIMARY KEY (ma_vat_tu)
);

CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap VARCHAR(5),
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50),
    so_dien_thoai VARCHAR(11),
    PRIMARY KEY (ma_nha_cung_cap)
);

CREATE TABLE don_dat_hang (
    so_don_dat_hang VARCHAR(5),
    ngay_dat_hang DATE,
    PRIMARY KEY (so_don_dat_hang)
);

CREATE TABLE chi_tiet_don_dat_hang (
    ma_dat VARCHAR(5),
    ma_vat_tu VARCHAR(5),
    ma_nha_cung_cap VARCHAR(5),
    so_luong_dat INT,
    PRIMARY KEY (ma_dat , ma_vat_tu , ma_nha_cung_cap)
);

CREATE TABLE phieu_xuat (
    so_phieu_xuat VARCHAR(5),
    ngay_xuat DATE,
    PRIMARY KEY (so_phieu_xuat)
);

CREATE TABLE chi_tiet_phieu_xuat (
    phieu_xuat VARCHAR(5),
    ma_vat_tu VARCHAR(5),
    don_gia_xuat DOUBLE,
    so_luong_xuat INT,
    PRIMARY KEY (phieu_xuat , ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_phieu_nhap VARCHAR(5),
    ngay_nhap DATE,
    PRIMARY KEY (so_phieu_nhap)
);

CREATE TABLE chi_tiet_phieu_nhap (
    phieu_nhap VARCHAR(5),
    ma_vat_tu VARCHAR(5),
    don_gia_nhap DOUBLE,
    so_luong_nhap INT,
    PRIMARY KEY (phieu_nhap , ma_vat_tu)
);
-- them khoa phu chi_tiet_don_dat_hang
alter table chi_tiet_don_dat_hang
add CONSTRAINT fk_ma_dat FOREIGN KEY(ma_dat) REFERENCES don_dat_hang(so_don_dat_hang),
add CONSTRAINT fk_ma_vat_tu FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
add CONSTRAINT fk_ma_nha_cung_cap FOREIGN KEY(ma_nha_cung_cap) REFERENCES nha_cung_cap(ma_nha_cung_cap);

-- them khoa phu chi_tiet_phieu_xuat
alter table chi_tiet_phieu_xuat
add CONSTRAINT fk_phieu_xuat FOREIGN KEY(phieu_xuat) REFERENCES phieu_xuat(so_phieu_xuat),
add CONSTRAINT fk_ma_vat_tu_phieu_xuat FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu);

-- them khoa phu chi_tiet_phieu_nhap
alter table chi_tiet_phieu_nhap
add CONSTRAINT fk_phieu_nhap FOREIGN KEY(phieu_nhap) REFERENCES phieu_nhap(so_phieu_nhap),
add CONSTRAINT fk_ma_vat_tu_phieu_nhap FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu);

-- them du lieu cho cac table
insert into vat_tu values ("VT001","Vat tu 1");
insert into vat_tu values ("VT002","Vat tu 2");

insert into nha_cung_cap values ("NCC01","NCC-01","Dia chi 1","0900000");
insert into nha_cung_cap values ("NCC02","NCC-02","Dia chi 2","0900001");

insert into don_dat_hang values ("DDH01",'2022-05-10');
insert into don_dat_hang values ("DDH02",'2022-05-08');

insert into chi_tiet_don_dat_hang values ("DDH01","VT001","NCC01",100);
insert into chi_tiet_don_dat_hang values ("DDH02","VT002","NCC02",200);

insert into phieu_xuat values ("PXK01",'2022-05-12');
insert into phieu_xuat values ("PXK02",'2022-05-10');

insert into chi_tiet_phieu_xuat values ("PXK01","VT001",100,50);
insert into chi_tiet_phieu_xuat values ("PXK02","VT002",200,100);

insert into phieu_nhap values ("PNK01",'2022-05-11');
insert into phieu_nhap values ("PNK02",'2022-05-09');

insert into chi_tiet_phieu_nhap values ("PNK01","VT001",30,100);
insert into chi_tiet_phieu_nhap values ("PNK02","VT002",50,200);
