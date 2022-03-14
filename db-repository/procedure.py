import sqlite3
from pprint import pprint

# Keep fields in array so we can populate intake_dict
PROCEDURE_FIELDS = [
	"room_id",	
	"cost",
    "notes",
    "name"
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_PROCEDURE_QUERY = "INSERT INTO PROCEDURE (room_id, cost, notes, name) values(?,?,?,?);"
VIEW_PROCEDURES_QUERY = "SELECT * FROM PROCEDURE;"; 
DELETE_PROCEDURE_QUERY = "DELETE FROM PROCEDURE where procedure_id=?"; 
DELETE_ALL_PROCEDURES_QUERY = "DELETE  FROM PROCEDURE;"; 


# Create Patient
def create_procedure(procedure_fields: dict) -> bool:
	"""
		Since there's alot of fields. procedure_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in procedure_fields:
		values.append(procedure_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_PROCEDURE_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating procedure: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_procedures():
	procedures = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_PROCEDURES_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in procedure_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
            
			#procedure = models.IntakePatient(temp_dict)
			#procedures.append(patient)
	
	except Exception as e:
		print("Error in viewing intake patient: {}".format(e))
		db.rollback()
	db.close()

	return procedures


def delete_procedure(procedure_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		print("INTAKE PATIENT ID: ", procedure_id)
		cur = db.cursor()
		cur.execute(DELETE_PROCEDURE_QUERY, (procedure_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_procedures():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_PROCEDURES_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result
        
