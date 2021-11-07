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
  country_film nvarchar (30),
  language_of_film nvarchar (20) not null,
  date_release date not null,
  date_finish date not null
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


SET DATEFORMAT dmy;  

INSERT INTO Film VALUES (1,	'Duna',	12,	'2:38:00',	'USA',	'ukrainian',	'16.09.2021',	'27.11.2021')
INSERT INTO Film VALUES (2,	'The French Dispatch',	16,	'1:48:00',	'USA, Germany',	'ukrainian',	'28.10.2021',	'10.11.2021')
INSERT INTO Film VALUES (3,	'The Addams Family 2',	0,	'1:33:00',	'USA, Canada',	'ukrainian',	'21.10.2021',	'10.11.2021')
INSERT INTO Film VALUES (4,	'Initiation',	18,	'1:36:00',	'USA',	'ukrainian',	'28.10.2021',	'03.11.2021')
INSERT INTO Film VALUES (5,	'Dead in the Water',	16,	'1:32:00',	'USA',	'ukrainian',	'11.11.2021',	'01.12.2021')
INSERT INTO Film VALUES (6,	'Venom: Let There Be Carnage',	16,	'1:38:00',	'USA',	'English',	'14.10.2021', '03.11.2021')
INSERT INTO Film VALUES (7,	'Last Night in Soho',	16,	'1:57:00',	'USA, Great Britain',	'Ukrainian',	'28.10.2021',	'10.11.2021')
INSERT INTO Film VALUES (8,	'No Time to Die',	12,	'2:43:00',	'USA, Great Britain, Australia',	'Ukrainian',	'30.09.2021',	'14.11.2021')
INSERT INTO Film VALUES (9,	'Spider-Man: No Way Home',	12,	'2:00:00',	'USA',	'English',	'16.12.2021',	'05.01.2022')
INSERT INTO Film VALUES (10, 'The Eternals',	16,	'2:38:00',	'USA',	'English',	'11.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (11, 'Never Gonna Snow Again',	16,	 '1:53:00', 	'Poland',	'French',	'04.11.2021',	'07.11.2021')
INSERT INTO Film VALUES (12, 'The Electrical Life of Louis Wain',	12,	 '2:00:00 ',	'Great Britain',	'Ukrainian',	'11.11.2021',	'24.11.2021')
INSERT INTO Film VALUES (13, 'Raffaello - Il Genio Sensibile',	0,	 '1:30:00',	'Italy',	'Ukrainian',	'15.11.2021',	'15.11.2021')
INSERT INTO Film VALUES (14, 'Lamb',	12,	 '1:46:00', 	'Iceland, Sweden, Poland',	'Ukrainian',	'18.11.2021',	'24.11.2021')
INSERT INTO Film VALUES (15, 'The Matrix 4',	18,		'2:00:00', 	'USA',	'ukrainian',	'22.12.2021',	'30.12.2021')
INSERT INTO Film VALUES (16, 'House of Gucci',	12,	'2:00:00',	'USA',	'ukrainian',	'25.11.2021',	'01.12.2021')
INSERT INTO Film VALUES (17, 'Rons Gone Wrong',	0,	'1:47:00', 'USA, Great Britain, Australia',	'Ukrainian',	'14.10.2021',	'03.11.2021')
INSERT INTO Film VALUES (18, 'Triggered',	18,	'1:34:00',	'South Africa', 'Ukrainian',	'28.10.2021',	'03.11.2021')
INSERT INTO Film VALUES (19, 'Next Door',	12,	'1:31:00',	'Germany',	'Ukrainian',	'04.11.2021',	'10.11.2021')
INSERT INTO Film VALUES (20, 'Ghostbusters: Afterlife',	16,	'2:00:00',	'USA',	'ukrainian',	'18.11.2021',	'24.11.2021')
INSERT INTO Film VALUES (21, 'Gaia',	18,	'1:36:00',	'PAR',	'ukrainian',	'11.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (22, 'Encanto',	0,	'2:00:00',	'USA',	'English',	'25.11.2021',	'08.12.2021')
INSERT INTO Film VALUES (23, 'Why am I alive',	16,	'2:00:00',	'Ukraine, Georgia',	'ukrainian',	'04.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (24, 'Cop shop',	16,	'2:00:00',	'USA',	'ukrainian',	'11.11.2021',	'17.11.2021')
INSERT INTO Film VALUES (25, 'Antlers',	18,	'1:39:00',	'USA',	'ukrainian',	'25.11.2021',	'15.12.2021')


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


