# Models
Data model for the emergency room application. 


## Patient

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

## Room

| **FieldName**       | **Description**                          |
|---------------------|------------------------------------------|
| room_number         | Unique ID to keep track of the patient.  |
| room_type           | Gender of the patient.                   |
| blockfloor          | Name of the drug.                        |
| blockcode           | First name of the patient                |
| availability_status | Last name of the patient                 |


## Department

| **FieldName** | **Description**                    |
|---------------|------------------------------------|
| department_id | Unique id for the department.      |
| name          | Name of the hospital department.   |
| head          | Head physician of the department.  |
