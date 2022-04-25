from flask import Flask
from flask_restful import Resource, Api, request
from pprint import pprint
import json
# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.results as re


class CreateResultType(Resource):

	def __init__(self):
		pass


	# view test test results by patient id	
	def get(self):
		tests = [] 
		intake_id = request.args.get('patient', default=1, type=int)
		test_results = re.view_test_types(intake_id)
		for field in test_results:
			test_result_obj = re.view_test_result_by_id(field["test_id"])
			tests.append(test_result_obj)

		return tests


	# create intake patient
	def post(self):
		if request.method == 'POST':
			data = json.loads(request.data)
			pprint(data)
			result = re.create_test_type(data)
			if result:
				return {
					"message": "created test type"
				}

			return {
				"error": "Could not create test type"
			}
		else:
			return {
				"error": "not a post request"
			}



class CreateTestField(Resource):

	def __init__(self):
		pass


	# view fields for test result	
	def get(self):
		test_field_results = [] 
		test_id = request.args.get('result', default=1, type=int)
		test_fields = re.view_test_fields(test_id)
		for field in test_fields:
			test_field_obj = re.view_field_by_id(field["field_id"])
			test_field_results.append(test_field_obj)

		return test_field_results
			

	# create intake patient
	def post(self):
		if request.method == 'POST':
			data = json.loads(request.data)
			result = re.create_test_field(data)
			if result:
				return {
					"message": "created test type"
				}

			return {
				"error": "Could not create test type"
			}
		else:
			return {
				"error": "not a post request"
			}


