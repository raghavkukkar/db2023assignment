create table spare_parts (
  sname varchar,
  model_id integer,
  price integer not null,
  constraint spare_part_pkey primary key (sname,model_id),
  constraint spare_part_fkey foreign key (model_id) references vehicle_db(model_id)  on delete cascade
);