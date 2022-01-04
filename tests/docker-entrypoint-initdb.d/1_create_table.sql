create database in_system;


\c in_system


create table users (
  id serial not null
  , name character varying not null
  , constraint users_PKC primary key (id)
) ;