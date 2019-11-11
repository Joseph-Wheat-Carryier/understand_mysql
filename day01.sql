--1.创建数据库crashcourse
create database crashcourse;

--2.进入数据库
use crashcourse

--3.创建表person
create table person(number int primary key,name varchar (50),sex char (1),addr varchar (50));

--4.修改字段number改名为id,类型改为bigint
alter table person change number id bigint;

--5.添加字段birth,类型为date
alter table person add birth date;

--6.移除id的主键约束,将name修改为主键;
alter table person drop primary key, add primary key(name);

--7.将sex的默认值改为1
alter table person alter sex set default 1;

--8.将name的长度改为30
alter table person change name name char(30);

--9.删除addr列
alter table person drop addr;

--10.创建工作表product、vendors、curstomers中的表格和数据
10.1: create table products(prod_id varchar(30) primary key,vend_id int(10),prod_name varchar(30),prod_price decimal(4,2),prod_desc varchar(100));

--10.2
insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('ANV02',1001,'.1 ton anvil',9.99,'1 ton anvil,black,complete with handy hook and carrying case');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('ANV02',1001,'.1 ton anvil',9.99,'1 ton anvil,black,complete with handy hook and carrying case');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('ANV03',1001,'.2 ton anvil',14.99,'2 ton anvil,black,complete with handy hook and carrying case');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('DTNTR',1003,'Detonator',13.00,'Detonator(plunger powered),fuses not included');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('FB',1003,'Bird seed',10.00,'Large bag(suitable for road runners');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('FC',1003,'Carrots',2.5,'Carrots(rabbit hunting season only');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('FU!',1002,'Fuses',3.42,'1 dozen,extra long');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('JP1000',1005,'JetPack 1000',35,'JetPack 1000,intended for single use');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('JP2000',1005,'JetPack 2000',55,'JetPack 2000,multi-use');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('OL1',1002,'Oil can',8.99,'Oil can,red');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('SAFE',1003,'Safe',50.00,'Safe with combination lock');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('SLING',1003,'Sling',4.49,'Sling,one size fits all');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('TNT1',1003,'TNT(1 stick)',2.50,'TNT,red,single stick');

insert into products (prod_id,vend_id,prod_name,prod_price,prod_desc) value('TNT2',1003,'TNT(5 stick)',10.00,'TNT,red,pack of 10 stick');


--11.创建vendors,插入数据
--11.1
create table vendors( vend_id int(10) primary key,vend_name varchar(30),vend_address varchar(20),vend_city varchar(20),vend_state varchar(5),vend_zip varchar(10),vend_country varchar(20) );

--11.2
insert into vendors (vend_id,vend_name,vend_address,vend_city,vend_state,vend_zip,vend_country) value(1001,'Anvils','123 main street','Southfield','MI','48075','USA');

insert into vendors (vend_id,city,vend_state,vend_zip,vend_country) value(1002,'LT','500','Anytown','OH','44333','USA');

insert into vendors (vend_id,city,vend_state,vend_zip,vend_country) value(1003,'ACME','555','Los','CA','90046','USA');

insert into vendors (vend_id,city,vend_state,vend_zip,vend_country) value(1004,'Furbal','1000','New','NY','11111','USA');

insert into vendors (vend_id,city,vend_state,vend_zip,vend_country) value(1005,'Jet','42','London','NULL','N16','England');

insert into vendors (vend_id,city,vend_state,vend_zip,vend_country) value(1006,'Jouets','1','Paris','NULL','45678','France');

--12.创建customers，并插入数据
--12.1
create table customers( cust_id int(10) primary key,cust_name varchar(50),cust_address varchar(50),cust_city varchar(20),cust_state varchar(10),cust_zip varchar(10),cust_country varchar(10),cust_contact varchar(20),cust_email varchar(50));

--12.2
insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10001,'Coyote','200','Detroit','MI','44444','USA','Y','ylee@coyote.com');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10002,'Mouse','333','Columbus','OH','43333','USA','Jerry','NULL');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10003,'Wascals','1','Muncie','IN','42222','USA','Jim','rabbit@wascally.com');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10004,'Yosemite','829','Phoenix','AZ','88888','USA','Y','sam@yosemite.com');

insert into customers (cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email) value(10005,'E','4545','Chicago','IL','54545','USA','E','NULL');

--13.查询customers中，cust_name为Wascals的所有信息
select * from customers where cust_name='Wascals';

--14.查询producs中prod_price为9.99的所有信息
select * from products where prod_price=9.99;

--15.查询vendors中，vend_name为ACME的vend_address
select vend_address from vendors where vend_name='ACME';
