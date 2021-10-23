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
  series int not null,
  price money not null,
  payment nvarchar (20) not null
  )



  create table Film (
  id_film int not null primary key,
  name_of_film nvarchar (70) not null,
  age int,
  time_film time not null, 
  country_film nvarchar (30),
  language_of_film nvarchar (20) not null,
  data_release date not null,
  data_finish date not null
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
  mobile_phone_of_cinema int not null
  )
