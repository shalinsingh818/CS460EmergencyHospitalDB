# Client Notes

1. Verify that the data models present are needed for the client
2. Confirm that the language/frameworks

# Introduction

**Project Name:** CritiCare

**Backend Language**: Python

**DataWharehouse**: Sqlite3

**Frontend Stack**: PyQt 5 (OR) HTML/BOOTSTRAP

# Purpose
Purpose of this document is to provide a general summary/requirement analysis of what tCritiCare is and how it functions. 

## Scope

Criticare is an information management system for emergency rooms/critical care centers. The application stores information on a database and allows users to view, read, update and enter hospital related information. Some of the main features of criticare are managing patient/employee information, reserve rooms to perform procedures on patient and diagnose and provide the proper medical care in emergencies. 




## Acronym Index

**Object Relational Mapper**
**CRUD**
**SQL**


## References



## Overview



# General Description



## Product Perspective




## Product Functions





1. Employee management service
	* Manages employees (Doctors, nurses, janitorial etc. )
	* Permissions system: Employees can have access to information baseds on their role/permission assigned. 
	* Doctors/Nurses can view patient information and schedule procedures

2. Patient Intake Service
	* Adds patient information to the database
	* Validates intake/arrival information
	* Prescribe meidcations/assign procedures to patient
	* Diagnose patient with specific medical conditions
	* Admit patient to ER

3. Procedure/Room Assignment Service
	* Assign patients/employees to designated room for procedure
	* Keep track of room availability status

4. User login/authentication
	* Users/Employees can log in with a username and password
	* Account information is stored in a database


## User Characteristics

There are many types of users for this application. The user roles are defined as

| FieldName | Summary                                                 |
|-----------|---------------------------------------------------------|
| Admin     | Has full access to database and application source code |
| Nurse     | Nurses using the application for helping patients.      |
| Doctor    | Doctors using the application for helping patients.     |
| Janitor   | Cleaning/Janitor services employees.                    |
| Patient   | The patient using the application.                      |

1. **Admin User Characteristics**:
	* Access to all CRUD operations for every model in the database
	*


## General Constraints






## Assumptions and Dependencies




# Specific Requirements
Requirements for the CS460 project. 

1. Managing patient information in a emergency room
2. Login/Authentication
3. Data must be stored in a database


## Functional Requirement 1

**Introduction**: 

**Inputs**: 

**Processing**:


**Outputs**: 


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


