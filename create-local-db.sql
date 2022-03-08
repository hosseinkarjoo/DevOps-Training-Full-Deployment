DROP DATABASE IF EXISTS local_db;

CREATE DATABASE database;
GRANT usage on *.* to root@devops-training-ap-Flask identified by '123@qwerR'
USE database;

DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id int(10) NOT NULL,
  title varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
);

INSERT INTO books VALUES(1, 'Book 1');
INSERT INTO books VALUES(2, 'Book 2');
