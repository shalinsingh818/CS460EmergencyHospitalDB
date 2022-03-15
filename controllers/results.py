from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.results as re


class Result(Resource):
	
	def __init__(self):
		pass

	def get(self):
		result_list = []
		results = re.view_results()
		for result in results:
			result_list.append(result)

		return {
			"results": result_list
		}

	def to_form_fields(self):
		# capturing from postman
		assigned_physician = request.form.get('assigned_physician')
		blood_pressure = request.form.get('blood_pressure')
		notes = request.form.get('notes')
		procedure_id = request.form.get('procedure_id')
		result = request.form.get('result_id')
		test_type = request.form.get('test_type')

		# create employee in database
		dict_input = {
			"assigned_physician": assigned_physician,
			"notes": notes,
			"procedure_id": procedure_id,
			"result_id": result_id,
			"blood_pressure" : blood_pressure
		}

		return dict_input

	def post(self):
		if request.method == 'POST':
			# capturing from postman
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = re.create_result(capture_fields)
			if result:
				print("# PASSED CREATE RESULT: ")

				return {
					"message": "created test result for procedure"
				}
			return {
				"error": "Could not create patient"
			}

		# exception
		else:
			return {
				"error": "Not a post request"
			}
