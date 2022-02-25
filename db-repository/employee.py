import sqlite3
from pprint import pprint

# Keep fields in array so we can populate employee_dict
EMPLOYEE_FIELDS = [
	"first_name",
    "middle_name",
    "last_name",
    "permission_id"
]


# QUERIES NEEDED FOR employeeS (FLUSH OUT)
INSERT_EMPLOYEE_QUERY = "INSERT INTO EMPLOYEE (first_name,middle_name,last_name,permission_id) values(?,?,?,?);"
VIEW_EMPLOYEE_QUERY = "SELECT * FROM EMPLOYEE;"; 
DELETE_EMPLOYEE_QUERY = "DELETE  FROM EMPLOYEE where employee_id=?"; 
DELETE_ALL_EMPLOYEE_QUERY = "DELETE  FROM EMPLOYEE;"; 


# Create employee
def create_employee(employee_fields: dict) -> bool:
	"""
		Since there's alot of fields. employee_fields is a dictionary that can be
		passed to this method for testing. 
	"""
	result = False
	# bind values, by automatically appending dict vals to tuple
	values = []
	for val in employee_fields:
		values.append(employee_fields[val])

	# convert to tuple
	values = tuple(values)

	# insert to db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(INSERT_EMPLOYEE_QUERY, values)
		db.commit()
		result = True
	except Exception as e:
		print("Error in creating employee: {}".format(e))
		db.rollback()

	db.close()
	return result


def view_employees():
	employees = [] 	
	# open db
	db = sqlite3.connect("data/criticare.db")
	try:
		cur = db.cursor()
		cur.execute(VIEW_EMPLOYEE_QUERY)
		for i in cur:
			# render row entry into employee class model
			temp_dict = {}	
			count = 0 
			for field in EMPLOYEE_FIELDS:
				temp_dict[field] = i[count]
				count += 1
			pprint(temp_dict)
			#employee = models.Employee(temp_dict)
			#employees.append(employee)
			employees.append(temp_dict)	
	except Exception as e:
		print("Error in viewing employee: {}".format(e))
		db.rollback()
	db.close()

	return employees


def delete_employee(employee_id):
	result = False
	db = sqlite3.connect("data/criticare.db")

	try:
		print("employee ID: ", employee_id)
		cur = db.cursor()
		cur.execute(DELETE_EMPLOYEE_QUERY, (employee_id,))
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting employee: {}".format(e))
		db.rollback()

	db.close()

	return result

	
	
def delete_all_employees():
	result = False
	db = sqlite3.connect("data/criticare.db")
	
	try:
		cur = db.cursor()
		cur.execute(DELETE_ALL_EMPLOYEE_QUERY)
		db.commit()
		result = True
	except Exception as e:
		print("Error in deleting employee: {}".format(e))
		db.rollback()

	db.close()

	return result
        
