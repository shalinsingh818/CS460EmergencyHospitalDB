import random
import json
import requests
import time
import names
from pprint import pprint

# base url for the project
BASE_URL = "http://127.0.0.1:5000"


def random_phone_num_generator():
    first = str(random.randint(100, 999))
    second = str(random.randint(1, 888)).zfill(3)
    last = (str(random.randint(1, 9998)).zfill(4))
    while last in ['1111', '2222', '3333', '4444', '5555', '6666', '7777', '8888']:
        last = (str(random.randint(1, 9998)).zfill(4))
    return '{}-{}-{}'.format(first, second, last)


def str_time_prop(start, end, time_format, prop):
	# generate random date
    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))
    ptime = stime + prop * (etime - stime)
    return time.strftime(time_format, time.localtime(ptime))


def random_date(start, end, prop):
    return str_time_prop(start, end, '%m/%d/%Y %I:%M %p', prop)
    

def generate_ssn():
	result = ""
	x1 = random.randint(0, 9)	
	x2 = random.randint(0, 9)
	x3 = random.randint(0, 9)

	result = "{}{}{}-{}{}{}".format(
		x1, x2, x3, x3, x2, x1
	)

	return result
	

def generate_patient(amount):
	
	fake_ssn = generate_ssn()
	date_value = random_date("1/1/2018 1:30 PM", "1/1/2020 4:50 AM", random.random())	
	url = "{}/{}".format(BASE_URL, "patient")
	# fields that need to be generated
	for i in range(amount):

		request_data = {
			"ssn": fake_ssn, 
			"first_name": names.get_first_name(),
			"middle_name": names.get_last_name(),  
			"last_name": names.get_last_name(), 
			"date_of_birth": date_value, 
			"height": "5ft 5", 
			"weight" : "{} LBS".format(random.randint(100, 160)), 
			"next_of_kin": names.get_full_name(),
			"home_phone": random_phone_num_generator(), 
			"work_phone": random_phone_num_generator(), 
			"symptoms": "Undefined", 
			"health_insurance": "Etna", 
			"vaccination": "True",
			"vaccination_date": date_value, 
			"drugs_alchohol": "True", 
			"sexually_active": "False", 
			"allergies": "True", 
			"blood_type": "O Positive", 
			"notes": "Patient is in grave danger"
		}

		api_request = requests.post(url=url, json=request_data)
		if api_request.status_code == 200:
			print("Created patient ", i)
		else:
			print("Failed to create patient", i)


def generate_medication():

	url = "{}/{}".format(BASE_URL, "medications")
	name_data = {
		{"name": "Tylenol", "code": "123", "price": "100"}, 
		{"name": "Advil", "code": "123", "price": "20"}, 
		{"name": "Zoloft", "code": "123", "price": "30"}, 
		{"name": "Lipitor", "code": "123", "price": "40"}, 
		{"name": "amoxicillin", "code": "123", "price": "50"}, 
		{"name": "Bactrim", "code": "123", "price": "100"}, 
	}

	count = 0
	for medication in name_data:	
		api_request = requests.post(url=url, json=medication)
		if api_request.status_code == 200:
			print("Medication ", count)
		else:
			print("Failed to create patient", count)
		count += 1
		


def main():

	generate_patient(10) 
	generate_medication()

main()

		

