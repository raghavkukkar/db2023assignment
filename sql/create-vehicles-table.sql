create type vehicle_types as ENUM ('TWO' , 'FOUR');
create type engine_types as ENUM ('D' , 'P');
create table vehicle_db (
  model_id serial primary key,
  vtype vehicle_types not null,
  manufacturer varchar(20) ,
  model_name varchar(20) not null,
  model_year smallint not null,
  engine engine_types not null
);