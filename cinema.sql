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
  mobile_phone_of_cinema int not null
  )


create table Employees (
  id_employees int not null primary key,
  surname_of_employees nvarchar (30) not null,
  name_of_employees nvarchar (30) not null,
  gender nvarchar (7) not null,
  date_of_birth date not null,
  phone_of_employees int not null,
  number_of_credit_card int not null,
  data_of_passport nvarchar not null
  )


  create table Goods (
  id_goods int not null primary key,
  name_of_goods nvarchar (50) not null,
  category_of_goods nvarchar (30) not null,
  id_employees int not null,
  id_viewer int not null,
  price_of_goods money not null
  )


  create table Viewer (
  id_viewer int not null primary key,
  mobile_phone_of_viewer int not null,
  surmane_of_viewer nvarchar (30) not null,
  name_of_viewer nvarchar (30) not null,
  email nvarchar (70) not null,
  date_of_birth date not null,
  number_of_credit_card int 
  )
