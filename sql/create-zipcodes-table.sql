create type area_type as ENUM ('NORTH','WEST','SOUTH','EAST');
create table zipcodes (
  zipcode integer primary key,
  city varchar(20) not null,
  area area_type not null
);