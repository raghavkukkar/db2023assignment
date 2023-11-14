create table spare_part_inventory (
  id serial primary key,
  sname varchar not null,
  model_id integer not null,
  service_id integer,
  constraint spare_part_inventory_fkey foreign key (sname , model_id) references spare_parts (sname ,model_id) on delete cascade,
  constraint spare_part_inventory_Service_job_fkey foreign key (service_id) references service_job (id) on delete cascade
)