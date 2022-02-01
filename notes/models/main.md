# Models
Data model for the emergency room application. 


## Patient
This is the data model for the patient info on in-take. It stores personal information, next of kin, and other information that doctors can fill in during in-take. 

| **FieldName** | **Description**                                         |
|---------------|---------------------------------------------------------|
| patient_id    | Unique ID to keep track of the patient.                 |
| gender        | Gender of the patient.                                  |
| date_of_birth | Date the patient was born.                              |
| first_name    | First name of the patient                               |
| last_name     | Last name of the patient                                |
| middle_name   | Middle name of the patient                              |
| height        | Height of the patient                                   |
| weight        | Weight of the patient                                   |
| next_of_kin   | Next of kin, in case patient dies...                    |
| home_phone    | Home phone number                                       |
| work_phone    | Work phone number                                       |
| mobile_phone  | Mobile phone number                                     |
| other         | Other unstructured information doctors can write down.  |
| symptoms      | Other unstructured information doctors can write down.  |
| health insurance | Other unstructured information doctors can write down. |
| vaccination      | Other unstructured information doctors can write down. |
| vaccination_date | Other unstructured information doctors can write down. |
| Drugs or alchohol | Whether drugs or alchohol was involved			  |
| Religion		 | Religion of the patient								  |
| SSN		 	     | Social security number							  |
| Sexually active    | Sexually active								      |
| Allergies    	| Allergies for the patient				   				  |
| Blood Type 	|   Blood type of the paitient 						      |


## Test/Scan Results
Data model that stores  
| **FieldName** | **Description**                                        |
|---------------|--------------------------------------------------------|
| test_id       | Unique Identifier for the doctor.                      |
| type          | XRay, MRI, CT SCAN                                     |
| cost          | cost of scan                                     		 |

## Diagnosis
Data model to store information about diagnosis

1. Diabetes
2. COVID
3. Pneumonia
4. Asthma
5. Heart Attack
6. Stroke
7. IBS
8. Hypertension


## Physician
Data model that stores information about the doctor assigned to a patient.

1. Create and change records for the paitient
2. Should be able to perform X-Rays
3. Should be able to request
	* XRays
	* MRIS
	* CAT SCAN
	* URINE
	* BLOOD
4. Doctor should be able to add symptoms
5. Doctor should be able to add notes but differ from the nurse notes
6. Doctor should provide discharge instructions
7. External References

| **FieldName** | **Description**                                        |
|---------------|--------------------------------------------------------|
| doctor_id     | Unique Identifier for the doctor.                      |
| first_name    | First name of the doctor                               |
| last_name     | Last name of the doctor                                |
| department    | Position of the doctor, associated with a department.  |


## Nurse Information
Nurse information intake
1. Nurse can update/change vitals blood pressure
2. Also needs a place to record notes about the patient
3. Nurse needs symptom/decision tree of possible medical conditions
4. Nurse decides Whether the person is going to be admitted or not


| **FieldName** | **Description**                                        |
|---------------|--------------------------------------------------------|
| blood_pressure| Unique Identifier for the doctor.                      |
| weight        | Verified weight of patient                             |
| height     	| Verified height of patient                             |
| notes     	| Notes for the patient                                  |
| symptoms     	| Symptoms                                 				 |


## Room
This is the data model for the room that the patient/doctor is assigned to. The model is indepedent of the patient or the doctor, it can  be associated with either ID. 
| **FieldName**       | **Description**                          |
|---------------------|------------------------------------------|
| room_number         | Unique ID to keep track of the patient.  |
| room_type           | Gender of the patient.                   |
| blockfloor          | Name of the drug.                        |
| blockcode           | First name of the patient                |
| availability_status | Last name of the patient                 |


## Department
Department that physician could be associated with. Department is a way to group/isolate the best doctors for patient care. 
| **FieldName** | **Description**                    |
|---------------|------------------------------------|
| department_id | Unique id for the department.      |
| name          | Name of the hospital department.   |
| head          | Head physician of the department.  |


## Medication
Data model for medication that can be prescribed to the patient. 
|o**FieldName** | **Description**                                         |

|---------------|---------------------------------------------------------|
| code          | Code of the medication                                  |
| name          | Name of the medication being prescribed.                |
| brand         | Brand  of the medication being prescribed               |
| description   | Description/info patient needs to know about the drug.  |


## Appointment
Data model for storing information about appointments booked with the hospital. 

| **FieldName**  | **Description**                                                                   |
|----------------|-----------------------------------------------------------------------------------|
| appointment_id | Unique Identifier for the doctor.                                                 |
| patient        | One to many relationship. Many patients can be associated with an appointment.    |
| doctor         | Doctor's associated with the appointment.                                         |
| start_time     | Starting time of the appointment.                                                 |
| end_time       | Ending time of the appointment                                                    |
| room_number    | Room that the appointment is taking place in. (Possible one to many relationship) |


## Diagnosis
Create a model


## Billing
1. Include how much a scan/procedure costs
2. Bill goes to the patient
3. User permissions for billing department
4. Include information if patient is adult/child age and provide information for the parent
5. Fixed rate for room
6. Bill Deadline
