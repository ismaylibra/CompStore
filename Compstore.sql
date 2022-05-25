create database CompStore
use CompStore
create table Notebooks(
   Id int primary key identity,
   [Name] nvarchar(30) not null,
   Price int
)
alter table Notebooks
add constraint DF_Price default 200 for Price
insert into Notebooks([Name],Price)
values('TUF505',1800),
('ROG',4600),
('Predator',3500),
('ThinkPad',1500),
('MateBook',450),
('Fujitsu', 840)
create table Brands(
    Id int primary key identity,
	[Name] nvarchar(30) not null
)
alter table Brands
add constraint CK_Name check(len([Name])>3)
insert into Brands([Name])
values('ASUS'),
('ACER'),
('LENOVO'),
('SONY'),
('HUAWEI')
 alter table Notebooks
 add Brand_Id int foreign key references Brands(Id)

 select Notebooks.[Name] as Model, Brands.[Name], Notebooks.Price from Notebooks
join Brands
on Notebooks.Brand_Id= Brands.Id

select Brands.Name from Brands where Brands.Name like '%a%'

select * from Notebooks where Price between 100 and 500 or Price>1000

