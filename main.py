from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import controllers.patient as patientController


app = Flask(__name__)
api = Api(app)


# patients
api.add_resource(patientController.Patient, '/createPatient')

if __name__ == '__main__':
   app.run(debug=True)
