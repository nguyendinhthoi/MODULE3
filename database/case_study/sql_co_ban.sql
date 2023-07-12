-- SQL cơ bản
use furama_management_database;
-- bài 2
select * from nhan_vien
where char_length(ho_ten)<=15 and (ho_ten like "K%" or ho_ten like "H%" or ho_ten like "T%");

-- bài 3
select * from khach_hang 
where ((year(curdate()) - year(ngay_sinh)) - (right(curdate(), 5) < right(ngay_sinh, 5)) between 18 and 50) and (dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng Trị%");

-- bài 4
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong
from khach_hang 
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where ten_loai_khach = "Diamond"
group by ma_khach_hang
order by so_lan_dat_phong;

-- bài 5
-- select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, 
-- hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, (dich_vu.chi_phi_thue + (hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia)) as tong_tien
-- from khach_hang
-- join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
-- join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
-- join 





