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


## Doctor
Data model that stores information about the doctor assigned to a patient. 
| **FieldName** | **Description**                                        |
|---------------|--------------------------------------------------------|
| doctor_id     | Unique Identifier for the doctor.                      |
| first_name    | First name of the doctor                               |
| last_name     | Last name of the doctor                                |
| department    | Position of the doctor, associated with a department.  |


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
| **FieldName** | **Description**                                         |
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

