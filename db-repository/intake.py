import sqlite3
from pprint import pprint
import models

# Keep fields in array so we can populate intake_dict
INTAKE_FIELDS = [
	"intake_id",	
	"patient_id",
    "blood_pressure",
    "notes",
    "date_created"
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_INTAKE_QUERY = "INSERT INTO INTAKE_PATIENT (blood_pressure, notes, date_created) values(?,?,?);"
VIEW_INTAKE_PATIENTS_QUERY = "SELECT * FROM INTAKE_PATIENT;"; 
DELETE_INTAKE_PATIENT_QUERY = "DELETE FROM INTAKE_PATIENT where intake_id=?"; 
DELETE_ALL_INTAKE_PATIENTS_QUERY = "DELETE  FROM INTAKE_PATIENT;"; 


# Create Patient
def create_intake_patient(intake_patient_fields: dict) -> bool:
	"""
		Since there's alot of fields. intake_patient_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in intake_patient_fields:
		values.append(intake_patient_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_INTAKE_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating intake patient: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_intake_patients():
	intake_patients = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_INTAKE_PATIENTS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in INTAKE_PATIENT_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
            
			#intake_patient = models.IntakePatient(temp_dict)
			#intake_patients.append(patient)
	
	except Exception as e:
		print("Error in viewing intake patient: {}".format(e))
		db.rollback()
	db.close()

	return intake_patients


def delete_intake_patient(intake_patient_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	DELETE_PATIENT_QUERY = "DELETE FROM INTAKE_PATIENT WHERE intake_id=?;"; 
	
	try:
		print("INTAKE PATIENT ID: ", intake_patient_id)
		cur = db.cursor()
		cur.execute(DELETE_INTAKE_PATIENT_QUERY, (intake_patient_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_intake_patients():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_INTAKE_PATIENTS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result
        