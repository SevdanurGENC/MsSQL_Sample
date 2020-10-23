create database yazarVT
use yazarVt

create table turler(
turid int identity(1,1) not null,
turadi nvarchar(150),
primary key (turid)
)

use yazarVT
create table yazar(
yazarno int,
yazarad varchar(100),
yazarsoyad varchar(100)
)

select * 
from yazar

select yazarno, yazarad + ' ' + yazarsoyad as yazaradsoyad
into yeniyazar
from yazar
where yazarno<3

select * 
from yeniyazar

drop table yeniyazar

alter table yazar 
add dogumtarihi date, 
tcno nvarchar(11),
adres nvarchar(200)

select * from yazar

alter table yazar
drop column adres

alter table yazar
alter column dogumtarihi varchar(15)

use yazarVT
alter table yazar
alter column tcno nvarchar(11) not null

use yazarVT
alter table yazar
alter column yazarad varchar(100) NOT NULL

select * from yazar

alter table yazar
add constraint yazarno_kisit Unique (yazarno)

alter table yazar
drop constraint yazarno_kisit

alter table yazar
add constraint yazarno_pk primary key (yazarno)