use Taskopru_MYO

----- Sql Fonksiyonlari I -----

select * from ogrenci

select upper(ad)
from ogrenci

select lower(ad)
from ogrenci

select substring(ad,1,4)
from ogrenci

select floor(7.8975)
select FLOOR(24.9)

select FLOOR(ortalama)
from ogrenci

select CEILING(24.1)

select ceiling(ortalama)
from ogrenci

select ROUND(24.23,1)

select * from ogrenci

select ROUND(ortalama,1)
from ogrenci

select ad, LEFT(soyad,3)
from ogrenci

select ad, RIGHT(soyad,3)
from ogrenci

select ad, len(soyad)
from ogrenci

select ad, ltrim(ad)
from ogrenci

select ad, rtrim(ad)
from ogrenci

----- Sql Fonksiyonlari II -----

select ad+' '+soyad As 'Ogrenci Bilgileri'
from ogrenci

select distinct fakulte 
from ogrenci

select soyad
from ogrenci
group by soyad

select fakulte, count(fakulte) As 'Ogrenci Sayisi'
from ogrenci
group by fakulte
having count(fakulte)<3

select ad, soyad, fakulte
into YeniOgrenci
from ogrenci
where fakulte = 5

select * 
from YeniOgrenci

select top 3 *
from ogrenci

select * 
from ogrenci
order by NEWID()

select top 2 * 
from ogrenci
order by NEWID()

select top 50 percent *
from ogrenci
order by NEWID()