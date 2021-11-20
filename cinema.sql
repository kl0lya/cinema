 Create database cinema

 use cinema
 create table Seance (
  id_seance int not null primary key,
  id_cinema int not null ,
  id_film int not null,
  date_seance date not null,
  time_seance time not null,
  film_format nvarchar (10) not null, 
  )


  create table Ticket (
  id_ticket int not null primary key,
  id_hall int not null,
  id_seance int not null, 
  id_viewer int not null,
  seat int not null,
  row int not null,
  price money not null,
  payment nvarchar (20) not null
  )



create table Film (
  id_film int not null primary key,
  name_of_film nvarchar (70) not null,
  age_limit int,
  duration time not null, 
  id_language int not null,
  date_release date not null,
  date_finish date not null
  )
  
  
  create table Language_film(
 id_language int not null primary key,
 name_language nvarchar (50) not null
)

create table Country (
 id_country int not null primary key,
 name_country nvarchar (50) not null
)

create table Country_film (
 id_film int not null,
 id_country int not null,
)
  
  
create table Genre_of_film (
  id_film int not null,
  id_genre_of_film int not null,
  )
  

  create table Genre (
  id_genre int not null primary key,
  name_of_genre nvarchar (30) not null
  )


  create table Hall (
  id_hall int not null primary key,
  id_employees int not null,
  id_cinema int not null,
  type_of_hall nvarchar (20),
  possibility_of_rent nvarchar (10)
  )


  create table Information_of_cinema (
  id_cinema int not null primary key,
  name_of_cinema nvarchar (30) not null,
  city nvarchar(40) not null,
  adress_of_cinema nvarchar (50) not null,
  mobile_phone_of_cinema bigint not null
  )


create table Employees (
  id_employees int not null primary key,
  surname_of_employees nvarchar (30) not null,
  name_of_employees nvarchar (30) not null,
  gender nvarchar (7) not null,
  date_of_birth date not null,
  phone_of_employees bigint not null,
  number_of_credit_card bigint not null,
  data_of_passport nvarchar (9) not null
  )


  create table Goods (
  id_goods int not null primary key,
  name_of_goods nvarchar (50) not null,
  category_of_goods nvarchar (30) not null,
  id_employees int not null,
  price_of_goods money not null
  )


  create table Viewer (
  id_viewer int not null primary key,
  mobile_phone_of_viewer bigint not null,
  surmane_of_viewer nvarchar (30) not null,
  name_of_viewer nvarchar (30) not null,
  email nvarchar (70) not null,
  date_of_birth date not null,
  number_of_credit_card bigint 
  )
 
  create table Order_goods(
  id_viewer int not null,
  id_goods int not null
  )
 
    alter table Goods 
add constraint FK_Goods_Employees foreign key (id_employees) references Employees (id_employees)

    alter table Order_goods
add constraint FK_Order_goods foreign key (id_goods) references Goods (id_goods)

  alter table Order_goods
add constraint FK_Order_viewer foreign key (id_viewer) references Viewer (id_viewer)


  alter table Seance
add constraint FK_seance_information_of_cinema foreign key (id_cinema) references Information_of_cinema (id_cinema)

  alter table Seance
add constraint FK_seance_film foreign key (id_film) references Film (id_film)


  alter table Ticket
add constraint FK_ticket_hall foreign key (id_hall) references Hall (id_hall)

  alter table Ticket 
add constraint FK_ticket_seance foreign key (id_seance) references Seance (id_seance)

  alter table Ticket
add constraint FK_ticket_viewer foreign key (id_viewer) references Viewer (id_viewer)
  
  alter table Hall
add constraint FK_Hall_Employees foreign key (id_employees) references Employees (id_employees)

  alter table Hall
add constraint FK_Hall_Cinema foreign key (id_cinema) references Information_of_cinema (id_cinema)

  alter table Genre_of_film
add constraint FK_Genre_of_film_Film foreign key (id_film) references Film (id_film)

  alter table Genre_of_film
add constraint FK_Genre_of_film_Genre foreign key (id_genre_of_film) references  Genre (id_genre)

alter table Language_film
add constraint FK_Lang_film_Film foreign key (id_language) references Film (id_film)

alter table Country_film 
Add constraint FK_Country_Country_film foreign key (id_country) references Country (id_country)

alter table Country_film 
add constraint FK_Country_film_Film foreign key (id_country) references film (id_film)



/* Заповнення таблиць даними */

INSERT INTO Genre (id_genre, name_of_genre) VALUES (1, 'drama')
INSERT INTO Genre VALUES (2, 'horror')
INSERT INTO Genre VALUES (3, 'documentary')
INSERT INTO Genre VALUES (4, 'action')
INSERT INTO Genre VALUES (5, 'thriller')
INSERT INTO Genre VALUES (6, 'adventure')
INSERT INTO Genre VALUES (7, 'comedy')
INSERT INTO Genre VALUES (8, 'science fiction')
INSERT INTO Genre VALUES (9, 'romance')
INSERT INTO Genre VALUES (10, 'cartoon')
INSERT INTO Genre VALUES (11, 'crime')
INSERT INTO Genre VALUES (12, 'fantasy')
INSERT INTO Genre VALUES (13, 'detective')
INSERT INTO Genre VALUES (14, 'history')


INSERT INTO Country (id_country, name_country)
VALUES 
( 1 , 'USA'),
( 2 , 'Germany'),
( 3 , 'Great Britain' ),
( 4 , 'Canada' ),
( 5 , 'Poland' ),
( 6 , 'Italy' ),
( 7 , 'Iceland' ),
( 8 , 'Sweden' ),
( 9 , 'Australia' ),
( 10 , 'South Africa' ),
( 11 , 'PAR' ),
( 12 , 'Georgia'),
( 13, 'Ukraine')


INSERT INTO Language_film (id_language, name_language)
VALUES 
( 1 , 'Ukrainian'),
( 2 , 'French'),
( 3 , 'English')


SET DATEFORMAT dmy;  

INSERT INTO Film VALUES (1,	'Duna',	12,	'2:38:00',	1,	'16.09.2021',	'27.11.2021')
INSERT INTO Film VALUES (2,	'The French Dispatch',	16,	'1:48:00',		1,	'28.10.2021',	'10.11.2021')
INSERT INTO Film VALUES (3,	'The Addams Family 2',	0,	'1:33:00',	1,	'21.10.2021',	'10.11.2021')
INSERT INTO Film VALUES (4,	'Initiation',	18,	'1:36:00',	1,	'28.10.2021',	'03.11.2021')
INSERT INTO Film VALUES (5,	'Dead in the Water',	16,	'1:32:00',	1,	'11.11.2021',	'01.12.2021')
INSERT INTO Film VALUES (6,	'Venom: Let There Be Carnage',	16,	'1:38:00',	3,	'14.10.2021', '03.11.2021')
INSERT INTO Film VALUES (7,	'Last Night in Soho',	16,	'1:57:00',	1,	'28.10.2021',	'10.11.2021')
INSERT INTO Film VALUES (8,	'No Time to Die',	12,	'2:43:00',	1,	'30.09.2021',	'14.11.2021')
INSERT INTO Film VALUES (9,	'Spider-Man: No Way Home',	12,	'2:00:00', 3,	'16.12.2021',	'05.01.2022')
INSERT INTO Film VALUES (10, 'The Eternals',	16,	'2:38:00', 3,	'11.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (11, 'Never Gonna Snow Again',	16,	 '1:53:00',	2,	'04.11.2021',	'07.11.2021')
INSERT INTO Film VALUES (12, 'The Electrical Life of Louis Wain',	12,	 '2:00:00 ',	1,	'11.11.2021',	'24.11.2021')
INSERT INTO Film VALUES (13, 'Raffaello - Il Genio Sensibile',	0,	 '1:30:00',	1,	'15.11.2021',	'15.11.2021')
INSERT INTO Film VALUES (14, 'Lamb',	12,	 '1:46:00', 1,	'18.11.2021',	'24.11.2021')
INSERT INTO Film VALUES (15, 'The Matrix 4',	18,		'2:00:00', 1,	'22.12.2021',	'30.12.2021')
INSERT INTO Film VALUES (16, 'House of Gucci',	12,	'2:00:00',	1,	'25.11.2021',	'01.12.2021')
INSERT INTO Film VALUES (17, 'Rons Gone Wrong',	0,	'1:47:00',	1,	'14.10.2021',	'03.11.2021')
INSERT INTO Film VALUES (18, 'Triggered',	18,	'1:34:00', 1,	'28.10.2021',	'03.11.2021')
INSERT INTO Film VALUES (19, 'Next Door',	12,	'1:31:00',	1,	'04.11.2021',	'10.11.2021')
INSERT INTO Film VALUES (20, 'Ghostbusters: Afterlife',	16,	'2:00:00',	1,	'18.11.2021',	'24.11.2021')
INSERT INTO Film VALUES (21, 'Gaia',	18,	'1:36:00',	1,	'11.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (22, 'Encanto',	0,	'2:00:00',	3,	'25.11.2021',	'08.12.2021')
INSERT INTO Film VALUES (23, 'Why am I alive',	16,	'2:00:00',	1,	'04.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (24, 'Cop shop',	16,	'2:00:00',	1,	'11.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (25, 'Antlers',	18,	'1:39:00',	1,	'25.11.2021',	'15.12.2021')


INSERT INTO Country_film ( id_film, id_country )
VALUES 
( 1 , 1),
( 2 , 1),
( 2 , 2),
( 3 , 1),
( 3 , 4),
( 5 , 1),
( 6 , 1),
( 7 , 1),
( 7 , 3),
( 8 , 1),
( 8 , 3),
( 8 , 9),
( 9 , 1),
( 10, 1),
( 11, 5),
( 12, 3),
( 13, 6),
( 14, 7),
( 14, 8),
( 14, 5),
( 15, 1),
( 16, 1),
( 17, 1),
( 17, 3),
( 17, 9),
( 18, 10),
( 19, 2),
( 20, 1),
( 21, 11),
( 22, 1),
( 23, 12),
( 23, 13),
( 24, 1),
( 25, 1)


INSERT INTO Genre_of_film VALUES (1,	1)
INSERT INTO Genre_of_film VALUES (1,	8)
INSERT INTO Genre_of_film VALUES (2,	7)
INSERT INTO Genre_of_film VALUES (3,	10)
INSERT INTO Genre_of_film VALUES (4,	2)
INSERT INTO Genre_of_film VALUES (4,	5)
INSERT INTO Genre_of_film VALUES (5,	5)
INSERT INTO Genre_of_film VALUES (6,	4)
INSERT INTO Genre_of_film VALUES (6,	8)
INSERT INTO Genre_of_film VALUES (7,	5)
INSERT INTO Genre_of_film VALUES (8,	4)
INSERT INTO Genre_of_film VALUES (8,	6)
INSERT INTO Genre_of_film VALUES (9,	8)
INSERT INTO Genre_of_film VALUES (10,	1)
INSERT INTO Genre_of_film VALUES (10,	8)
INSERT INTO Genre_of_film VALUES (11,	1)
INSERT INTO Genre_of_film VALUES (11,	7)
INSERT INTO Genre_of_film VALUES (12,	1)
INSERT INTO Genre_of_film VALUES (13,	3)
INSERT INTO Genre_of_film VALUES (14,	1)
INSERT INTO Genre_of_film VALUES (14,	5)
INSERT INTO Genre_of_film VALUES (15,	12)
INSERT INTO Genre_of_film VALUES (16,	11)
INSERT INTO Genre_of_film VALUES (16,	5)
INSERT INTO Genre_of_film VALUES (17,	10)
INSERT INTO Genre_of_film VALUES (17,	6)
INSERT INTO Genre_of_film VALUES (18,	5)
INSERT INTO Genre_of_film VALUES (19,	7)
INSERT INTO Genre_of_film VALUES (20,	4)
INSERT INTO Genre_of_film VALUES (20,	11)
INSERT INTO Genre_of_film VALUES (21,	2)
INSERT INTO Genre_of_film VALUES (22,	6)
INSERT INTO Genre_of_film VALUES (23,	14)
INSERT INTO Genre_of_film VALUES (24,	6)
INSERT INTO Genre_of_film VALUES (24,	7)
INSERT INTO Genre_of_film VALUES (25,	7)
INSERT INTO Genre_of_film VALUES (25,	2)

INSERT INTO Information_of_cinema VALUES (1, 'Planet Cinema 4DX', 'Lviv', 'Pid Dubom Street, 7B', 380800300600)
INSERT INTO Information_of_cinema VALUES (2, 'Planet Cinema', 'Lviv', 'Stryjska Street, 30', 380800300600)
INSERT INTO Information_of_cinema VALUES (3, 'Lviv Cinema', 'Lviv', 'Ulas Samchyk Street, 12', 380800400100)
INSERT INTO Information_of_cinema VALUES (4, 'Multiplex', 'Lviv', 'Kulparkiska Street, 226A', 380800505333)

INSERT INTO Employees VALUES (1, 'Popova', 'Anna', 'Woman', '30.11.1998', 380939789315, 5497593034001564, '009658900')
INSERT INTO Employees VALUES (2, 'Ruban', 'Sabrina', 'Woman', '04.01.1987', 380970445538, 5454656565344555, '948068112')
INSERT INTO Employees VALUES (3, 'Kovalenko', 'Dmitry', 'Man', '06.06.2001', 380995665454, 9876543676556789, '090356667')
INSERT INTO Employees VALUES (4, 'Ostapenko', 'Eva', 'Woman', '23.10.1987', 380995656544, 4336788765329900, '378900116')
INSERT INTO Employees VALUES (5, 'Litvin', 'Emilia', 'Woman', '18.04.1987', 380663557889, 4558789852232357, '355576789')
INSERT INTO Employees VALUES (6, 'Boyko', 'Denis', 'Man', '09.01.1997', 380937756545, 6565687855433350, '765434689')
INSERT INTO Employees VALUES (7, 'Taran', 'Marco', 'Man', '04.07.2000', 380990045457, 6558678773488475, '000766555')
INSERT INTO Employees VALUES (8, 'Ivanov', 'Sofia', 'Woman', '17.08.1999', 380986656000, 6557879890933338, '435467989')
INSERT INTO Employees VALUES (9, 'Panchuk', 'David', 'Man', '14.02.1998', 380637676787, 6567654323879800, '098809096')
INSERT INTO Employees VALUES (10, 'Dudnik', 'Maxim', 'Man', '04.11.2001', 380995653220, 5699285486565549, '687676555')
INSERT INTO Employees VALUES (11, 'Shevchenko', 'Victoria', 'Woman', '17.11.1987', 380995653432, 8834768465656323, '001565654')
INSERT INTO Employees VALUES (12, 'Novak', 'Yuriy', 'Man', '30.09.1987', 380935656560, 6556534987888777, '767665433')
INSERT INTO Employees VALUES (13, 'Didenko', 'Vladislav', 'Man', '24.03.2001', 380675670098, 6554438988867654, '987654327')
INSERT INTO Employees VALUES (14, 'Melnyk', 'Diana', 'Woman', '12.03.1999', 380996565533, 6767564349900965, '034335456')
INSERT INTO Employees VALUES (15, 'Litvin', 'Mary', 'Woman', '24.11.2001', 380996432321, 7867656439876560, '545478980')


INSERT INTO Viewer VALUES (1, 380665689069,	'Shevchenko', 'Artem', 'artem.shev@gmail.com', '24.11.1987', 6602694860158493)
INSERT INTO Viewer VALUES (2, 380958326507,	'Kravchuk',	'David', 'david.kravchuk@gmail.com', '08.06.2000',	5454867878912213)
INSERT INTO Viewer VALUES (3, 380964839685,	'Marchenko', 'Diana', 'diana.mar@gmail.com', '21.10.1989',	8908756655444330)
INSERT INTO Viewer VALUES (4, 380965480367,	'Kondratyuk', 'Maria', 'maria.kondratyuk12@gmail.com', '11.08.2001', 5766458709098975)
INSERT INTO Viewer VALUES (5, 380985802790, 'Shevchuk', 'Bogdan', 'bogdan.shevch@gmail.com', '17.11.1997', 8564343657678878)
INSERT INTO Viewer VALUES (6, 380959432946,	'Petrenko', 'Alexander', 'alex.petrenko05@gmail.com', '09.06.1987', 7698233576898867)
INSERT INTO Viewer VALUES (7, 380998754349, 'Kovalchuk', 'Eva', 'eva2006@gmail.com', '18.10.2006', 7867669887652567)
INSERT INTO Viewer VALUES (8, 380954978756,	'Ivanova', 'Olga', 'olga.ivanova11@gmail.com', '17.01.1999', 8978675453222455)
INSERT INTO Viewer VALUES (9, 380939639657, 'Popelnyuk', 'Yuriy',  'yura3233@gmail.com', '21.09.2000', 7899767665654434)
INSERT INTO Viewer VALUES (10, 380638649104, 'Zakharchuk', 'Victoria', 'zakharchuk78@gmail.com', '27.10.1978', 8778745476433447)
INSERT INTO Viewer VALUES (11, 380939601876, 'Kostelnyuk', 'Denis', 'den.kostelnyuk@gmail.com', '05.11.2000', 6553348885435660)
INSERT INTO Viewer VALUES (12, 380990438654, 'Kovalenko', 'Anastasia', 'nastiakov65@gmail.com', '10.05.2008', 7686775323998871)
INSERT INTO Viewer VALUES (13, 380998674734, 'Gavrilyuk', 'Maxim', 'maxim444@gmail.com', '09.07.1994', 8767657565434323)
INSERT INTO Viewer VALUES (14, 380936954970, 'Ivanova', 'Anna', 'ivanova.anna@gmail.com', '11.11.1997', 7656434455768676)
INSERT INTO Viewer VALUES (15, 380959648929, 'Polishchuk', 'Maria', 'polishchuk.maria@gmail.com', '10.08.2001', 9786764532433555)
INSERT INTO Viewer VALUES (16, 380964368900, 'Shevchenko', 'Marco', 'markoo@gmail.com', '18.10.2004', 5656567564343567)
INSERT INTO Viewer VALUES (17, 380930692010, 'Rudenko', 'Bogdan', 'bogdan1666@gmail.com', '20.12.1984', 5787867877875433)
INSERT INTO Viewer VALUES (18, 380939684836, 'Kravchuk', 'Darina', 'darina.krav@gmail.com', '18.09.1996', 4566788833354670)
INSERT INTO Viewer VALUES (19, 380939467890, 'Klimenko', 'Nazar', 'nazariy12@gmail.com', '21.06.2002', 5654654656768888)
INSERT INTO Viewer VALUES (20, 380990646890, 'Kharchenko', 'Veronica', 'nika.kharchenko@gmail.com', '10.08.1993', 6754653343567875)
INSERT INTO Viewer VALUES (21, 380956367891, 'Ponomarenko', 'Novel', 'novel879@gmail.com', '11.04.2003', 5578674565345678)
INSERT INTO Viewer VALUES (22, 380976459030, 'Shevchuk', 'Anna', 'anna1995@gmail.com', '19.10.1995', 5758778778776757)
INSERT INTO Viewer VALUES (23, 380970646810, 'Levchenko', 'Artem', 'artem291@gmail.com', '17.12.1974', 6765676777573356)
INSERT INTO Viewer VALUES (24, 380667893768, 'Kostelnyuk', 'Sofia', 'sofia.kostelnyuk778@gmail.com', '12.08.2005', 4645677548673556)
INSERT INTO Viewer VALUES (25, 380998527109, 'Savchenko', 'Katerina', 'savchenko183@gmail.com', '17.10.2004', 4458553556688887)
INSERT INTO Viewer VALUES (26, 380939701009,'Karpenko', 'Nazar', 'karpenko.nazar@gmail.com', '20.05.1987', 6576544765775576)
INSERT INTO Viewer VALUES (27, 380986754790, 'Savchuk', 'Solomia', 'solomiasavchuk@gmail.com', '16.03.2004', 3544976876544577)
INSERT INTO Viewer VALUES (28, 380937614579, 'Sidorenko', 'Daria', 'darina123@gmail.com', '18.07.1992', 6589687575545445)
INSERT INTO Viewer VALUES (29, 380975006078, 'Pavlenko', 'Angelina', 'angelina.pavlenko@gmail.com', '18.03.2000', 5478654567687530)
INSERT INTO Viewer VALUES (30, 380995742908, 'Ponomarenko', 'Polina', 'ponomarenko@gmail.com', '26.04.1974', 8453435443524574)
INSERT INTO Viewer VALUES (31, 380996565455, 'Tkachuk', 'Ivan', 'ivan128@gmail.com', '12.10.2004', 7568797875534457)
INSERT INTO Viewer VALUES (32, 380965656450, 'Kravchenko', 'Marco', 'marcokr@gmail.com', '20.11.2003', 9878234567866555)
INSERT INTO Viewer VALUES (33, 380930875542, 'Cooper', 'Boris', 'cooper00@gmail.com', '16.07.1998', 6645678856677775)
INSERT INTO Viewer VALUES (34, 380668853322, 'Karpenko', 'Anna', 'anakarpenko88@gmail.com', '30.01.1994', 8975853475646766)
INSERT INTO Viewer VALUES (35, 380995655522, 'Weaver', 'Leonid', 'weaver.leo@gmail.com', '29.04.1974', 6756474688756776)
INSERT INTO Viewer VALUES (36, 380978564943, 'Shoemaker',	'Nazar', 'nazarr66@gmail.com', '24.11.2005', 5678787787243469)
INSERT INTO Viewer VALUES (37, 380936575677, 'Petrenko', 'Zoryana', 'petrenko8734@gmail.com', '28.11.1998', 5776558674325367)
INSERT INTO Viewer VALUES (38, 380975656545, 'Weaver', 'Maria', 'maria.weaver@gmail.com', '17.04.2004', 6676524458697595)
INSERT INTO Viewer VALUES (39, 380995455677, 'Sidorenko', 'Irina', 'irina675@gmail.com', '12.06.2001', 9089775544576640)
INSERT INTO Viewer VALUES (40, 380935668776, 'Tkachuk', 'Daria', 'dariatk211@gmail.com', '18.07.2000', 7654346578765785)
INSERT INTO Viewer VALUES (41, 380995557543, 'Golub', 'Artem', 'artem665@gmail.com', '06.03.1978', 7865434253453467)
INSERT INTO Viewer VALUES (42, 380665645889, 'Kuzmenko', 'Ivan', 'kuzmenko.ivan@gmail.com', '10.10.1982', 6565765475352565)
INSERT INTO Viewer VALUES (43, 380998765757, 'Oiler',	'Ivanna', 'ivanna.oiler4@gmail.com',  '28.10.1956', 5664657687453445)
INSERT INTO Viewer VALUES (44, 380976565433, 'Savchenko', 'Nazar', 'sav.nazar@gmail.com', '27.11.1973', 8576524565988767)
INSERT INTO Viewer VALUES (45, 380966564333, 'Sidorenko', 'Maria', 'sidorenko548@gmail.com', '08.12.2004', 4854556789456667)
INSERT INTO Viewer VALUES (46, 380995446577, 'Ivanova', 'Lada', 'ladaivanova@gmail.com', '11.06.2000', 5658786768465664)
INSERT INTO Viewer VALUES (47, 380677878333, 'Ponomarenko', 'Myroslav', 'ponomarenko34@gmail.com', '18.07.1996', 7567646554546466)
INSERT INTO Viewer VALUES (48, 380989843320, 'Marchenko', 'Maria', 'maria8855@gmail.com', '21.10.2000', 5764485986678756)
INSERT INTO Viewer VALUES (49, 380997763200, 'Polishchuk', 'Artem', 'Polishchuk.artem12@gmail.com', '29.04.1996', 4645666677434565)
INSERT INTO Viewer VALUES (50, 380939865601, 'Rudenko', 'Daria', 'rudenko.dariaa@gmail.com', '20.10.2004', 5657686665466876)


INSERT INTO Goods
VALUES 
(1,	'Popcorn with cheese',	'Foods',	13,	25),
(2,	'Salty poprcorn',	'Foods',	13,	25),
(3,	'Popcorn with bacon',	'Foods',	13,	25),
(4,	'Popcorn with caramel',	'Foods',	13,	25),
(5,	'Popcorn with cherry',	'Foods',	13,	25),
(6,	'Pepsi 0% sugar',	'Drinks',	10,	19),
(7,	'Pepsi with vanil',	'Drinks',	10,	19),
(8,	'Pepsi with mango',	'Drinks',	10,	20),
(9,	'Coca-Cola',	'Drinks',	10,	22),
(10,	'Coca-Cola 0% sugar',	'Drinks',	10,	21),
(11,	'Snickers (small)',	'Foods',	13,	12),
(12,	'Snickers (middle)',	'Foods',	13,	17),
(13,	'Snickers (big)',	'Foods',	13,	25),
(14,	'Lays with cheese',	'Foods',	13,	28),
(15,	'Lays with sour cream',	'Foods',	13,	28),
(16,	'Lays with bacon',	'Foods',	13,	28),
(17,	'Sandora with orange',	'Drinks',	10,	23),
(18,	'Sandora with apple',	'Drinks',	10,	23),
(19,	'Sandora multifruit',	'Drinks',	10,	23),
(20,	'Sandora with cherry',	'Drinks',	10,	23)


INSERT INTO Hall
VALUES (11,1, 1,'standart','yes')
INSERT INTO Hall
VALUES ( 12 , 4 , 1 ,'standart','no')
INSERT INTO Hall
VALUES ( 13 , 5 , 1 ,'standart','yes')
INSERT INTO Hall
VALUES ( 14 , 6 , 1 ,'lux','yes')
INSERT INTO Hall
VALUES ( 21 , 2 , 2 ,'lux','yes')
INSERT INTO Hall
VALUES ( 22 , 3 , 2 ,'standart','no')
INSERT INTO Hall
VALUES ( 23 , 7 , 2 , 'standart' , 'yes' )
INSERT INTO Hall
VALUES ( 31 , 8 , 3 , 'standart' , 'no' )
INSERT INTO Hall
VALUES ( 32 , 9 , 3 , 'standart' , 'no' )
INSERT INTO Hall
VALUES ( 33 , 12 , 3 , 'lux' , 'yes' )
INSERT INTO Hall
VALUES ( 41 , 11 , 4 , 'standart' , 'yes' )
INSERT INTO Hall
VALUES ( 42 , 14 , 4 , 'standart' , 'no' )
INSERT INTO Hall
VALUES ( 43 , 15 , 4 , 'standart' , 'yes' )


INSERT INTO Order_goods
VALUES ( 1 , 6 ),
( 2 , 9 ),
( 3 , 5 ),
( 3 , 6 ),
( 4 , 9 ),
( 4 , 16 ),
( 5 , 10 ),
( 6 , 19 ),
( 7 , 20 ),
( 8 , 4 ),
( 8 , 7 ),
( 9 , 1 ),
( 9 , 12 ),
( 10 , 6 ),
( 10 , 14 ),
( 10 , 2 ),
( 11 , 2 ),
( 11 , 13 ),
( 11 , 17 ),
( 12 , 20 ),
( 12 , 4 ),
( 13 , 8 ),
( 13 , 11 ),
( 14 , 20 ),
( 15 , 9 ),
( 16 , 11 ),
( 17 , 3 ),
( 19 , 17 ),
( 19 , 14 ),
( 22 , 4 ),
( 22 , 8 ),
( 25 , 13 ),
( 26 , 14 ),
( 28 , 15 ),
( 28 , 10 ),
( 29 , 8 ),
( 29 , 2 ),
( 30 , 4 ),
( 30 , 9 ),
( 35 , 13 ),
( 41 , 3 ),
( 41 , 18 ),
( 42 , 5 ),
( 42 , 6 )


INSERT INTO Seance 
VALUES ( 111 , 1 , 1, '12.11.2021' , '10:00:00','2D' )
INSERT INTO Seance 
VALUES ( 112 , 1 , 8, '12.11.2021' , '13:00:00','3D'  )
INSERT INTO Seance 
VALUES ( 113 , 1 , 5 , '12.11.2021' , '16:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 114 , 1 , 10 , '16.11.2021' , '10:00:00', '3D' )
INSERT INTO Seance 
VALUES ( 115 , 1 , 12 ,'16.11.2021' , '13:10:00' ,'2D' )
INSERT INTO Seance 
VALUES ( 116 , 1 , 21, '16.11.2021' , '15:30:00','4D' )
INSERT INTO Seance 
VALUES ( 117 , 1 , 24 , '16.11.2021' , '16:50:00','4D' )
INSERT INTO Seance 
VALUES ( 118 , 1 , 13 , '16.11.2021' , '18:30:00','3D'  )
INSERT INTO Seance 
VALUES ( 119 , 1 , 1 ,'01.11.2021' , '10:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 120 , 1 , 2 ,'01.11.2021' , '13:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 121 , 1 , 3 , '01.11.2021' , '15:30:00','2D'  )
INSERT INTO Seance 
VALUES ( 122 , 1 , 4 , '01.11.2021' , '18:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 123 , 1 , 6 , '02.11.2021' , '10:00:00','3D'  )
INSERT INTO Seance 
VALUES ( 124 , 1 , 2 , '29.10.2021' , '10:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 125 , 1 , 7 , '29.10.2021', '13:00:00','3D'  )
INSERT INTO Seance 
VALUES ( 126 , 1 , 18 ,  '29.10.2021' , '15:30:00','3D'  )
INSERT INTO Seance 
VALUES ( 127 , 1 , 17 , '29.10.2021' , '18:10:00','4D' )
INSERT INTO Seance 
VALUES ( 211 , 2 , 10 , '15.11.2021' , '10:00:00','4D' )
INSERT INTO Seance 
VALUES ( 212 , 2 , 12 , '15.11.2021' , '13:10:00' ,'2D' )
INSERT INTO Seance 
VALUES ( 213 , 2 , 13 , '15.11.2021' , '18:30:00' ,'2D' )
INSERT INTO Seance 
VALUES ( 214 , 2 , 9 , '23.12.2021', '10:00:00' ,'2D' )
INSERT INTO Seance 
VALUES ( 215 , 2 , 15 , '23.12.2021' , '15:00:00','4D' )
INSERT INTO Seance 
VALUES ( 216 , 2 , 22 , '01.12.2021' , '12:00:00','4D' )
INSERT INTO Seance 
VALUES ( 217 , 2 , 25 , '01.12.2021' , '16:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 311 , 3 , 21 , '11.11.2021' , '10:00:00','3D'  )
INSERT INTO Seance 
VALUES ( 312 , 3 , 8 , '11.11.2021' , '13:00:00','4D' )
INSERT INTO Seance 
VALUES ( 313 , 3 , 24 , '11.11.2021' , '16:30:00','3D'  )
INSERT INTO Seance 
VALUES ( 314 , 3 , 1 , '11.11.2021' , '18:50:00','2D'  )
INSERT INTO Seance 
VALUES ( 315 , 3 , 2 , '30.10.2021' , '10:00:00','4D' )
INSERT INTO Seance 
VALUES ( 316 , 3 , 7 ,'30.10.2021' , '13:00:00','4D' )
INSERT INTO Seance 
VALUES ( 317 , 3 , 17 , '30.10.2021' , '16:20:00','2D'  )
INSERT INTO Seance 
VALUES ( 318 , 3 , 8 ,'30.10.2021' , '18:10:00','4D' )
INSERT INTO Seance 
VALUES ( 319 , 3 , 19 , '06.11.2021' , '10:00:00','4D'  )
INSERT INTO Seance 
VALUES ( 320 , 3 , 23 , '06.11.2021' , '13:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 321 , 3 , 11 , '06.11.2021' , '18:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 411 , 4 , 5 , '26.11.2021' , '10:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 412 , 4 , 22 , '26.11.2021' , '13:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 413 , 4 , 15 , '26.11.2021' , '16:40:00','3D'  )
INSERT INTO Seance 
VALUES ( 414 , 4 , 25 , '26.11.2021' , '18:30:00','4D' )
INSERT INTO Seance 
VALUES ( 415 , 4 , 24 , '11.11.2021' , '10:00:00' ,'2D' )
INSERT INTO Seance 
VALUES ( 416 , 4 , 12 ,  '11.11.2021' , '12:30:00','3D'  )
INSERT INTO Seance 
VALUES ( 417 , 4 , 10 , '11.11.2021' , '15:00:00','4D' )
INSERT INTO Seance 
VALUES ( 418 , 4 , 21 , '11.11.2021' , '18:10:00','3D'  )
INSERT INTO Seance 
VALUES ( 419 , 4 , 23 ,  '05.11.2021' , '10:00:00','2D'  )
INSERT INTO Seance 
VALUES ( 420 , 4 , 19 ,  '05.11.2021' , '13:00:00','4D' )
INSERT INTO Seance 
VALUES ( 421 , 4 , 11 , '05.11.2021' , '15:30:00','3D'  )
INSERT INTO Seance 
VALUES ( 422 , 4 , 7 , '05.11.2021' , '18:10:00','4D' )

INSERT INTO Ticket
VALUES (1001,11,113,25,5,3,'120','credit card'),
(1002,11,113,26,6,3,'120','cash'),
(1003,11,112,25,5,3,'120','cash'),
(1004,12,115,19,7,1,'170','cash'),
(1005,11,113,20,1,3,'120','credit card'),
(1006,12,115,7,5,2,'150','credit card'),
(1007,12,115,5,8,1,'150','credit card'),
(1008,12,117,12,10,4,'115','cash'),
(1009,12,117,13,11,4,'115','cash'),
(1010,12,117,14,12,4,'115','cash'),
(1011,13,120,11,11,3,'120','credit card'),
(1012,13,120,9,10,2,'120','credit card'),
(1013,13,121,7,14,3,'135','cash'),
(1014,13,119,3,1,2,'120','credit card'),
(1015,13,119,4,2,2,'120','cash'),
(1016,13,119,41,3,2,'120','cash'),
(1017,014,124,15,11,2,'110','credit card'),
(1018,14,124,16,12,2,'110','cash'),
(1019,14,124,17,13,2,'110','credit card'),
(1020,14,127,34,12,1,'140','cash'),
(1021,14,127,35,13,1,'140','cash'),
(1022,14,127,26,15,2,'140','credit card'),
(1023,14,126,10,10,3,'154','credit card'),
(2001,21,212,12,5,1,'120','cash'),
(2002,21,212,13,6,1,'120','cash'),
(2003,21,213,34,2,4,'150','cash'),
(2004,21,213,37,2,4,'150','cash'),
(2005,22,215,27,11,2,'120','credit card'),
(2006,22,215,28,12,2,'120','credit card'),
(2007,23,216,17,6,3,'130','cash'),
(2008,23,217,46,15,2,'140','credit card'),
(2009,23,217,47,16,2,'140','cash'),
(2010,22,214,33,2,1,'130','credit card'),
(3001,31,311,26,4,3,'115','cash'),
(3002,31,311,29,5,4,'120','cash'),
(3003,31,312,3,2,4,'130','cash'),
(3004,31,312,15,4,1,'100','credit card'),
(3005,31,312,16,5,1,'100','credit card'),
(3006,31,313,43,6,2,'110','cash'),
(3007,31,313,44,1,1,'100','cash'),
(3008,31,313,45,2,1,'100','credit card'),
(3009,31,314,39,5,2,'120','cash'),
(3010,32,315,21,6,3,'150','cash'),
(3011,32,316,22,7,2,'160','credit card'),
(3012,32,316,23,8,2,'160','credit card'),
(3013,33,319,30,9,3,'140','cash'),
(3014,33,319,31,10,3,'140','cash'),
(3015,33,321,3,9,2,'110','credit card'),
(3016,33,321,4,10,2,'110','cash'),
(4001,41,411,42,11,2,'120','cash'),
(4002,41,411,43,12,2,'120','cash'),
(4003,41,412,2,1,3,'100','credit card'),
(4004,41,413,5,2,4,'110','credit card'),
(4005,41,414,6,5,3,'150','cash'),
(4006,42,415,16,7,2,'115','cash'),
(4007,42,415,17,8,2,115,'credit card'),
(4008,42,415,18,9,2,'115','cash'),
(4009,42,416,40,8,1,'140','credit card'),
(4010,42,416,39,5,1,'130','cash'),
(4011,43,421,20,6,2,'140','credit card'),
(4012,43,421,23,7,2,'140','credit card'),
(4013,43,421,5,1,3,'130','cash'),
(4014,43,422,11,3,2,'110','cash'),
(4015,43,422,50,1,3,'150','credit card'),
(4016,43,422,49,3,4,'111','credit card')

