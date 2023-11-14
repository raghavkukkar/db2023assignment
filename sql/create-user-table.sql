create table app_user (
  emp_id integer primary key,
  pass_hash varchar not null,
  app_role varchar not null,
  constraint user_employee_fkey foreign key (emp_id) references employee(id)  on delete cascade
);