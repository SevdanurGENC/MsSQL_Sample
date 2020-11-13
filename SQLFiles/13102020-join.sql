use kutuphane

-- Öğrencinin adını, soyadını ve kitap aldığı tarihleri listeleyin.
select ograd,ogrsoyad,islem.atarih 
from ogrenci
join islem 
on islem.ogrno=ogrenci.ogrno

-- Fıkra ve hikaye türündeki kitapların adını ve türünü listeleyin.
select kitapadi,turadi from kitap
join tur on kitap.turno=tur.turno
and tur.turadi in('Hikaye','Fıkra')

select kitapadi,turadi from kitap
join tur on kitap.turno=tur.turno
where tur.turadi in('Hikaye','Fıkra')

-- 10B veya 10C sınıfındaki öğrencilerin numarasını, adını, soyadını ve okuduğu kitapları, öğrenci adına göre listeleyin.
select ogrenci.ogrno,ograd,ogrsoyad,sinif,kitapadi
from ogrenci
join islem on ogrenci.ogrno=islem.ogrno
join kitap on islem.kitapno=kitap.kitapno
where sinif='10B' or sinif='10C'
order by ogrenci.ograd


-- SQL LEFT JOIN Kullanımı ÇALIŞMA SORULARI

-- Kitap alan öğrencinin adı, soyadı, kitap aldığı tarih listelensin. Kitap almayan öğrencilerinde listede görünsün.

select ograd,ogrsoyad,islem.islemno from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno

-- Kitap almayan öğrencileri listeleyin.

select ograd,ogrsoyad,islem.atarih from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
where islem.atarih is null

-- Alınan kitapların kitap numarasını, adını ve kaç defa alındığını kitap numaralarına göre artan sırada listeleyiniz.

select kitap.kitapno, kitap.kitapadi,count(*) from islem
left join kitap
on kitap.kitapno=islem.kitapno
group by kitap.kitapadi,kitap.kitapno
order by kitap.kitapno

-- Alınan kitapların kitap numarasını, adını kaç defa alındığını (alınmayan kitapların yanında 0 olsun) listeleyin
select kitap.kitapno, kitap.kitapadi,count(islem.islemno) as adet from kitap
left join islem on kitap.kitapno=islem.kitapno
group by kitap.kitapadi,kitap.kitapno,islem.kitapno
order by adet

-- Öğrencilerin adı soyadı ve aldıkları kitabın adı listelensin.

Select * from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
left join kitap on islem.kitapno=kitap.kitapno

-- SQL LEFT JOIN ve RIGHT JOIN Kullanımı ÇALIŞMA SORULARI
-- Her öğrencinin adı, soyadı, kitabın adı, yazarın adı soyad ve kitabın türünü ve kitabın alındığı tarihi listeleyiniz. Kitap almayan öğrenciler de listede görünsün.

Select ograd,ogrsoyad yazarad,yazarsoyad,kitapadi,turadi from kitap
join tur on tur.turno=kitap.turno
join yazar on kitap.turno=yazar.yazarno
join islem on kitap.kitapno=islem.kitapno
right join ogrenci on ogrenci.ogrno=islem.ogrno


-- Her öğrencinin adı, soyadı, kitabın adı, yazarın adı soyad ve kitabın türünü ve kitabın alındığı tarihi listeleyiniz. Kitap almayan öğrenciler de listede görünsün.( Farklı Çözüm)
Select ograd,ogrsoyad yazarad,yazarsoyad,kitapadi,turadi from islem
join kitap on islem.kitapno=kitap.turno
right join ogrenci on ogrenci.ogrno=islem.ogrno
left join tur on kitap.turno=tur.turno
left join yazar on yazar.yazarno=kitap.yazarno

-- 10A veya 10B sınıfındaki öğrencilerin adı soyadı ve okuduğu kitap sayısını getirin.

select sinif, ograd,ogrsoyad,count(islemno) from ogrenci
left join islem on islem.ogrno=ogrenci.ogrno
where sinif in ('10A','10B')
group by sinif,ograd,ogrsoyad
order by count(*)







Select ogrenci.ogrno, ograd,ogrsoyad,kitapadi,atarih,vtarih from ogrenci 
join islem on ogrenci.ogrno = islem.ogrno 
join kitap on kitap.kitapno = islem.kitapno


Select ogrenci.ogrno, ograd,ogrsoyad,kitapadi,yazarad,atarih,vtarih from ogrenci 
join islem on ogrenci.ogrno = islem.ogrno 
join kitap on kitap.kitapno = islem.kitapno
join yazar on kitap.yazarno=yazar.yazarno