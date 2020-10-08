create database nanoway

use nanoway

create table turler(
id int identity(1,1) not null, 
ad nvarchar(20),
primary key(id)
)

create table yazar(
yazarno int not null,
yazarad varchar(25) not null,
yazarsoyad varchar(25) not null,
primary key(yazarno)
)

insert into yazar(yazarno,yazarad,yazarsoyad)
values (45, 'Sevdanur', 'Genc')

select * from yazar

select yazarno, yazarad +' '+ yazarsoyad as yazaradsoyad
into yeni_tablo
from yazar
where yazarno = 45

select * from yeni_tablo

drop table yeni_tablo

alter table yazar add
tcno varchar(11),
dogumtarihi date

select * from yazar

alter table yazar 
drop column tcno

alter table yazar
alter column yazarad nvarchar(50)

alter table yazar
alter column yazarad nvarchar(50) not null

alter table yazar
add constraint yazarno_kisit unique (yazarno)

alter table yazar 
add constraint pk_yazarno primary key (yazarno)

alter table yazar
drop constraint yazarno_kisit

/*stored procedure kullanilir*/
sp_rename 'yazarlar.yazarad', 'yazaradi', 'column'

sp_rename 'yazar', 'yazarlar'
