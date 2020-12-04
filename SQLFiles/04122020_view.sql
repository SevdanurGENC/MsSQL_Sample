create database viewDeneme
use viewDeneme

create table TblSehir
(
ID int identity(1,1) primary key,
Sehir varchar (20)
)
Create table TblCinsiyet
(
ID int identity(1,1) primary key,
Cinsiyet varchar(5)
)
Create table TblOgrenci
(
ID int identity(1,1) primary key,
Ad Varchar(20),
Soyad varchar(20),
SehirID int references TblSehir(ID),
CinsiyetID int references TblCinsiyet(ID)
)



INSERT INTO TBLSEHIR VALUES ('BURDUR')
INSERT INTO TBLSEHIR VALUES ('ISPARTA')
INSERT INTO TBLSEHIR VALUES ('ANTALYA')
INSERT INTO TBLCINSIYET VALUES ('ERKEK')
INSERT INTO TBLCINSIYET VALUES ('KADIN')
INSERT INTO TBLOGRENCI VALUES ('ALI','KAAN',1,2)
INSERT INTO TBLOGRENCI VALUES ('AYÞE','SAKAR',3,2)
INSERT INTO TBLOGRENCI VALUES ('ASU','BAKAR',2,1)
INSERT INTO TBLOGRENCI VALUES ('HASAN','YANBASAN',3,1)
INSERT INTO TBLOGRENCI VALUES ('MEHMET','OKÇU',1,1)

select * from TblCinsiyet
select * from TblOgrenci
select * from TblSehir

--uc tablolu view sorgusu
create view ogrenciBilgileriniGetir
As
select TblOgrenci.ID, TblOgrenci.Ad, TblOgrenci.Soyad, TblCinsiyet.Cinsiyet, TblSehir.Sehir
from TblOgrenci
join TblSehir on TblSehir.ID = TblOgrenci.SehirID
join TblCinsiyet on TblCinsiyet.ID = TblOgrenci.CinsiyetID

select * from ogrenciBilgileriniGetir

insert into ogrenciBilgileriniGetir(ID, Ad, Soyad, Cinsiyet, Sehir)
values (7, 'Sevdanur', 'GENC', 'KADIN', 'BALIKESIR')

delete from ogrenciBilgileriniGetir
where id = 5

drop view ogrenciBilgileriniGetir
 

--tek tablolu view sorgusu
create view ogrenciTblGetir
as
select id, ad, soyad
from TblOgrenci

select * from ogrenciTblGetir

insert into ogrenciTblGetir(ad, Soyad)
values ('Sevdanur', 'GENC')

select * from TblOgrenci

delete from ogrenciTblGetir
where id = 6

select * from ogrenciTblGetir

select * from TblOgrenci

drop view ogrenciTblGetir
