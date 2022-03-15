from flask import Flask
from flask_restful import Resource, Api, request
from datetime import date

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.intake as pi


class Intake(Resource):

	def __init__(self):
		pass

	def get(self):
		intake_patient_list = []
		intake_patients = pi.view_intake_patients()
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return {
			"intake_patients": intake_patient_list
		}

	def to_form_fields(self, request):	
		ambulance = request.form.get('ambulance')
		blood_pressure = request.form.get('blood_pressure')	
		notes = request.form.get('notes')
		patient_id = request.args.get('patient', default=1, type=int)

		# create patient in database
		dict_input = {	
			"patient_id": patient_id,
			"blood_pressure": blood_pressure,	
			"notes": notes,
			"date_posted": date.today(),
		}

		return dict_input

	
	def post(self):
		if request.method == 'POST':
			capture_fields = self.to_form_fields(request)
			# capturing from postman
			result = pi.create_intake_patient(capture_fields)

			# check if creating patient worked
            if result:
                return {
                    "message": "created intake patient"
                }

            return {
                "error": "Could not create patient"
            }
        else:
            return {
                "error": "Not a post request"
            }


