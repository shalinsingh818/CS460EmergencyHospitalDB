from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.procedure as proc


class Procedure(Resource):

	def __init__(self):
		pass

	def get(self):
		procedure_list = []
		results = proc.view_procedures()
		for procedure in results:
			procedure_list.append(procedure)

		return {
			"procedures": procedure_list
		}


	def to_form_fields(self):
		# capturing from postman	
		room_id = request.form.get('room_id')
		cost = request.form.get('cost')
		name = request.form.get('name')
		notes = request.form.get('notes')

		# dictionary as input
		dict_input = {
			"room_id": room_id, 
			"cost": cost, 
			"notes": notes,
			"name": name
		}


		return dict_input

	def post(self):
		if request.method == 'POST':
			# capturing from postman
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = proc.create_procedure(capture_fields)
			if result:
				print("# PASSED CREATE PROCEDURE: ")

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
