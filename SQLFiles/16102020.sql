use yazilimbilisim

create table yazar(
yazarno int identity(1,1) not null primary key,
yazarad varchar(50),
dogumtarihi date
)

create table tur(
turno int identity(1,1) not null primary key,
turad varchar(50)
)

create table kitap(
kitapno int identity(1,1) not null primary key,
isbnno varchar(50),
kitapadi varchar(100),
yazarno int Foreign Key References yazar(yazarno),
turno int,
sayfasayisi int
)

drop table kitap

create table kitap(
kitapno int identity(1,1) not null primary key,
isbnno varchar(50),
kitapadi varchar(100),
yazarno int,
turno int,
sayfasayisi int
)

alter table kitap
add constraint fk_turno
foreign key (turno) 
references tur(turno)