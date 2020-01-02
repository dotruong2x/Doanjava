create database Student_manager;
use Student_manager;
drop database student_manager;
drop table Class;
create table Class(
   Id_class int(11) primary key auto_increment,
   Name varchar(50) not null ,
   Id_teacher int(11) not null ,
   FOREIGN KEY (Id_teacher) REFERENCES Teacher(Id_teacher)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into Class(Name , Id_teacher) values("C1808I" , 1),
										   ("C1808L" , 2),
										   ("C1808G" , 3),
										   ("C1808H" , 4);
drop table Teacher;
create table Teacher(
   Id_teacher int(11) primary key auto_increment,
   Name varchar(50) not null ,
   DOB varchar(50) not null ,
   Email varchar(50) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into Teacher(Name , DOB , Email) values 
("Lê Việt Bách" , "12/3/1987"  , "bach@gmail.com"),
("Nguyễn Đức Hoàng" , "14/5/1989"  , "hoang@gmail.com"),
("Đỗ Quang Thơ" , "15/10/1985"  , "tho@gmail.com"),
("Nguyễn Ngọc Duy" , "20/8/1988"  , "duy@gmail.com");

drop  table Student;
create table Student(
   Id_student int(11) primary key auto_increment,
   Name varchar(50) not null ,
   Id_class int(11) not null ,
   DOB varchar(50) not null ,
   Email varchar(50) not null,
   FOREIGN KEY (Id_class) REFERENCES Class(Id_class)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
Insert into Student(Name , Id_class  , DOB , Email ) 
                          values("Linh" , 1 , "28/08/2000" , "linh@gmail.com"),
                                 ("Hiếu", 2 , "29/10/2000" , "hieu@gmail.com"),
                                 ("Sơn" , 3 , "20/07/2000" , "son@gmail.com"),
                                 ("Mai" , 4 , "28/10/1998" , "mai@gmail.com");
create table Mark(
Id_mark int(11) primary key auto_increment,
Mark double not null ,
Id_subject int(11) not null , 
Id_student int(11) not null,
FOREIGN KEY (Id_subject) REFERENCES Subject(Id_subject),
FOREIGN KEY (Id_student) REFERENCES Student(Id_student)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into Mark(Mark , Id_student , Id_subject) values(8 , 4 , 1 );
insert into Mark(Mark , Id_student , Id_subject) values(7 , 1 , 3 ),
                                                    (9 , 3 , 3 ),
                                                    (9 , 4 , 2 );

create table Subject(
Id_subject int(11) primary key auto_increment,
Name varchar(50) not null 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into Subject(name ) values("C"),
								("PHP" ),
								("HTML"),
								("Java" );
	SELECT s.Id_student , s.Name , c.Name , s.DOB , s.Email  FROM Student as s JOIN Class as c ON s.Id_class = c.Id_class;
SELECT * From Student;
SELECT * FROM Mark;

SELECT s.Id_student , s.Name , sj.Name , m.mark  FROM Mark as m 
JOIN Subject as sj ON m.Id_Subject = sj.Id_subject
JOIN Student as s ON m.Id_Student = s.Id_student;

SELECT c.Id_class, c.Name, t.Name FROM Class as c JOIN Teacher as t where c.Id_teacher = t.Id_teacher;

select * from Class;

SELECT s.Id_student , s.Name , m.mark  , s.Email  FROM Student as s JOIN Class as c ON s.Id_class = c.Id_class;
Select m.Id_mark , s.Name , m.Mark, m.Id_subject  from Mark as m join Student as s; 
