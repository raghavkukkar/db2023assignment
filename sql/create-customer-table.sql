create table customers (
  id serial primary key,
  first_name varchar(20) not null,
  last_name varchar(20) not null,
  dob timestamp without time zone,
  addressline1 varchar(30) not null,
  addressline2 varchar(30),
  zipcode integer not null,
  phone_number varchar(10) not null,
  email varchar,
  constraint customer_zipcode_fkey foreign key (zipcode) references zipcodes (zipcode)
 );