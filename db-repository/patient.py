import sqlite3
from pprint import pprint
import models

# Keep fields in array so we can populate patient_dict
PATIENT_FIELDS = [
	"patient_id",	
	"ssn", 
	"first_name",
	"middle_name",
	"last_name",
	"date_of_birth",
	"height",
	"weight",
	"next_of_kin",
	"home_phone",
	"work_phone",
	"health_insurance",	
	"vaccination",	
	"vaccination_date",
	"drugs_alchohol",	
	"sexually_active",	
	"allergies",	
	"blood_type",	
	"notes"
]


# QUERIES NEEDED FOR PATIENTS (FLUSH OUT)
INSERT_QUERY = "INSERT INTO PATIENT (ssn, first_name,middle_name,last_name,date_of_birth, height, weight, next_of_kin, home_phone, work_phone, symptoms, health_insurance, vaccination, vaccination_date, drugs_alchohol, sexually_active, allergies, blood_type, notes) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"
VIEW_PATIENTS_QUERY = "SELECT * FROM PATIENT;"; 


# Create Patient
def create_patient(patient_fields: dict) -> bool:
	"""
		Since there's alot of fields. patient_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in patient_fields:
		values.append(patient_fields[val])

	# convert to tuple
	values = tuple(values)
	print("DATABASE TUPLE")
	print(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_QUERY, values)
		db.commit()
		print("Created Patient: ")
		result = True
	except Exception as e:
		print("Error in creating patient: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_patients():
	patients = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_PATIENTS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in PATIENT_FIELDS:
				temp_dict[field] = i[count]
				count += 1

			patient = models.Patient(temp_dict)
			patients.append(patient)
	
	except Exception as e:
		print("Error in viewing patient: {}".format(e))
		db.rollback()
	db.close()

	return patients

	
	

	

