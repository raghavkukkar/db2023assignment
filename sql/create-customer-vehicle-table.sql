create table customer_vehicle (
reg_number varchar(15) primary key,
customer_id integer not null,
model_id integer not null,
engine_number varchar,
chasis_number varchar,
sold_on date,
constraint customer_fkey foreign key (customer_id) references customers(id)  on delete cascade,
constraint model_fkey foreign key (model_id) references vehicle_db (model_id)
);