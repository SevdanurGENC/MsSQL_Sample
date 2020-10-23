create database TaskopruMYO

use TaskopruMyo

create table ogrenci(
ogrno int not null,
ad varchar(40) not null,
soyad varchar(40) not null,
dogumtarihi date,
ortalama real,
primary key(ogrno)
)

select * from ogrenci

insert into ogrenci(ogrno,ad,soyad,dogumtarihi,ortalama)
values(11,'Sevdanur','Genc','1983-04-03',2.86),
(12,'Meltem','Onder','1982-03-03',3.2),
(13,'Huseyin','Sahin','1983-12-01',2.77),
(14,'Dogus Can','Yildiz','1984-10-14',2.44),
(15,'Selcuk','Genc','1975-10-10',3)

select * from ogrenci

select ogrno, ad, ortalama
from ogrenci

select ogrno As 'Ogrenci No', ad As 'Ogrenci Adi', ortalama As 'Not Ortalamasi'
from ogrenci

create table bolum(
id int not null,
fakulteAdi varchar(100),
primary key(id)
)

select * from bolum

insert into bolum(id, fakulteAdi)
values (1,'Muhendislik Fakultesi'),
(2,'Tip Fakultesi'),
(3, 'Fen Edebiyat Fakultesi'),
(4,'Egitim Fakultesi'),
(5, 'Mimarlik Fakultesi')

select * from bolum

alter table ogrenci
add fakulte int

select * from ogrenci

update ogrenci 
set fakulte = 2
where ogrno = 11

update ogrenci 
set fakulte = 1
where ogrno = 12

update ogrenci 
set fakulte = 3
where ogrno = 13

update ogrenci 
set fakulte = 5
where ogrno = 14

update ogrenci 
set fakulte = 4
where ogrno = 15

select o.ogrno, o.ad, o.soyad, o.ortalama, b.fakulteAdi 
from ogrenci as o, bolum as b
where o.fakulte = b.id

select * 
from ogrenci
where ad='Sevdanur' and ortalama = '2.86'

select * 
from ogrenci
where ortalama>=3 or fakulte=3

select ogrno, ad, soyad, ortalama 
from ogrenci
where ortalama between 2.5 and 3

select ogrno, ad, dogumtarihi
from ogrenci
where ogrno in ('15')

select ogrno, ad, dogumtarihi 
from ogrenci
where ad like '%e%'

select ogrno, ad, ortalama 
from ogrenci
where ad not in ('Sevdanur', 'Selcuk')

select ogrno, ad, soyad, dogumtarihi, ortalama, fakulteadi
from ogrenci, bolum
where ogrenci.fakulte = bolum.id
and ortalama between 2.5 and 3
and ad like '%e%'

insert into bolum(id, fakulteAdi)
values (6, 'Veterinerlik Fakultesi')

select * from bolum

delete from bolum
where id = 6

----------- ikinci ders ----------

select * 
from ogrenci
order by ortalama desc

select ogrno, avg(ortalama)
from ogrenci
group by ogrno

select avg(ortalama)
from ogrenci

select sum(ortalama)
from ogrenci

select count(*)
from ogrenci

select max(ortalama), min(ortalama)
from ogrenci


------ ucuncu ders -------
select fakulteadi
from bolum
where fakulteadi like '%en%'

select fakulteadi
from bolum
where fakulteadi like 'm%'

select fakulteadi
from bolum
where fakulteadi like

select fakulteadi
from bolum
where fakulteadi like '%e__'

select fakulteadi
from bolum
where fakulteadi like '[MTF]%'

select fakulteadi
from bolum
where fakulteadi like '[f-m]%'

select fakulteadi
from bolum
where fakulteadi like '%[^ekl]'

select fakulteadi
from bolum
where fakulteadi like '_e%'

select ad
from ogrenci
where ad like 'dog______'

select ad
from ogrenci
where ad like 'se%[rk]'









