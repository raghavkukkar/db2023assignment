/*employee by id*/
select * from employee where id = $1;


/*active appointment by customer id */

select * from appointments where vehicle_id in 
(select id from customer_vehicle where customer_id = $1) 
and (ap_status <> 'DONE'  or ap_status <> 'CANCELLED');


/*all appointments by customer id*/

select * from appointments where vehicle_id in 
(select id from customer_vehicle where customer_id = $1);

/*all appointments by vehicle id*/

select * from appointments where vehicle_id = $1;

/*generate bill for appointment*/

select * from spare_part_inventory where service_id in (select id from service_job where app_id = $1);

/* generate history of vehicle appointments*/

select * from appointments where vehicle_id = $1 and ap_status = "DONE";

/* cutomer details with and their vehicles detail*/

select * from customer 
join customer_vehicle  on customer.id = customer_vehicle.customer_id 
join vehicle_db on customer_vehicle.model_id = vehicle_db.model_id 
where id = $1;

/* get current status of appointment*/
select ap.ap_status , sj.emp_working , sj.start_time , sj,end_time, sj.service_status 
from appointments ap join service_job sj on ap.id = sj.app_id 
where ap.id = $1 ;


/* get employee info */
select * from employee where id = $1;

/* get scarse spare parts */

select sname, model_id , count(*) 
from spare_part_inventory where service_id is null 
group by sname , model_id having count(*) < 10;