
CREATE TABLE PATIENT (
	patient_id INTEGER PRIMARY KEY, 
	ssn INT, 
	first_name VARCHAR(255), 
	middle_name VARCHAR(255), 
	last_name VARCHAR(255), 
	date_of_birth VARCHAR(255), 
	height VARCHAR(255), 
	weight VARCHAR(255),
	next_of_kin VARCHAR(255),
	home_phone VARCHAR(255),
	work_phone VARCHAR(255),
	symptoms VARCHAR(255),
	health_insurance VARCHAR(255),
	vaccination BOOLEAN, 
	vaccination_date DATETIME,
	drugs_alchohol BOOLEAN, 
	sexually_active BOOLEAN, 
	allergies BOOLEAN, 
	blood_type VARCHAR(255),
	notes VARCHAR(255)
); 




