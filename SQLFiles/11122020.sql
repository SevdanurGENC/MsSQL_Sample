use sirketDB
go
Create Proc TumBilgiler
As
Select * from personel

exec TumBilgiler

create proc KisiGetir
as
select * from personel where ad like '%s%'

exec KisiGetir
 
-- Stored Procedure With Parameters
create proc PersonelBilgiGetir @PersonelAdi varchar(25)
as
select * from personel where Ad=@PersonelAdi 

exec PersonelBilgiGetir 'Veysel'

-- Insert 
create proc ProjeEkle
@proje_ad varchar(20),
@baslama_tarihi date,
@planlanan_bitis_tarihi date
As 
insert into proje values (@proje_ad, @baslama_tarihi, @planlanan_bitis_tarihi)

exec ProjeEkle 'Tubitak 4004', '12-12-2020', '12-20-2020'

select * from proje

-- Stored Procedure With One Parameter by criteria

create proc KisiGetirKriterli @Kriter varchar(25)
as
select * from personel where Ad like '%' + @Kriter+ '%'

exec KisiGetirKriterli 'z'

-- Stored Procedure With Multiple Parameters by criteria

alter proc KisiGetirKriterli @Kriter1 varchar(25), @Kriter2 varchar(25)
as
select * from personel 
where Ad like '%' + @Kriter1 + '%' 
and Soyad like '%' + @Kriter2 + '%' 

exec KisiGetirKriterli 's','e'

drop proc KisiGetirKriterli

-- Inner jOin + Parameter
Create proc UnvanaGoreProjeMaasBilgileri @KriterUnvan varchar(25), @KriterProje varchar(25), 
@KriterMaas1 varchar(25), @KriterMaas2 varchar(25)
As
select personel.ad, personel.soyad, birim.birim_ad, unvan.unvan_ad, 
personel.baslama_tarihi, personel.calisma_saati, personel.maas, personel.prim,
proje.proje_ad, proje.baslama_tarihi, proje.planlanan_bitis_tarihi
from personel
inner join unvan on unvan.unvan_no = personel.unvan_no
inner join birim on birim.birim_no = personel.birim_no
inner join gorevlendirme on gorevlendirme.personel_no = personel.personel_no
inner join proje on proje.proje_no = gorevlendirme.proje_no
and unvan.unvan_ad like '%' + @KriterUnvan + '%' 
and proje.proje_ad like '%' + @KriterProje + '%'
and maas between @KriterMaas1 and @KriterMaas2

Exec UnvanaGoreProjeMaasBilgileri 'hend','ternet',2000,4600
Exec UnvanaGoreProjeMaasBilgileri 'hend','ternet',4000,4600
Exec UnvanaGoreProjeMaasBilgileri 'zman','emiz',1000,6000

