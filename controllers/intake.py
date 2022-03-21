from flask import Flask
from flask_restful import Resource, Api, request
from datetime import date

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.intake as pi
import db_repo.medication as med
import db_repo.medical_condition as cond
import db_repo.procedure as proc

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



class PrescribeMedication(Resource):

	def __init__(self):
		pass

	def get(self):
		# view patient id
		intake_patient_id = request.args.get('patient', default=1, type=int)	
		intake_patient_list = []
		intake_patients = cond.view_intake_medications(intake_patient_id)
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return {
			"intake_patients_medications": intake_patient_list
		}

	def post(self):
		if request.method == 'POST':
			# capture fields
			intake_patient_id = request.args.get('patient', default=1, type=int)	
			medication_id = request.form.get('medication_id')
			result = cond.diagnose_medical_condition(intake_patient_id, medication_id)

			# check if creating patient worked
			if result:
				return {
					"message": "prescribed medication to patient"
				}

			return {
				"error": "Could not assign medication to patient"
			}
		else:
			return {
				"error": "Not a post request"
			}




class AssignPatientProcedure(Resource):

	def __init__(self):
		pass

	# view patient procedures
	def get(self):
		# view patient id
		intake_patient_id = request.args.get('patient', default=1, type=int)	
		intake_patient_list = []
		intake_patients = proc.view_intake_procedures(intake_patient_id)
		for patient in intake_patients:
			intake_patient_list.append(patient)

		return {
			"intake_patients_procedures": intake_patient_list
		}

	def post(self):
		if request.method == 'POST':
			# capture fields
			intake_patient_id = request.args.get('patient', default=1, type=int)	
			procedure_id = request.form.get('procedure_id')
			result = proc.assign_procedure_to_patient(intake_patient_id, procedure_id)

			# check if creating patient worked
			if result:
				return {
					"message": "assigned procedure to patient"
				}

			return {
				"error": "Could not assign procedure to patient"
			}
		else:
			return {
				"error": "Not a post request"
			}


# diagnose patient with medical condition
class DiagnosePatient(Resource):

    def __init__(self):
        pass

    def get(self):
        # view patient id
        intake_patient_id = request.args.get('patient', default=1, type=int)
        intake_patient_list = []
        intake_patients = cond.view_intake_conditions(intake_patient_id)
        for patient in intake_patients:
            intake_patient_list.append(patient)

        return {
            "intake_patients_conditions": intake_patient_list
        }

    def post(self):
        if request.method == 'POST':
            # capture fields
            intake_patient_id = request.args.get('patient', default=1, type=int)
            condition_id = request.form.get('condition_id')
            result = pi.diagnose_condition(intake_patient_id, condition_id)

            # check if creating patient worked
            if result:
                return {
                    "message": "assigned condition to patient"
                }

            return {
                "error": "Could not assign condition to patient"
            }
        else:
            return {
                "error": "Not a post request"
            }



