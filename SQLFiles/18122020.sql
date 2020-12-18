--create trigger trigger_adi
--on tablo_adi
--alter veya instead of (insert, update, delete)
--as
--begin
--sql ifadeler
--end

use sirketDB

create Trigger trg_il_girisi
ON il
AFTER insert
AS
Print 'veri girildi'
Print 'trigger calisti'

insert into il (il_no, il_ad) values (16, 'Bursa')

--ALTER TRIGGER trıgger_adı
--ON tablo_adı
--AFTER veya INSTEAD OF (INSERT , UPDATE , DELETE)
--AS
--Begın
----Sql ıfadeler
--End

alter Trigger trg_il_girisi
ON il
instead of insert
AS
Print 'veri girildi'
Print 'trigger calisti'

DROP TRIGGER trg_il_girisi

disable trigger trg_il_girisi On il
alter table il disable trigger trg_il_girisi

enable trigger trg_il_girisi On il
alter table il enable trigger trg_il_girisi

enable trigger all on il
disable trigger all on il






-----------------------------------------

create database Mart
use Mart
create table Deneme(sayi int)
go
alter trigger sildirme
on Deneme
for Delete
as
Print ('Bu tabloyu silemezsiniz!')

rollback transaction
delete from Deneme 





----
CREATE DATABASE BANKA
USE BANKA

CREATE TABLE HESAP
(
HESAP_ID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
AD       VARCHAR(30) NOT NULL,
SOYAD    VARCHAR(30) NOT NULL,
HESAP_NO INT         NOT NULL,
BAKIYE   INT         NOT NULL
)

INSERT INTO HESAP VALUES('İBRAHİM','BAYRAKTAR',19265,7000)
INSERT INTO HESAP VALUES('SAMET','ULUTURK',19572,10000)
INSERT INTO HESAP VALUES('RAMAZAN','PINARBAŞI',19752,9500)
INSERT INTO HESAP VALUES('RAŞİT','BAKIR',19912,17000)

--Samet ULUTURK'ün hesabından, İbrahim BAYRAKTAR'ın hesabına 1000 TL havale yapılsın." 
-- Bu işlem için izleyeceğimiz algoritma Samet ULUTURK'ün bakiye bilgisini 1000 azaltmak ve İbrahim BAYRAKTAR'ın bakiye bilgisini 1000 artırmak olacaktır.
-- Havale işleminin gerçekleşmesi için bu iki sorgunun aynı anda gerçekleşmesi gerekir ve sistem kullanıcısı bu iki sorguyu birden çalıştırıyor. Şimdide örnek işlemimizde oluşabilecek olası hata senaryolarını inceleyelim.

UPDATE HESAP SET BAKIYE = BAKIYE - 1000 --1.Sorgu
WHERE AD='SAMET' AND SOYAD='ULUTURK'

UPDATE HESAP SET BAKIYE = BAKIYE + 1000 --2.Sorgu
WHERE AD='İBRAHİM' AND SOYAD='BAYRAKTAR'

-- Hata Olasılığı 1: Birinci SQL sorgumuzun çalışması fakat ikinci SQL sorgumuzda hata oluşması. 
-- Hata Olasılığı 2: Birinci SQL sorgumuzda hata oluştu ve ikinci SQL sorgumuzun çalışması durumunda hata oluşması.

BEGIN TRANSACTION
BEGIN TRY

UPDATE HESAP SET BAKIYE = BAKIYE - 1000
WHERE AD='SAMET' AND SOYAD='ULUTURK'

UPDATE HESAP SET BAKIYE = BAKIYE + 1000
WHERE AD='İBRAHİM' AND SOYAD='BAYRAKTAR'

COMMIT
END TRY
BEGIN CATCH
ROLLBACK
END CATCH







---- 

create database OKULVT2
use OKULVT2
create table OgrenciBilgileri(
OgrNo int,
Ad varchar(20),
Soyad varchar(20),
Cınsıyet varchar(1) )
go
create trigger Listele
on OgrenciBilgileri
after insert
as
begin
select * from OgrenciBilgileri
end
insert into OgrenciBilgileri(OgrNo,Ad, Soyad, Cınsıyet) 
values (123456, 'Süleyman', 'SANCAR', 'E')





---- 

create table Ogrenciler(
OgrNo int,
Ad varchar(20),
Soyad varchar(20),
Sınıf varchar(5),
Cınsıyet varchar(1) )
use OKULVT2
go
create trigger cınsıyetkontrolu
on Ogrenciler
for insert
As
if(exists(Select * from inserted where Sınıf = '2A' and cınsıyet = 'E'))
Begin
raiserror('2A sınıfına erkek öğrencı kaydedılemez',1,1)
rollback transaction
End

use OKULVT2
insert into Ogrenciler(OgrNo,Ad, Soyad, Sınıf, Cınsıyet) 
values (123456, 'Süleyman','SANCAR', '2A', 'E')






----- KUTUPHANE OTOMASYONU -----
use kutuphane
-- Kullanıcı bır kayıt ekledıkten sonra ogrencı tablosunu lısteleyen trıgger oluşturunuz 
create trigger trg_Listele on ogrenci
after insert
as
begin
select * from ogrenci
End 
--Kayıt ekleme örneğı
insert into ogrenci(ograd,ogrsoyad,cinsiyet,dtarih,sinif,puan)
values('Alı','Velı','E',GETDATE(),'10A',0) --ÖNCE TRİGGER I ÇALIŞTIR



--10A sınıfına cınsıyetı kız olan öğrencıler kaydedılebılsın
alter trigger cinsiyet on ogrenci
for insert
As
if(exists(Select * from inserted where sinif = '10A' and cinsiyet = 'E'))
Begin
  raiserror('10A sınıfına erkek öğrencı kaydedılemez',1,1)
  rollback transaction
End  

insert into ogrenci(ograd,ogrsoyad,cinsiyet,dtarih,sinif,puan) 
values('Alı','Velı','E',GETDATE(),'10A',0) --ÖNCE TRİGGER I ÇALIŞTIR




-- 10A’nın kız öğrencılerı sılınemesın
Create trigger trg_10AKızOgrenciSilme on ogrenci
after delete
as
begin
   if(exists(select * from deleted where cinsiyet='K' and sinif='10A'))
    begin
     raiserror('10A sınıfındakı kız öğrencılerı sılemezsınız!!',0,0)
     rollback transaction
    end
End

delete from ogrenci
where cinsiyet='K' and sinif='10A' --kullanadan önce trıggerı çalıştırmayı unutmayın





--- Sılınen öğrencıler başka bır tabloya kaydedılsın
create table mezun(
ograd varchar(50),
ogrsoyad varchar(50))

create trigger trg_SilineniEkle on ogrenci
after delete
as begin
insert into mezun select ograd,ogrsoyad from deleted
end

delete from ogrenci where ogrno=3 --trıggerı test edıyoruz
select * from mezun






-- Öğrencılerın cınsıyet alanı güncellenmesın
create trigger trg_Guncelle on ogrenci
after update
as begin
--ıf(update(cınsıyet))
if(exists(select * from inserted,deleted 
where inserted.ogrno=deleted.ogrno and inserted.cinsiyet!=deleted.cinsiyet)) 
--Exısts ıçındekı değerın olup olmadığına bakar.
begin
raiserror('Cınsıyet Güncellenemez.',1,1)
rollback transaction
end
end 

--trıgger test edılmesı
select * from ogrenci where ogrno = 5
update ogrenci set cinsiyet = 'E' where ogrno=5







-- Kıtap tablosu güncellenırken eskı sayfa sayısı yenı sayfa sayısından fazla olmak zorunda
create trigger kitapguncelle on kitap
after update
as
begin
if(exists(select * from inserted,deleted where inserted.sayfasayisi=deleted.sayfasayisi or inserted.sayfasayisi > deleted.sayfasayisi))
begin
raiserror('Eskı sayfa sayısı yenı sayfa sayısından fazla olmak zorunda',1,1)
rollback transaction
end
end 
--Bırıncı Kontrol
update kitap set puan=20, sayfasayisi=368 where kitapno=1
select * from kitap where kitapno=1
--İkıncı Kontrol
update kitap set puan=20, sayfasayisi=170 where kitapno=1
select * from kıtap where kitapno=1







-- Tür tablosundan hıçbır kayıt sılınmesın
create trigger trg_turSilinmez on tur
after delete
as
begin
raiserror('tur tablosu uzerinde kayit silinmez',1,1)
rollback transaction
end 

delete from tur
select * from tur



--After yerıne Instead of kullanılarak delete ışlemı yapmak yerıne hata vermesı sağlanabılır.
alter trigger trg_turSilinmez on tur
instead of delete
as
begin
raiserror('tur tablosu uzerinde kayit silinmez',1,1)
rollback transaction
end 

delete from tur
select * from tur





--- Ogrencı tablosuna sılındı ısmınde bır alan ekleyınız. Ogrencı sılınmesın sılındı alanının değerı 1 olsun –ınstead of kullanılacak after yerıne
Alter Table ogrenci add silindi bit null

Create trigger ogrenciSil on ogrenci
instead of delete
as
begin
update ogrenci set silindi=1 where ogrno in (select ogrno from deleted)
End

--trıggerı çalıştırmayı unutmayın. daha önce oluşturulan trıggerlar ıle çakışmaması ıçın eskılerını durdurmayı unutmayın
delete from ogrenci where ogrno in(8,9)
select * from ogrenci where ogrno in (8,9)






-- Tur tablosuna gTarıh adında bı alan ekleyın tur tablosunda guncelleme yapıldığında gtarıh alanına güncelleme tarıhını kaydedınız.
Alter Table tur add gTarih datetime null

Create Trigger turGuncelle on tur
after update
as
begin
--ıf(not update(guncellendı))--recursıve trıgger açıksa hata verememesı ıçın
  update tur set gTarih=GETDATE() where turno in (select turno from deleted)
end

update tur set turadi='Başka Bır Tür' where turno=3

select * from tur where turno=3




--- 500 sayfadan daha az deneme türünde kıtap eklenemesın
alter Trigger kitap1 on kitap
after insert
as
if(exists(Select * from inserted,tur where inserted.turno = tur.turno and
turadi='deneme' and sayfasayisi<500))
begin
  raiserror('500 sayfadan az roman türünde kıtap kaydedılemez',1,1);
  rollback transaction
End

insert into kitap values('8379-23874-87237', 'Hello WORLD!', 20, 7, 400, 100)
select * from kitap where kitapno=51



