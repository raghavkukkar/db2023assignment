/*new customer*/
insert into customer (first_name , last_name , dob , addressline1 , addressline2 , zipcode , phone_number , email) 
values () returning  id;

/*new customer vehicle*/
insert into customer_vehicle (reg_number , customer_id , model_id , engine_number , chasis_number , sold_on)
values ();

/*new appointment*/

insert into appointments (vehicle_id , ap_type , schedule_date , schedule_time , customer_comments , ap_status )
values ();

/*new zipcode*/
insert into zipcodes (zipcode , city , area) 
values ();

/*new vehicle*/
insert into vehicle_db (vtype , manufacturer , model_name , model_year , engine)
values ();

/*employee*/

insert into employee (pan , first_name , last_name , addressline1 , addressline2 , zipcode , joining_date , position , ph_number , email , gender)
values ();

/*spare part db*/

insert into spare_parts (sname , model_id , price) 
values ();

/*spare_part_inventory*/
insert into spare_part_inventory (sname , model_id )
values ();

/*user*/

insert into app_user (emp_id , pass_hash , app_role )
values ();

/*service job*/
insert into service_job (app_id , emp_working , stype , service_status )
values ();