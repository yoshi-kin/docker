create table if not exists users (
  id serial not null
  , name character varying not null
  , constraint users_PKC primary key (id)
) ;