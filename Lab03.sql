
use lab03;
#  Question1

create table person(driver_id char(4) primary key,
name varchar(30),
address varchar(30)
);
create table car(reg_no char(15) primary key,
model char(20),
year int(4)
);
create table accident(report_no int primary key,
acc_date date,
location varchar(30)
);
create table owns(driver_id char(4),
reg_no char(15),
FOREIGN KEY (driver_id) REFERENCES person(driver_id),
FOREIGN KEY (reg_no) REFERENCES car(reg_no)
);
create table participated( driver_id char(4), 
reg_no char(15),
report_no int ,
FOREIGN KEY (driver_id) REFERENCES person(driver_id),
FOREIGN KEY (reg_no) REFERENCES car(reg_no),
FOREIGN KEY (report_no) REFERENCES accident(report_no),
damage_amt int(10)
);




insert into person values('1234','amith','no a-1-12 koppal');
insert into person values('2345','anil','23 vijaya apts');
insert into person values('3412','john','no 3423 vicky apts');
insert into person values('4567','arun','kamal nivas koppal');
insert into person values('4522','sunil','no 54 ravi nagar');
insert into car values('ka37k32','hyundai',2004);
insert into car values('ka05d34','maruti 800',1998);
insert into car values('ka23j90','zen',2002);
insert into car values('ka35f45','fiat',2001);
insert into car values('ka36m78','benz',2000);
insert into accident values(12,'1990-02-12','vit cross');
insert into accident values(34,'1999-01-31','jayanagar');
insert into accident values(56,'1998-12-12','btm layout');
insert into accident values(67,'2003-07-07','jp nagar');
insert into accident values(87,'2001-05-01','allalsandra');
insert into owns values('1234','ka37k32');
insert into owns values('2345','ka05d34');
insert into owns values('3412','ka23j90');
insert into owns values('4567','ka35f45');
insert into owns values('4522','ka36m78');
insert into participated values('1234','ka37k32',12,12000);
insert into participated values('2345','ka05d34',34,13000);
insert into participated values('3412','ka23j90',56,14000);
insert into participated values('4567','ka35f45',67,12450);
insert into participated values('4522','ka36m78',87,10000);

select * from person;
select * from car;
select * from accident;
select * from owns;
select * from  participated;
select * from person;
select * from car;
select * from accident;
select * from owns;
select * from  participated;
#queries
/* 3a */


Update participated set damage_amt = 25000 where report_no = 12;
/* 3b */

Insert into participated values('1004','2004',10,3000);

/* 4 */

Select count(*) from accident where acc_date LIKE '2006-%-%';

/* 5 */

Select count(*) from car c ,participated p where c.reg_no=p.regno and c.model = 'benz';



#  Question2
create table publisher
(
    Publisher_Name varchar(30),
    address varchar(30) not null,
    phone varchar(12),
    primary key(Publisher_Name)
);

create table book
(
    Book_id int not null,
    Title varchar(20),
    Publisher_Name varchar(20) ,
    Pub_Year int,
    Primary key(Book_id,Publisher_Name),
    foreign key(Publisher_Name) references publisher(Publisher_Name)
);

create table book_authors
(
    Book_id int not null,
    Author_name varchar(30),
    primary key(Book_id),
    foreign key(Book_id) references book(Book_id)
);

create table library_branch
(
    Branch_Id int,
    Branch_Name varchar(20) ,
    address varchar(200),
    primary key(Branch_Id)
);

create table book_lending
(
    Book_Id int,
    Branch_Id int,
    Card_No int,
    Date_Out date,
    Due_Date date ,
    primary key(Book_Id,Branch_Id,Card_No),
    foreign key(Book_Id) references book(Book_Id),
    foreign key(Branch_Id) references library_branch(Branch_Id)
);

create table bookcopies
(
    Book_Id int,
    Branch_Id int,
    noofcopies int,
    primary key(Book_Id,Branch_Id),
    foreign key(Book_Id) references book(Book_Id),
    foreign key(Branch_Id) references library_branch(Branch_Id)
);


INSERT INTO PUBLISHER VALUES ('MCGRAW-HILL', 'BANGALORE', 9989076587);
INSERT INTO PUBLISHER VALUES ('PEARSON', 'NEWDELHI', 9889076565);
INSERT INTO PUBLISHER VALUES ('RANDOM HOUSE', 'HYDRABAD', 7455679345);
INSERT INTO PUBLISHER VALUES ('HACHETTE LIVRE', 'CHENAI', 8970862340);
INSERT INTO PUBLISHER VALUES ('GRUPO PLANETA', 'BANGALORE', 7756120238);

INSERT INTO BOOK VALUES (1, 'DBMS', 'MCGRAW-HILL', 2017);
INSERT INTO BOOK VALUES (2, 'ADBMS', 'MCGRAW-HILL', 2016);
INSERT INTO BOOK VALUES (3, 'CN', 'PEARSON', 2016);
INSERT INTO BOOK VALUES (4, 'CG', 'GRUPO PLANETA', 2015);
INSERT INTO BOOK VALUES (5, 'OS', 'PEARSON', 2016);

INSERT INTO BOOK_AUTHORS VALUES (1, 'NAVATHE');
INSERT INTO BOOK_AUTHORS VALUES (2, 'NAVATHE');
INSERT INTO BOOK_AUTHORS VALUES (3, 'TANENBAUM');
INSERT INTO BOOK_AUTHORS VALUES (4, 'EDWARD ANGEL');
INSERT INTO BOOK_AUTHORS VALUES (5, 'GALVIN');

INSERT INTO LIBRARY_BRANCH VALUES (10, 'RR NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (11, 'RNSIT', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (12, 'RAJAJI NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (13, 'NITTE', 'MANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (14, 'MANIPAL', 'UDUPI');

INSERT INTO book_lending VALUES (1,10, 101, '17-01-01', '01-06-12');
INSERT INTO book_lending VALUES (3, 14, 101, '17-01-11', '13-03-12');
INSERT INTO book_lending VALUES (2, 13, 101, '17-02-17', '21-04-12');
INSERT INTO book_lending VALUES (4, 11, 101, '17-03-15', '17-04-15');
INSERT INTO book_lending VALUES (1, 11, 104, '17-04-12', '17-05-12');

INSERT INTO BOOKCOPIES VALUES (1, 10,10);
INSERT INTO BOOKCOPIES VALUES (1, 11,5);
INSERT INTO BOOKCOPIES VALUES (2, 12,2);
INSERT INTO BOOKCOPIES VALUES (2, 13,5);
INSERT INTO BOOKCOPIES VALUES (3, 14,7);
INSERT INTO BOOKCOPIES VALUES (5, 10,1);
INSERT INTO BOOKCOPIES VALUES (4, 11,3);

/* q1 */
SELECT
    book.Book_Id,
    book.Title,
    book.Publisher_Name,
    bookcopies.noofcopies,
    book_authors.Author_name AS 'Author Name'
FROM
    book,
    bookcopies,
    book_authors
WHERE
    book.Book_Id = book_authors.Book_Id
        AND bookcopies.Book_Id = book.Book_Id;

/* q2 */
Select *
from book
where Book_Id in (
    Select Book_Id
    from book_lending
    where Card_No LIKE (
        SELECT Card_No
        FROM book_lending
        WHERE Date_Out BETWEEN '2017-01-01' AND '2017-06-30'
        GROUP BY Card_No HAVING COUNT(*) > 3
        )
    )
;


/* q3 */
DELETE FROM book WHERE Book_Id = 1;
SELECT * FROM book_lending;

/* q4 */
Select * from book, bookcopies
where (
    book.Book_id in (
        SELECT bookcopies.Book_Id
        FROM book, bookcopies
        WHERE book.Book_Id = bookcopies.Book_Id
        GROUP BY book.Book_Id)
    )
and book.Book_Id = bookcopies.Book_Id ;


 
