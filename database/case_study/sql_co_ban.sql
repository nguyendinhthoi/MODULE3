-- SQL cơ bản
use furama_management_database;
-- bài 2
select * from nhan_vien
where char_length(ho_ten)<=15 
and (ho_ten like "K%" or ho_ten like "H%" or ho_ten like "T%");

-- bài 3
select * from khach_hang 
where ((year(curdate()) - year(ngay_sinh)) - 
(right(curdate(), 5) < right(ngay_sinh, 5)) between 18 and 50) 
and (dia_chi like "%Đà Nẵng%" or dia_chi like "%Quảng Trị%");

-- bài 4
select khach_hang.ma_khach_hang, khach_hang.ho_ten, 
count(hop_dong.ma_khach_hang) as so_lan_dat_phong
from khach_hang 
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where ten_loai_khach = "Diamond"
group by ma_khach_hang
order by so_lan_dat_phong;

-- bài 5
select distinct khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, 
hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc,
ifnull(((hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia)),0) + dich_vu.chi_phi_thue as tong_tien
from khach_hang
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem;

-- bài 6
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ma_dich_vu 
not in 
(select hop_dong.ma_dich_vu 
from hop_dong
where (year(ngay_lam_hop_dong) = 2021) 
and (month(ngay_lam_hop_dong) < 4))
group by dich_vu.ma_dich_vu;

-- bài 7
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu 
join loai_dich_vu 
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong 
on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where hop_dong.ma_dich_vu not in 
(select hop_dong.ma_dich_vu from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) = 2021)
and year(hop_dong.ngay_lam_hop_dong) = 2020
group by dich_vu.ma_dich_vu;

-- bài 8
select distinct ho_ten from khach_hang;

select ho_ten from khach_hang
group by ho_ten;

select khach_hang.ho_ten from khach_hang
union
select khach_hang.ho_ten from khach_hang;

-- bài 9
select month(hop_dong.ngay_lam_hop_dong) as thang,
count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
group by thang
order by thang ;

-- bài 10
select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, 
ifnull(sum(hop_dong_chi_tiet.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- bài 11
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem as dvdk
join hop_dong_chi_tiet as hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong as hd
on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang as kh
on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach as lk
on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach like "Diamond" 
and (kh.dia_chi like "%Vinh%" or kh.dia_chi like "%Quảng Ngãi%");

-- bài 12
select hd.ma_hop_dong, 
nv.ho_ten as ho_ten_nhan_vien, 
kh.ho_ten as ho_ten_khach_hang, 
kh.so_dien_thoai as so_dien_thoai_khach_hang,
dv.ma_dich_vu, dv.ten_dich_vu, 
ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem, 
hd.tien_dat_coc
from hop_dong as hd
left join nhan_vien as nv
on nv.ma_nhan_vien = hd.ma_nhan_vien
left join khach_hang as kh
on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu as dv
on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
where hd.ma_hop_dong not in 
(select hd.ma_hop_dong where month(hd.ngay_lam_hop_dong) <=6 and year(hd.ngay_lam_hop_dong) = 2021)
and (month(hd.ngay_lam_hop_dong) >= 10 and year(hd.ngay_lam_hop_dong) = 2020)
group by hd.ma_hop_dong;

-- bài 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where sum(hdct.so_luong) in
(select max(hdct.so_luong))
group by dvdk.ma_dich_vu_di_kem

-- ifnull(sum(hdct.so_luong),0)
