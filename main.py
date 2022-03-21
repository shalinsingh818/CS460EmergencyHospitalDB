from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import controllers.patient as patientController
import controllers.intake as intakeController
import controllers.results as resultController
import controllers.employee as employeeController
import controllers.medication as medicationController
import controllers.procedure as procedureController
import controllers.room as roomController
import controllers.med_condition as conditionController

app = Flask(__name__)
api = Api(app)

# patients
api.add_resource(patientController.Patient, '/patient')

# intake
api.add_resource(intakeController.Intake, '/intakePatient')
api.add_resource(intakeController.PrescribeMedication, '/prescribeMedication')
api.add_resource(intakeController.AssignPatientProcedure, '/patientProcedure')
api.add_resource(intakeController.DiagnosePatient, '/diagnose')


# results
api.add_resource(resultController.Result, '/result')

# employees
api.add_resource(employeeController.Employee, '/employees')

# medications
api.add_resource(medicationController.Medication, '/medications')

# procedures
api.add_resource(procedureController.Procedure, '/procedures')

# room
api.add_resource(roomController.Room, '/room')

# conditions
api.add_resource(conditionController.MedicalCondtion, '/conditions')

if __name__ == '__main__':
   app.run(debug=True)
