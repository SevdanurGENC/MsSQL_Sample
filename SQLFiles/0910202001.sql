create database taskopru
on 
primary(
name = tmyodata,
filename = "d:\tmyo.mdf",
size = 100mb,
maxsize = 750mb,
filegrowth = 10%
)
log on(
name = tmyolog,
filename = "d:\tmyo.log",
size = 25mb,
maxsize = 150mb,
filegrowth = 2mb
)