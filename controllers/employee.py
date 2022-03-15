from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.employee as emp


class Employee(Resource):
	def __init__(self):
		pass

	def get(self):
		employee_list = []
		employees = pat.view_intake_employees()
		for employee in employees:
	  		employee_list.append(employee)

		return {
			"employees": employee_list
		}


	def to_form_fields(self, request):	
		# postman fields
		first_name = request.form.get('first_name')
		last_name = request.form.get('last_name')
		middle_name = request.form.get('middle_name')
		permission_id = request.form.get('permission_id')

		dict_input = {
			"first_name": first_name,
			"last_name": last_name,
			"middle_name": middle_name,
			"permission_id": permission_id
		}

		return dict_input

	
	def post(self):
		if request.method == 'POST':
			capture_fields = self.to_form_fields(request)
			# capturing from postman
			result = emp.create_employee(capture_fields)
			if result:
				print("# PASSED CREATE employee: ")
