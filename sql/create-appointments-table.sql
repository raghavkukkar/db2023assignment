create table appointments(
  id  serial primary key,
  vehicle_id varchar(15),
  ap_type varchar ,
  schedule_date date not null,
  schedule_time time not null,
  end_time timestamp without time zone,
  start_time timestamp without time zone,
  customer_comments varchar ,
  feedback varchar,
  ap_status varchar not null,
  constraint app_vehicle_fkey foreign key (vehicle_id) references customer_vehicle(reg_number) on delete cascade
);