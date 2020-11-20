create database altSorgular01
use altSorgular01

create table Bolumler(
BolumId int not null,
BolumAd varchar(100),
primary key(BolumId)
)

create table Notlar(
NotId int not null,
DersId int not null,
OgrenciId int not null,
Vize int,
Final int, 
primary key(NotId)
)

create table Ogrenci(
OgrenciId int not null,
Ad varchar(100),
Soyad varchar(100),
OkulNo varchar(10),
BolumId int,
primary key(OgrenciId)
)

insert into bolumler(bolumid, bolumad)
values (1, 'Bilgisayar Öğretmenliği'),
(2,	'Fizik Öğretmenliği'),
(3,	'Fizik Bölümü'),
(4,	'Kimya Öğretmenliği'),
(5,	'Biyokimya Mühendisliği')

select * from bolumler

insert into notlar(notid, dersid, ogrenciid, vize, final)
values (1,	1,	1,	60,	45),
(2,	2,	3,	69,	75),
(3,	3,	3,	56,	76),
(4,	3,	5,	67,	89),
(5,	4,	2,	80,	50),
(6,	5,	5,	60,	76),
(7,	6,	4,	26,	70),
(8,	7,	2,	90,	35),
(9,	8,	1,	60,	56),
(10,9,	2,	54,	45),
(11,4,	3,	58,	98);

select * from notlar

insert into ogrenci(ogrenciid, ad, soyad, okulno, bolumid)
values (1,	'Mehmet','Durmaz','1250',1),
(2,	'Ahmet','Yıkılmaz',	'1452',1),
(3,	'Ayşe',	NULL,	'1656',	2),
(4,	'Melek','Tunc', '1245',	2),
(5,	'Seher','Ay',	'2364',	5),
(6,	'Şakir','Yok',	'1025',	4),
(7,	'Abbas','Kırmızı','1436', 3),
(8,	'Ayşe',	'Pekmez',	'1237',	2),
(9,	'Mert',	'Günaydın',	'2563',	5);

select * from ogrenci

select * from ogrenci where bolumid = (select bolumid from bolumler where bolumad = 'Fizik Öğretmenliği');

select * from ogrenci where bolumid in (select bolumid from bolumler where bolumad like '%fizik%');

select ad, soyad, ogrenciid from ogrenci where ogrenciid in 
(select ogrenciid from notlar group by ogrenciid having avg(final)>50);