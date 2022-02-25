import sqlite3
from pprint import pprint
import models

# Keep fields in array so we can populate intake_dict
ROOM_FIELDS = [
	"room_id",	
	"cost",
    "notes",
    "name"
]


# QUERIES NEEDED FOR intakeS (FLUSH OUT)
INSERT_ROOM_QUERY = "INSERT INTO ROOM (room_id, cost, notes, name) values(?,?,?,?);"
VIEW_ROOMS_QUERY = "SELECT * FROM ROOM;"; 
DELETE_ROOM_QUERY = "DELETE FROM room where room_id=?"; 
DELETE_ALL_ROOMS_QUERY = "DELETE  FROM ROOM;"; 


# Create Patient
def create_room(room_fields: dict) -> bool:
	"""
		Since there's alot of fields. room_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in room_fields:
		values.append(room_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_ROOM_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating room: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_rooms():
	rooms = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_ROOMS_QUERY)
		for i in cur:
			# render row entry into patient class model
			temp_dict = {}	
			count = 0 
			for field in ROOM_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
            
			#room = models.IntakePatient(temp_dict)
			#rooms.append(patient)
	
	except Exception as e:
		print("Error in viewing rooms: {}".format(e))
		db.rollback()
	db.close()

	return rooms


def delete_room(room_id):
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		print("ROOM ID: ", room_id)
		cur = db.cursor()
		cur.execute(DELETE_ROOM_QUERY, (room_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting intake patient: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_rooms():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_ROOMS_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting rooms: {}".format(e))
		db.rollback()

	db.close()

	return result