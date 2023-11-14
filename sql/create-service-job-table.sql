create table service_job (
  id serial primary key,
  app_id integer not null,
  emp_working integer ,
  stype varchar,
  end_time timestamp without time zone,
  start_time timestamp without time zone,
  comments varchar,
  service_status varchar not null,
  constraint service_job_appointment_fkey foreign key (app_id) references appointments(id)  on delete cascade,
  constraint service_empworking_fkey foreign key (emp_working) references employee(id)  on delete cascade
);