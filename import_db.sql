PRAGMA foreign_keys = ON;

CREATE TABLE users(
    id integer primary key,
    fname varchar,
    lname varchar,
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

)

CREATE table replies(

    question_id integer not null
    parent_reply_id integer not null
    user_id integer not null
    

)


