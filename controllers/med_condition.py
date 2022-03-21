from flask import Flask
from flask_restful import Resource, Api, request

# go to desired directory
import sys
sys.path.append("../")

# imports 
import db_repo.medical_condition as me


class MedicalCondtion(Resource):

    def __init__(self):
        pass

    def get(self):
        conditions_list = []
        results = me.view_conditions()
        for result in results:
          conditions_list.append(result)

        return {
          "conditions": conditions_list
        }


    def to_form_fields(self):
        # capturing from postman
        name = request.form.get('name')
        code  = request.form.get('code')


        # create employee in database
        dict_input = {
            "name": name,
            "code": code, 

        } 


        return dict_input

    def post(self):
        if request.method == 'POST':
            # capturing from postman
            capture_fields = self.to_form_fields()
            # capturing from postman
            result = me.create_medical_condition(capture_fields)
            if result:
                print("# PASSED CREATE RESULT: ")

            return {
                "message": "created medical condition for database"
            }
            return {
                "error": "Could not create medical condition"
            }

        # exception
        else:
            return {
                "error": "Not a post request"
            }
