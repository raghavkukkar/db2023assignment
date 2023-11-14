create table employee(
  id serial primary key,
  pan varchar not null,
  first_name varchar(20) not null,
  last_name varchar(20) not null,
  addressline1 varchar(30) not null,
  addressline2 varchar(30),
  zipcode integer not null,
  joining_date date not null,
  position varchar not null,
  exit_date varchar ,
  ph_number varchar(10) not null,
  email varchar not null,
  gender varchar,
  constraint employee_zipcode_fkey foreign key (zipcode) references zipcodes (zipcode)
);