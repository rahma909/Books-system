
drop database Book;
create database Book;
use Book;

CREATE TABLE BookAuthor (
  bookauthorID int auto_increment,
  authouName varchar(40),
  constraint BookAuthor_pk primary key(bookauthorID )
);

describe BookAuthor;


 insert into BookAuthor (bookauthorID,authouName )  values(1,'Vladimir Nabokov ');
 insert into BookAuthor (bookauthorID,authouName ) values(2,'F. Scott Fitzgerald');
 insert into BookAuthor (bookauthorID,authouName ) values(3,'James Joyce');
 insert into BookAuthor (bookauthorID,authouName )  values(4,'Gabriel Garcia Marquez');
 insert into BookAuthor (bookauthorID,authouName ) values(5,'Agatha Christie');


CREATE TABLE Book (
  bookID int auto_increment,
  catDescription varchar(20),
  title varchar(40),
  rate int,
  constraint Book_pk primary key(bookID )
);
describe Book;

insert into Book (bookID,catDescription,title,rate ) values(1,'Humor','Lolita',90);
insert into Book (bookID,catDescription,title,rate) values(2,'Drama','The Great Gatsby ',70);
insert into Book (bookID,catDescription,title,rate) values(3,'Crime ','In Search of Lost Time ',90);
insert into Book (bookID,catDescription,title,rate) values(4,'Romance','Ulysses',50);
insert into Book (bookID,catDescription,title,rate) values(5,'Drama','Dubliners',70);
insert into Book (bookID,catDescription,title,rate) values(6,'Romance','One Hundred Years of Solitude ',100);
insert into Book (bookID,catDescription,title,rate) values(7,'Classic','The Secret Adversary',30);
insert into Book (bookID,catDescription,title,rate) values(8,'Humor','The Secret of Chimneys',70);
insert into Book (bookID,catDescription,title,rate ) values(9,'Crime ','The Man in the Brown Suit',90);
insert into Book (bookID,catDescription,title,rate) values(10,'Crime ','The Big Four',90);

  CREATE TABLE profile (
  profileID int auto_increment,
  Name varchar(10),
  email varchar(80),
  password varchar(20),
  bookID int,
  constraint Book_pk primary key(profileID ),
  constraint bookID_fk foreign key (bookID) references Book(bookID)
);
describe profile;

insert into profile (profileID,Name,email, password) values(1, 'ahmed','ahmed.ali99@gmail.com','ah12med55');
insert into profile (profileID,Name,email, password) values( 2,'mohamed','mohamed.899@gmail.com','558369');
insert into profile (profileID,Name,email, password) values( 3,'abeer','abeer.ahmed@gmail.com','yaya200');
insert into profile (profileID,Name,email, password) values( 4,'farah','farah.serag@gmail.com','11680');
insert into profile (profileID,Name,email, password) values( 5,'laila','lolo ahmed2020@gmail.com','lala77');


  CREATE TABLE Publisher (
  publisherID int primary key,
  publisherName varchar(30),
  city varchar(20),
  bookID int,
  constraint bookID1_fk foreign key (bookID) references Book(bookID)
);
describe Publisher;

insert into Publisher (publisherID,publisherName,city ) values(1,'William ','london');
insert into Publisher (publisherID,publisherName,city ) values(2,'Sons','london');
insert into Publisher (publisherID,publisherName,city ) values(3,'The Bodley Head','Italia');
insert into Publisher (publisherID,publisherName,city ) values(4,'John Lane','new york');
insert into Publisher (publisherID,publisherName,city ) values(5,'Dodd, Mead & Co','new york');
insert into Publisher (publisherID,publisherName,city ) values(6,'Doubleday','Paris');
insert into Publisher (publisherID,publisherName,city ) values(7,'Auckland University Press','Gregg Press');
insert into Publisher (publisherID,publisherName,city ) values(8,'Rinehart','Turkish');
insert into Publisher (publisherID,publisherName,city ) values(9,'Arno Press','Italia');
insert into Publisher (publisherID,publisherName,city ) values(10,'AmazonEncore','Paris');

describe Publisher;

CREATE TABLE Written (
  bookauthorID int ,
  bookID int ,
 constraint Written_fk  foreign key (bookauthorID) references bookauthor(bookauthorID),
 constraint Written1_fk  foreign key (bookID) references book(bookID)

);
describe Written;


select * from profile;
select * from Book;
select * from Publisher;
select * from BookAuthor;
SELECT DISTINCT publisherName FROM Publisher;
SELECT catDescription,title FROM Book WHERE catDescription='Humor' or catDescription='Crime' ;
SELECT publisherName,city FROM Publisher WHERE city='london' and publisherName='William' ;
SELECT * FROM Publisher WHERE NOT city='Italia';
SELECT * FROM BookAuthor WHERE NOT bookauthorID=3;
SELECT * FROM profile ORDER BY Name,email;
select title, rate,catDescription from Book where rate between '70'and '100';
SELECT * FROM profile WHERE NOT Name='ahmed';
SELECT publisherName FROM Publisher ORDER BY publisherName;
SELECT * FROM BookAuthor WHERE authouName='James Joyce' or authouName='Agatha Christie' ;
SELECT title FROM Book ORDER BY rate;
SELECT * FROM Book WHERE rate=70 or rate=70 ;
SELECT * FROM Book WHERE NOT rate=90;
SELECT DISTINCT catDescription FROM Book;
SELECT DISTINCT authouName FROM BookAuthor;
select title, rate from Book where rate>70;

SELECT publisherName FROM Publisher ORDER BY city;
select title, rate,count(rate) as COUNT from Book group by rate ;
select  rate,sum(rate) as SUM from Book  group by rate ;
select  rate,max(rate) as MAX  from Book group by rate ;
select  rate,min(rate) as MIN from Book group by rate ;

select title from Book where title like 'T%'group by title;
select title,rate from Book group by rate;
select Name,email from profile group by Name;

select title,Name from Book inner join profile where Book.rate = '70' AND  profileID=3 ;
select publisherName,title from Publisher inner join Book where Publisher.publisherID = Book.bookID;
select title, rate,authouName from Book inner join BookAuthor where rate='90' group by title;
SELECT catDescription, publisherName FROM Book  LEFT JOIN Publisher ON Book.bookID = Publisher.publisherID where publisherID=5 ;
SELECT title, publisherName FROM Book  LEFT JOIN Publisher ON Book.bookID = Publisher.publisherID WHERE publisherName IS NOT NULL and publisherID=2 group by  publisherName;
select publisherName,rate from Publisher inner join Book on Publisher.publisherID=Book.bookID  where rate between '70'and '100' group by publisherName  having publisherName='AmazonEncore';



   update Book set catDescription='hhhh' where rate=50;
   update BookAuthor set authouName='rahma' where bookauthorID=3;
   update publisher set publisherName='Elixir Press' where publisherID=9;
   update profile set Name='ali' where profileID=1;
   update Book set catDescription='history' where rate=30;
   delete  from book where rate=50;
   delete  from publisher where publisherID=7;
   delete  from book where catDescription='Classic';
   delete  from book where rate=30;
   alter table BookAuthor add row  int ;
   alter table profile add adress varchar(50);
   alter table publisher add pub varchar(50);
   alter table publisher modify pub varchar(50);





      
     


     
    





  





