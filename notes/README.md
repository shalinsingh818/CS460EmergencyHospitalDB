# CritiCare Emergency Room Application



**Project Name:** CritiCare

**Backend Language**: Python

**DataWharehouse**: Sqlite3

**Frontend Stack**: PyQt 5 (OR) HTML/BOOTSTRAP

# Purpose
Purpose of this project is to create an application that can be used in hospitals and emergency rooms to organize, save, edit and evaluate patient information. This document is contract between the client and developers that verify the requirements of the application. 

## Scope
Criticare is an information management system for emergency rooms/critical care centers. The application stores information on a database and allows users to view, read, update and enter hospital related information. Some of the main features of criticare are managing patient/employee information, reserve rooms to perform procedures on patient and diagnose and provide the proper medical care in emergencies. 

## Acronym Index
**Object Relational Mapper**: Maps code class blueprints to data structures

**CRUD**: Create, Read, Update, Delete information

**SQL**: Structured Query Language (For database)

**ER**: Emergency Room

## References

The code will be version controlled on github. The team will be colloborating and updating progress on the github repository. 
Github Repo Link: https://github.com/shalinsingh818/CS460EmergencyHospitalDB 

## Overview



# General Description



## Product Perspective

It is part of a larger product. There will be many components, such as the patient intake, the procedure, diagnosis, medication, room assign, room, permission, results, patient and employee information. From an interface perspective, for example, components such as procedure, diagnosis, medication etc. will pull info from Intake. As for hardware used, the system is running on one CPU with a sqlite3 database.


## Product Functions

1. **Employee management service**
	* Manages employees (Doctors, nurses, janitorial etc. )
	* Permissions system: Employees can have access to information baseds on their role/permission assigned. 
	* Doctors/Nurses can view patient information and schedule procedures
2. **Patient Intake Service**
	* Adds patient information to the database
	* Validates intake/arrival information
	* Prescribe meidcations/assign procedures to patient
	* Diagnose patient with specific medical conditions
	* Admit patient to ER
3. **Procedure/Room Assignment Service**
	* Assign patients/employees to designated room for procedure
	* Keep track of room availability status
4. **User login/registration/authentication**
	* Users/Employees can register and account and log in with provided information
	* Account information is stored in a database


## User Characteristics

There are many types of users for this application. The user roles are defined as

| FieldName | Summary                                                 |
|-----------|---------------------------------------------------------|
| ```Admin```     | Has full access to database and application source code |
|``` Nurse```     | Nurses using the application for helping patients.      |
| ```Doctor```    | Doctors using the application for helping patients.     |
| ```Janitor```   | Cleaning/Janitor services employees.                    |
| ```Patient```   | The patient using the application.                      |


Down below, the user characterstics are divided into 5 sections, Nurse, Doctor, Janitor and Patient. These characteristics are seperated based on the role/permission usage of the application. All types of users down below can log in with their account information saved in a database. 

1. **Admin User**
	* Access to all CRUD operations for every model in the database
	* Deploy multiple instances of ER application. 
2. **Nurse**
	* Can view/admit patients to the ER
	* View/Provide information about patient procedures, medications or diagnosis
	* Check rooms that are available for procedures/overnight patient stays.
3. **Doctor**
	* Has all the same permissions that a nurse has
	* Can diagnose and prescribe medication
	* Create/Schedule procedures. 
4. **Janitor**
	* This is here to show that multiple types of employees can exist in the data model
	* Access to rooms for cleaning up after procedures. 
5. **Patient**
	* Can view schedules procedures
	* View medications/dignosis given by doctor or nurse
	* Can view financial summary/cost of visit after discharge

## General Constraints

1. **Defensive Security Constraints** 
	* Cannot provide real time user session authentication
	* SQLITE3 (Database Framework) is vunerable to injections with escaped string patterns. 
	* Application does not have brute force mitigation
	* Data is not replicated or on a distributed cluster. Architecture is monolithic. 
2. **Offensive Security Constraints** 
	* To log in, user must have account information saved in the database. 
	* Application should only be accesible through the GUI unless user has admin access. 
	* Permission hierachy for access to information. Permission hiearchy goes in order: Admin -> Doctor -> Nurse -> Janitor -> Patient
	* Admin is the only one that has access to the database file (raw). 
3. **Governmental Constraints**:
	* FERPA regulations
	* HIPPA confidentiality
4. **Hardware Constraints**::
	* System is running on one CPU with a sqlite3 database
	* 1TB hard drive space. 


## Assumptions and Dependencies




# Specific Requirements
The requirements for the system are based on the entity relationship diagram down below. 

## Entity Relationship Diagram
Down below is the databse/uml diagram to model the actors in the emergency room system. 

Note that the entity relationships may change in development. 

![ER Diagram](./images/p4.png)


## CRUD Operations
A mandatory feauture of the application is to be able to create, read, update and delete instances of entites in the ER diagram. T

### CREATE
**Introduction**: Purpose of this function is to create/add instance of db table model to the database. THIS METHOD will be implemented for all models in the ER diagram. Every model needs to have CRUD operations. 
1. **Inputs**
	* Required Fields for  the given model
2. **Processing**:
	* Validate all fields of the model
	* Use certain logic depending on the model/system
3. **Outputs**: 
	* boolean value that indicates if the record was successfully created
	* If the create operation is not manual, we can keep a log of the model that was inserted. 

### READ
**Introduction**: Purpose of this function is to read/view multiple instance of a db table model. This is to display information to the user. This method should be attached to every entity in the ER diagram. 
1. **Inputs**
	* This will be a READ ALL method. No parameters or filters are needed for this endpoint
2. **Processing**:
	* Depending on what model is viewed, authentication will be required
	* User will need to be logged in to view certain models.  
3. **Outputs**: 
	* return json/data of entity model to the user
	* Endpoint should render the data so that the GUI can easily obtain it. 


### UPDATE
**Introduction**: Purpose of this function is to be able to update the fields/instance of entity in the ER diagram. Every entity in the ER diagram will have this method to follow CRUD convention. 
1. **Inputs**
	* Any of the fields that need to be updated
	* Exclude unique ID, can't be changed
2. **Processing**:
	* Validate model depending on fields
	* Make sure fields are not empty 
3. **Outputs**: 
	* boolean value that indicates if the record was successfully updated

### DELETE (BY ID)
**Introduction**: Purpose of this function is to delete an individual instance of the entity using a unique id. 
1. **Inputs**
	* unique id of the entity that we want to delete
2. **Processing**: 
	* Validate permission of user that is deleting the entity. 
3. **Outputs**: 
	* boolean value that indicates if the record was successfully deleted


### DELETE ALL
**Introduction**: Purpose of this function is to act as a "KILL SWITCH" to all entities in the ER diagram. If we need to delete/clean the database, this method can delete all the entities in the database. 
1. **Inputs**
	* none
2. **Processing**: 
	* If the entities have relating fields such as foreign keys, primary etc, cascade validation will be needed
	* Validate that no data anomlies can occur when the table is dropped from the db. 
3. **Outputs**: 
	* boolean value that indicates if the record was successfully deleted



# Services Diagram
Down below is a uml diagram of how all the interconnected services work together. The data for these services comes from the database repository. 

Note that the entity relationships may change in development. 

![ER Diagram](./images/p6.png)


## PATIENT Functional Requirements
These are the functions needed for the actor (Patient)

### VERIFY DOB
**Introduction**: Purpose of this function is to verify that the date of the birth of the patient is valid. It checks if they are under or over 18 and returns a result based on the value of the condition. 
1. **Inputs**
	* patient date of birth
	* date-format: YYYY:M:D:H:M:S
2. **Processing**: 
	* Check if age is less then 18
	* Check if age is greater than 18
3. **Outputs**: 
	* returns true or false if patient is adult or not


### CALCULATE BMI
**Introduction**: Purpose of this function is to verify that the date of the birth of the patient is valid. It checks if they are under or over 18 and returns a result based on the value of the condition. 
1. **Inputs**
	* patient date of birth
	* date-format: YYYY:M:D:H:M:S
2. **Processing**: 
	* Check if age is less then 18
	* Check if age is greater than 18
3. **Outputs**: 
	* returns true or false if patient is adult or not


### ADD SYMPTOMS
**Introduction**: Purpose of this function is to verify that the date of the birth of the patient is valid. It checks if they are under or over 18 and returns a result based on the value of the condition. 
1. **Inputs**
	* patient date of birth
	* date-format: YYYY:M:D:H:M:S
2. **Processing**: 
	* Check if age is less then 18
	* Check if age is greater than 18
3. **Outputs**: 
	* returns true or false if patient is adult or not

## NURSE: Functional Requirements
These are all the functional requirements for an employee with the "Nurse" role. 

### ADMIT PATIENT
**Introduction**: Purpose of this function is to allow nurse/doctor admit patient to the ER and process the intake information. 
1. **Inputs**
	* patient id (Unique ID)
2. **Processing**: 
	* Check if patient intake information matches nurses information
	* Set admitted status to "true"
3. **Outputs**: 
	* returns true or false if patient was successfully admitted


### VIEW/UPDATE PATIENT NOTES
**Introduction**: Purpose of this function is to allow nurse to view and update notes for the patient while they are admitted to the emergency room. 
1. **Inputs**
	* patient id (Related to notes entity)
2. **Processing**: 
	* Check if user is a nurse
	* Check if patient is admitted. 
3. **Outputs**: 
	* returns true or false if patient notes were successfully updated. 


### VIEW/UPDATE PATIENT NOTES
**Introduction**: Purpose of this function is to allow nurse to view and update notes for the patient while they are admitted to the emergency room. 
1. **Inputs**
	* patient id (Related to notes entity)
2. **Processing**: 
	* Check if user is a nurse
	* Check if patient is admitted. 
3. **Outputs**: 
	* returns true or false if patient notes were successfully updated.

 
## DOCTOR: Functional Requirements
All functionality needed for doctor entity. These include functions with permissions, viewing/reading data from the database. 


### PRESCRIBE MEDICATION
**Introduction**: Purpose of this function to prescribe a patient with the medication needed to treat their diagnosis. 
1. **Inputs**
	* patient_id: unique id of the patient
	* medication_id unique id/code for the medication
2. **Processing**: 
	* Check if user is a doctor
	* Check if patient is admitted. 
3. **Outputs**: 
	* returns true or false if patient medication was prescribed. 


### ASSIGN AND CREATE A PROCEDURE
**Introduction**: Purpose of this function to create a procedure, select the type and assign the patient/staff and room needed. 

1. **Inputs**
	* patient_id: unique id of the patient (could be one to many)
	* employee_id unique id for the employees we need
	* room_id unique id for the room the procedure is occuring in. 

2. **Processing**: 
	* Check if user is a doctor
	* Check if patient is admitted. 
3. **Outputs**: 
	* returns true or false if patient medication was prescribed. 


## PROCEDURE:  Functional Requirements


# External interface requirements

**User Interfaces**: 

**Hardware Interfaces**: 

**Software Interface**: 

**Communication Interfaces**: 


# Performance Requirements


# Design Constraints




# Attributes


**Availability**: 

**Security Requirements**: 

**Maintainability**: 

**Other Requirements**: 


# Application Architecture
This is a model of how the database functions will be seperated from the buisness logic of the application. The figure shows a library designated for buisness logic and the data repository. The database repository will use sqlite3, with the ER diagram implemented. 

The object relational mapper is just a way to serialize database entites into classses/objects. 

![Buisness Logoc](./images/p1.png)








