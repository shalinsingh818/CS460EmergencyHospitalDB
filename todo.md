# Criticare Source Code
These are the instructions on how to use/run the Criticare source code. Code base works best on a Linux/Unix based OS. 


## Installation and Setup
1. Install python and pip if needed
```
sudo apt-get install python3-pip
```

2. Install the requirements/libraries needed for the code
```
pip3 install -r requirements.txt
```

# Process for adding code to FLASK API
1. Check the tables.sql to see what tables we need
2. Implement the datbase query in db-repo and put in appropriate file
3. Create a corresponding HTTP web endpoint 
	* Import needed db methods
	* Create Get, Post etc


## Use cases that are being implemeted as endpoints
1. Flask rest api endpoints (Backend)
	* Discharge Patient (just delete patient from database and generate report)
	* Update patient test results
	* View Patient test results
	* View Patient Procedure information (View procedure by id)
	* Calculate cost of medication, procedure, overnight
	* Calculate BMI

## Crud operations
2. Create, Read, Update, Delete
	* Patient
	* Medication
	* Results
	* Intake
	* Employee 


1. Endpoints that are done		
	* Assign staff(Doctor/Nurse) to patient
	* Update Patient notes
	* Set Employee Permission (Provide permission id in form)
	* Create Patient X
	* Intake Patient X
	* Prescribe Medication to patient X 
	* Assign Procedure to patient X
	* Assign Room for procedure X (provide room id in body)
	* Diagnose patient with medical condition X
