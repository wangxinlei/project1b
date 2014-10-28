CREATE TABLE Movie(id int, title varchar(100) NOT NULL, year int, rating varchar(10), company varchar(50), primary key (id), CHECK(year > 0));
#every movie has a unique id;
#the year should be greater than 0
CREATE TABLE Actor(id int, last varchar(20), first varchar(20), sex varchar(6), dob date NOT NULL, dod date, primary key (id),CHECK(sex = 'Male' OR sex = 'Female'));
#every actor has a unique id;
#the sex should be either male or female
CREATE TABLE Director(id int, last varchar(20), first varchar(20), dob date, dod date, primary key (id), CHECK(id > 0));
#every director has a unique id
#the id should be greater than 0
CREATE TABLE MovieGenre(mid int references Movie(id), genre varchar(20)) ENGINE = INNODB; 
#every movie id should exist in the Movie table
CREATE TABLE MovieDirector(mid int references Movie(id), did int references Director(id)) ENGINE = INNODB;
#every movie id should exist in the Movie table
#every director id should exist in the Director table
CREATE TABLE MovieActor(mid int references Movie(id), aid int references Actor(id), role varchar(50)) ENGINE = INNODB;
#every movie id should exist in the Movie table
#every actor id should exist in the Actor table
CREATE TABLE Review(name varchar(20), time timestamp, mid int references Movie(id), rating int, comment varchar(500)) ENGINE = INNODB;
#every movie id should exist in the Movie table
CREATE TABLE MaxPersonID(id int);
CREATE TABLE MaxMovieID(id int);