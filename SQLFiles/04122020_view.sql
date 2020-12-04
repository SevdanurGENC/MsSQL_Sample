create database viewDenemeDb;
use viewDenemeDb
 
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
CınsiyetID int references TblCinsiyet(ID)
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
 
CREATE VIEW OGRENCIGETIR
AS
SELECT TBLOGRENCI.ID, TBLOGRENCI.AD,TBLOGRENCI.SOYAD, TBLCINSIYET.CINSIYET,
TBLSEHIR.SEHIR
FROM TBLOGRENCI
JOIN TBLSEHIR ON TBLSEHIR.ID=TBLOGRENCI.SehirID
JOIN TBLCINSIYET ON TBLCINSIYET.ID=TBLOGRENCI.CınsiyetID

select * from OGRENCIGETIR

insert into OGRENCIGETIR (id, Ad, Soyad, Cinsiyet, Sehir)
values (6, 'Sevdanur', 'GENC', 'KADIN', 'BALIKESIR')

delete from OGRENCIGETIR
where id = 5

drop view OGRENCIGETIR

CREATE VIEW OGRENCITBLGETIR
AS
SELECT TBLOGRENCI.ID, TBLOGRENCI.AD,TBLOGRENCI.SOYAD 
FROM TBLOGRENCI

select * from OGRENCITBLGETIR
where id = 3

delete from OGRENCITBLGETIR 
where id = 3

select * from TblOgrenci

insert into OGRENCITBLGETIR(ad, soyad)
values('Sevdanur', 'GENC')

