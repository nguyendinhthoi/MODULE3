create database hoa_don;

use hoa_don;

create table nha_cung_cap(
ma_nha_cung_cap int auto_increment,
ten_nha_cung_cap varchar(50),
dia_chi varchar(100),
primary key(ma_nha_cung_cap)
);

create table so_dien_thoai(
phone varchar(20),
ma_nha_cung_cap int,
primary key(phone),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table phieu_xuat(
so_phieu_xuat int auto_increment,
ngay_xuat date,
primary key(so_phieu_xuat)
);

create table vat_tu(
ma_vat_tu varchar(50),
ten_vat_tu varchar(50),
primary key(ma_vat_tu)
);

create table phieu_xuat_xuat_vat_tu(
don_gia_xuat double,
so_luong_xuat int,
so_phieu_xuat int,
ma_vat_tu varchar(50),
primary key(so_phieu_xuat,ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_phieu_nhap int auto_increment,
ngay_nhap date,
primary key(so_phieu_nhap)
);

create table vat_tu_xuat_phieu_nhap(
don_gia_nhap double,
so_luong_nhap int,
ma_vat_tu varchar(50),
so_phieu_nhap int,
primary key(ma_vat_tu,so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table don_dat_hang(
so_don_hang int auto_increment,
ngay_dat_hang date,
ma_nha_cung_cap int,
primary key(so_don_hang),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang_dat_vat_tu(
so_don_hang int,
ma_vat_tu varchar(50),
primary key(so_don_hang,ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

