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
where lk.ten_loai_khach = "Diamond" 
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
(select hd.ma_hop_dong 
where month(hd.ngay_lam_hop_dong) <=6 and year(hd.ngay_lam_hop_dong) = 2021)
and (month(hd.ngay_lam_hop_dong) >= 10 and year(hd.ngay_lam_hop_dong) = 2020)
group by hd.ma_hop_dong;

-- bài 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem as dvdk 
join hop_dong_chi_tiet as hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem =
(select max(hdct.so_luong) from hop_dong_chi_tiet hdct);

-- bài 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong as hd
join dich_vu as dv
on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu as ldv
on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong_chi_tiet as hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem as dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
having so_lan_su_dung = 1
order by hd.ma_hop_dong;

-- bài 15
select nv.ma_nhan_vien , nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien as nv
join trinh_do as td
on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan as bp
on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong as hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) 
in (
	select count(hd.ma_nhan_vien)
    from hop_dong
	where count(hd.ma_nhan_vien) < 4
    );

-- bài 16
alter table nhan_vien 
add is_delete bit(1) default 0;
set sql_safe_updates = 0;
update nhan_vien 
set is_delete = 1
where nhan_vien.ma_nhan_vien 
not in (
	select hop_dong.ma_nhan_vien 
    from hop_dong
    );
set sql_safe_updates = 1;
select * from nhan_vien
where is_delete = 0;

-- bài 17
update khach_hang
set ma_loai_khach = 1
where ma_khach_hang
in (
	select * 
    from (
    select kh.ma_khach_hang 
    from khach_hang as kh
    join loai_khach as lk
    on lk.ma_loai_khach = kh.ma_loai_khach
    join hop_dong as hd
    on hd.ma_khach_hang = kh.ma_khach_hang
    join hop_dong_chi_tiet as hdct
    on hdct.ma_hop_dong = hd.ma_hop_dong
    join dich_vu_di_kem as dvdk
    on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    join dich_vu as dv
    on dv.ma_dich_vu = hd.ma_dich_vu
    where lk.ten_loai_khach = "Platinium" and year(hd.ngay_lam_hop_dong) = 2021
    group by lk.ma_loai_khach
    having sum(ifnull((hdct.so_luong*dvdk.gia),0) + dv.chi_phi_thue) > 1000000
)as bang_phu
);






-- bài 18
alter table khach_hang 
add is_delete bit(1) default 0;
set sql_safe_updates = 0;

update khach_hang 
set khach_hang.is_delete = 1
where khach_hang.ma_khach_hang 
in (
	select * from (
	select khach_hang.ma_khach_hang
    from khach_hang
    join hop_dong 
    on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
    where year(hop_dong.ngay_lam_hop_dong) < 2021 
    ) as bang_phu
);
set sql_safe_updates = 1;

select * from khach_hang where khach_hang.is_delete = 1;

-- bài 19
set sql_safe_updates = 0;
update  dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem 
in (
	select ma_dich_vu_di_kem 
    from hop_dong_chi_tiet as hdct
    join hop_dong as hd
    on hd.ma_hop_dong = hdct.ma_hop_dong
    where year(hd.ngay_lam_hop_dong) = 2020 
    group by hdct.ma_dich_vu_di_kem
    having sum(hdct.so_luong) > 10
   );
set sql_safe_updates = 1;

-- bài 20
select nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien as nv
union
select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang as kh
