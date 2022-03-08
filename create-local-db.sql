DROP DATABASE IF EXISTS local_db;

CREATE DATABASE database;

USE database;

DROP TABLE IF EXISTS books;

CREATE TABLE books (
  id int(10) NOT NULL,
  title varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
);

INSERT INTO books VALUES(1, 'Book 1');
INSERT INTO books VALUES(2, 'Book 2');
