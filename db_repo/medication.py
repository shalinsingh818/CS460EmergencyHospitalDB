import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
import models

# Keep fields in array so we can populate intake_dict
MEDICATION_FIELDS = [
	"medication_id",	
	"code",
    "name",
    "price"
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_MEDICATION_QUERY = "INSERT INTO MEDICATION (cost, notes, name) values(?,?,?);"
VIEW_MEDICATIONS_QUERY = "SELECT * FROM MEDICATION;"; 
DELETE_MEDICATION_QUERY = "DELETE FROM MEDICATION where medication_id=?"; 
DELETE_ALL_MEDICATION_QUERY = "DELETE  FROM MEDICATION;"; 


# Create Patient
def create_medication(medication_fields: dict) -> bool:
	"""
		Since there's alot of fields. medication_fields is a dictionary that can be
		passed to this method for testing. 
	"""
    # bind values, by automatically appending dict vals to tuple
	result = False
	values = []
	for val in medication_fields:
		values.append(medication_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_MEDICATION_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating medication: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_medications():
	medications = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_MEDICATIONS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in MEDICATION_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
            
			#medication = models.IntakePatient(temp_dict)
			#medications.append(patient)
	
	except Exception as e:
		print("Error in viewing medications: {}".format(e))
		db.rollback()
	db.close()

	return medications


def delete_medication(medication_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		print("medication ID: ", medication_id)
		cur = db.cursor()
		cur.execute(DELETE_MEDICATION_QUERY, (medication_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting medication: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_medications():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_MEDICATIONS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting medications: {}".format(e))
		db.rollback()

	db.close()

	return result






