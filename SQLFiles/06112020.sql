create database DBJoin06112020
use DBJoin06112020

--Öğrenci tablosu
CREATE TABLE Ogrenci(
    OgrenciId int,
    AdSoyad varchar(100)
)
--Danışman tablosu
CREATE TABLE Danisman(
    DanismanId int,
    AdSoyad varchar(100)
) 
--Öğrenci Danışman tablosu
CREATE TABLE OgrenciDanisman(
    OgrenciDanismanId int,
    OgrenciId int,
    DanismanId int
) 

use DBJoin06112020
--Ogrenci tablosuna kayıt girelim
INSERT Ogrenci VALUES(1,'Öğrenci_1')
INSERT Ogrenci VALUES(2,'Öğrenci_2')
INSERT Ogrenci VALUES(3,'Öğrenci_3')
INSERT Ogrenci VALUES(4,'Öğrenci_4')

--Danışman tablosuna kayıt girelim
INSERT Danisman VALUES(1,'Danışman_1')
INSERT Danisman VALUES(2,'Danışman_2')
INSERT Danisman VALUES(3,'Danışman_3')
INSERT Danisman VALUES(4,'Danışman_4')

--Danışmanı olan öğrenciler için kayıt girelim
--1 nolu öğrencinin danışmanı=2 nolu danışman
INSERT OgrenciDanisman VALUES(1,1,2)
--3 nolu öğrencinin danışmanı=2 nolu danışman
INSERT OgrenciDanisman VALUES(2,3,2)
--4 nolu öğrencinin danışmanı=1 nolu danışman
INSERT OgrenciDanisman VALUES(3,4,1)

use DBJoin06112020
select * from Danisman
select * from Ogrenci
select * from OgrenciDanisman

select o.*
from ogrenci o
inner join OgrenciDanisman od
on o.OgrenciId=od.OgrenciId

select o.OgrenciId, o.AdSoyad, d.DanismanId, d.AdSoyad
from ogrenci o
inner join OgrenciDanisman od
on o.OgrenciId=od.OgrenciId
inner join Danisman d
on od.DanismanId = d.DanismanId

select *
from ogrenci o
left join OgrenciDanisman od
on o.OgrenciId=od.OgrenciId

select *
from ogrenci o
left join OgrenciDanisman od
on o.OgrenciId=od.OgrenciId
where od.DanismanId is null

select *
from OgrenciDanisman od
right join Danisman d
on d.DanismanId = od.DanismanId

select *
from OgrenciDanisman od
right join Danisman d
on d.DanismanId = od.DanismanId
where od.DanismanId is null


select *
from Ogrenci o
full join OgrenciDanisman od
on o.OgrenciId = od.OgrenciId
full join Danisman d
on d.DanismanId = od.DanismanId

select * 
from Ogrenci o
cross join danisman d
order by OgrenciId

select * 
from ogrenci o
left join OgrenciDanisman od
on o.OgrenciId = od.OgrenciId
where od.DanismanId is null

delete Ogrenci 
from ogrenci o
left join OgrenciDanisman od
on o.OgrenciId = od.OgrenciId
where od.DanismanId is null







