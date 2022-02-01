# CritiCare Emergency Room Application


1. **Introduction**: 



**Project Name:** CritiCare

**Backend Language**: Python

**DataWharehouse**: Sqlite3

**Frontend Stack**: PyQt 5 (OR) HTML/BOOTSTRAP

# Purpose
Purpose of this document is to provide a general summary/requirement analysis of what tCritiCare is and how it functions. 

## Scope

Criticare is an information management system for emergency rooms/critical care centers. The application stores information on a database and allows users to view, read, update and enter hospital related information. Some of the main features of criticare are managing patient/employee information, reserve rooms to perform procedures on patient and diagnose and provide the proper medical care in emergencies. 




## Acronym Index

**Object Relational Mapper**: 
**CRUD**: Create, Read, Update, Delete information
**SQL**: Structured Query Language (For database)
**ER**: Emergency Room

## References



## Overview



# General Description



## Product Perspective




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
4. **User login//registration/authentication**
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

### Goverment/National Constraints### 
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
	* I have no clue what this is
4. **Hardware Constraints**::
	* This is vague


## Assumptions and Dependencies




# Specific Requirements
List of all the functions we need for this system

## Employee Management Service Functions

### Create Employee Record

**Introduction**: Purpose of this function is to create/enter an employee record into the database. 

1. **Inputs**
	* first name of employee	
	* last name of employee
	* position (Doctor, Nurse, Janitor)
	* ssn Social Security number
2. **Processing**: 
	* Validate social security number
	* Make sure that first and last name are legal/valid
	* Make sure first and last name are not empty
3. **Outputs**: 
	* boolean value that indicates if the record was successfully created



### Update Employee Record

**Introduction**: Purpose of this function is to update a current employee record into the database. 

1. **Inputs**
	* Employee unique id
	* first name of employee	
	* last name of employee
	* position (Doctor, Nurse, Janitor)
	* ssn Social Security number
2. **Processing**: 
	* Validate social security number
	* Make sure that first and last name are legal/valid
	* Make sure first and last name are not empty
3. **Outputs**: 
	* boolean value that indicates if the record was successfully updated

### Delete Employee Record

**Introduction**: Purpose of this function is to delete a employee in the database
1. **Inputs**
	* Employee unique id
2. **Processing**: 
	* Validate that the current account has access to delete employees
3. **Outputs**: 
	* boolean value that indicates if the record was successfully deleted



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


