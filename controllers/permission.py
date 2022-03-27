from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.permission as perm


class Permission(Resource):
	
	def __init__(self):
		pass

	def get(self):
		result_list = []
		results = perm.view_permissions()
		for result in results:
			result_list.append(result)

		return {
			"permission": result_list
		}

	def to_form_fields(self):
		# capturing from postman
		name = request.form.get('name')

		# create employee in database
		dict_input = {
			"name": name,
		}

		return dict_input

	def post(self):
		if request.method == 'POST':
			# capturing from postman
			capture_fields = self.to_form_fields()
			# capturing from postman
			result = perm.create_permission(capture_fields)
			if result:
				print("# PASSED CREATE PERMISSION: ")

				return {
					"message": "created permission id"
				}
			return {
				"error": "Could not create permission"
			}

		# exception
		else:
			return {
				"error": "Not a post request"
			}
