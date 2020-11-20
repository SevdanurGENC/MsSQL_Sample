use kutuphane

-- Sayfa sayısı en fazla olan kitaba ait bilgileri listeleyen İç İçe Select sorgusu

select * 
from kitap
where sayfasayisi in
(select max(sayfasayisi)
from kitap)

-- Sayfa sayısı ortalama sayfa sayısından küçük olan kitapları listeleyen Sorgu
select * 
from kitap
where sayfasayisi < (select avg(sayfasayisi)
from kitap)

-- Türü Komedi olan kitapları listeleyen İç İçe Select Sorgusu
select * 
from kitap
where kitap.turno = (select (tur.turno) 
from tur where tur.turadi='Komedi')

--Adı s harfi ile başlayan Yazarlara ait Kitapların Listesi

select * 
from kitap
where kitap.yazarno in (select yazar.yazarno 
from yazar where yazarad like 's%')

-- İç içe select ile okunmayan kitapları listeleyen Sorgu
select * 
from kitap
where kitap.kitapno not in 
(select distinct islem.kitapno 
from islem)

-- Ocak ayında okunmayan kitapların listesi

select * 
from kitap
where kitap.kitapno not in 
(select distinct islem.kitapno 
from islem
where MONTH(islem.atarih)=1)

--Fıkra ve hikaye türündeki kitapların adını  ve türünü listeleyin.
select kitap.kitapadi, tur.turadi from kitap,tur
where kitap.turno=tur.turno 
and tur.turadi in ('Hikaye','Fıkra')

--ROMAN türünde  ve ortalama sayfa sayısından büyük olan kitapları listeleyen sorguyu yazınız.

SELECT *
FROM kitap
WHERE sayfasayisi >    (
      SELECT AVG(sayfasayisi) 
      FROM kitap 
      WHERE turno =(
		SELECT turno
        FROM tur
        WHERE turadi='ROMAN') )
        AND
        turno=(SELECT turno
            FROM tur
            WHERE turadi='ROMAN' )


--Tür numarası 3 olan kitaplardan en büyük sayfasayından büyük olan kitapları listeler.

select * from kitap
    where sayfasayisi > ALL
        (select sayfasayisi FROM kitap
            where turno=3)

-- MAX fonksiyonu ile daha temiz bir sorgu elde edebiliriz.
select * from kitap
    where sayfasayisi >
        (select max(sayfasayisi) FROM kitap
            where turno=3)

--Tür numarası 3 olan en düşük sayfa sayısı olan kitabın sayfa sayısından büyük olan kitapları listeler.

select * from kitap
	where sayfasayisi > ANY
		(select sayfasayisi FROM kitap
			where turno=3) 

-- MIN  fonksiyonu ile daha temiz bir sorgu elde edebiliriz.

select * from kitap
	where sayfasayisi >
		(select min(sayfasayisi) FROM kitap
			where turno=3)
  