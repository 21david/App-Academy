DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions_follows;


PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id integer primary key,
    fname varchar,
    lname varchar
);

CREATE TABLE questions(
    id integer primary key,
    title varchar,
    body text,
    user_id integer not null,

    foreign key (user_id) references users(id)
);

CREATE TABLE questions_follows (
    id integer primary key,
    user_id integer not null,
    question_id integer not null,
    
    foreign key(user_id) references users(id)
    foreign key(question_id) references questions(id)

);

CREATE table replies(
    id integer primary key,
    question_id integer not null,
    parent_reply_id integer,
    user_id integer not null,
    body text not null,
    
    foreign key (question_id) references questions(id),
    foreign key (parent_reply_id) references replies(id),
    foreign key (user_id) references users(id)
);

CREATE TABLE question_likes (
    id integer primary key,
    user_id integer not null,
    question_id integer not null

);


INSERT INTO 
    users (fname, lname)
VALUES
    ('David', 'Espinosa'),
    ('Sunny', 'Mei');


INSERT INTO
    questions (title, body, user_id)
VALUES
    ('Help with sqlite', 'I need help installing sqlite3', 1);




INSERT INTO
    questions_follows (user_id,question_id)
VALUES
    (1,1);

INSERT INTO
     replies (question_id, parent_reply_id, user_id,body)
VALUES
    (1,null,1,'I can help you with this');

INSERT INTO
     question_likes (user_id,question_id)
VALUES
    (2,1);