import unittest
import medication as med
from pprint import pprint
from datetime import date

class TestCriticarePatientMethods(unittest.TestCase):

	def test_get_patient_medications_cost(self):
	
		result = med.view_intake_medications(1)
		if result:
			print("# PASSED CREATE PATIENT: ")

		pprint(result)


if __name__ == '__main__':
    unittest.main()

