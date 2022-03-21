
from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.room as rom


class Room(Resource):

	def __init__(self):
		pass

	def get(self):
		room_list = []
		results = rom.view_rooms()
		for room in results:
			room_list.append(room)

		return {
			"rooms": room_list
		}


	def to_form_fields(self):
		# capturing from postman
			
		number = request.form.get('number')
		cost = request.form.get('cost')

		# dictionary as input
		dict_input = {	
			"number": number,
			"cost": cost, 
		}

		return dict_input

	def post(self):
		if request.method == 'POST':
			# capturing from postman
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = rom.create_room(capture_fields)
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
