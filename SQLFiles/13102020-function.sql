use taskopru_myo

select * from fakulte
select * from ogrenci

-- Sorgu donduren fonksiyon ornegi --
create function fn_birlestir(@kelime1 varchar(40), @kelime2 varchar(40))
returns varchar(81)
as begin
return rtrim(@kelime1)+space(1)+rtrim(@kelime2)
end

select dbo.fn_birlestir(ad,soyad) As 'Ogrenci Ad Soyadi' 
from ogrenci

--Kutuphane vt'de ogrenci no'suna gore girilen kitap sayilari--
use kutuphane
create function fn_kitap_sayisi(@ogrno int)
returns int
as
begin
	return (select count(*) 
	from islem
	where @ogrno=ogrno)
end

select count(*) from islem where ogrno=5

select ogrno,ograd, ogrsoyad, dbo.fn_kitap_sayisi(ogrno)
from ogrenci
order by 3 desc


-- Sabit deger donduren fonksiyon ornegi --

create function fn_isaret(@sayi int)
returns int
as 
begin 
	if (@sayi<0)
		return -1
	if (@sayi=0)
		return 0
	return 1
end

select dbo.fn_isaret(10)
select dbo.fn_isaret(-10)
select dbo.fn_isaret(0)

create function fn_isaret1(@sayi int)
returns varchar(40)
as 
begin 
	if (@sayi<0)
		return 'negatif'
	if (@sayi=0)
		return 'sifir'
	return 'pozitif'
end

-- drop function dbo.fn_isaret1
select dbo.fn_isaret1(10)
select dbo.fn_isaret1(-10)
select dbo.fn_isaret1(0)



-- Replicate : benzerini olusturma --

create function fn_tekrarla(@kelime varchar(10), @sayi int)
returns varchar(max)
as
begin
declare @sonuc varchar(max)=''
declare @i int = 0

while (@i<@sayi)
begin
set @sonuc += @kelime
set @i += 1
end

return @sonuc
end

select dbo.fn_tekrarla('Merhaba ',7)


-- Bolunur mu ? --

create function fn_bolunurMu (@s1 int, @s2 int)
returns varchar(10)
as
begin
declare @mesajver varchar(10)
	if (@s1%@s2 = 0)
		set @mesajver = 'Bolunur'
	else
		set @mesajver = 'Bolunmez'
	return @mesajver
end

select dbo.fn_bolunurMu(15,2)
select dbo.fn_bolunurMu(15,5)

-- -- 
create function fn_pozitifDondur(@s1 int, @s2 int)
returns int
as 
begin
return abs(@s1-@s2)
end

select dbo.fn_pozitifDondur(15,20)

create function fn_pozitif(@s1 int, @s2 int)
returns int
as 
begin
declare @sonuc int =@s1-@s2
	if (@sonuc<0)
		begin
		select @sonuc = (@sonuc*-2)+@sonuc
		end
return @sonuc
end

select dbo.fn_pozitif(2,10)

-- faktoriyel hesaplama --

create function fn_hesapla(@sayi int)
returns int 
as 
begin
declare @sonuc int = 1
declare @i int = 1
	while (@i<=@sayi)
		begin
			select @sonuc *= @i
			select @i += 1
		end
return @sonuc
end

select dbo.fn_hesapla(5)

-- sayinin kuvvetini hesaplama --

create function fn_kuvvet(@k1 int, @k2 int)
returns int
as
begin
declare @sonuc int  = 1
declare @i int = 1 
	while (@i<=@k2)
		begin
			select @sonuc *= @k1
			select @i += 1
		end
return @sonuc
end

select dbo.fn_kuvvet(5,2)