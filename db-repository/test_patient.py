import unittest
import patient as pat
from datetime import date

class TestCriticareMethods(unittest.TestCase):

	def test_create_patient(self):
		
		# dictionary as input
		dict_input = {
			"ssn": 3244321, 
			"first_name": "shay", 
			"middle_name": "indel", 
			"last_name": "singh",
			"date_of_birth": "05/12/1999", 
			"height": "5 6",
			"weight": "155",
			"next_of_kin": "usha singh",
			"home_phone": "6306999717",	 
			"work_phone": "6306999717", 
			"symptoms": "idk", 
			"health_insurance": "etna", 
			"vaccination": True, 
			"vaccination_date": date.today(), 
			"drugs_alchohol": True, 
			"sexually_active": True, 
			"allergies": False, 
			"blood_type": "O", 
			"notes": "idk"
		}

		pat.create_patient(dict_input)

		# write test case to check if values are in dbi


	"""
	def test_view_patients(self):	
		# retrieve patients
		patients = pat.view_patients()
		for patient in patients:
			print(patient.test_print())
	"""



if __name__ == '__main__':
    unittest.main()
