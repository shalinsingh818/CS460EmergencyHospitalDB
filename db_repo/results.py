import sqlite3
from pprint import pprint

# go to desired directory
import sys
sys.path.append("../")
import models



TEST_TYPE_FIELDS = [
	"test_id", 
	"name",
	"patient_intake_id"
]


# QUERIES FOR TEST TYPE
INSERT_TEST_TYPE_QUERY = "INSERT INTO TEST_TYPE (name, patient_intake_id) values(?, ?);"
VIEW_TEST_TYPE_QUERY = "SELECT * FROM TEST_TYPE WHERE patient_intake_id=?;";
VIEW_TEST_TYPE_BY_ID = "SELECT * FROM TEST_TYPE WHERE test_id = ?;";


TEST_FIELD_FIELDS = [
	"field_id", 
	"name",
	"value",
	"unit_measurement",
	"test_type_id"
]


# QUERIES FOR TEST TYPE
INSERT_TEST_FIELDS_QUERY = "INSERT INTO TEST_FIELD (name, value, unit_measurement, test_type_id) values(?, ?, ?, ?);"
VIEW_TEST_FIELDS_QUERY = "SELECT * FROM TEST_FIELD;";
VIEW_RESULT_FIELDS_QUERY = "SELECT * FROM TEST_FIELD where test_type_id=?"
VIEW_FIELD_BY_ID = "SELECT * FROM TEST_FIELD WHERE field_id = ?;";



# Create Patient
def create_test_type(test_fields: dict) -> bool:
    """
        Since there's alot of fields. room_fields is a dictionary that can be
        passed to this method for testing. 
    """
    result = False
    # bind values, by automatically appending dict vals to tuple
    values = []
    for val in test_fields:
        values.append(test_fields[val])

    # convert to tuple
    values = tuple(values)

    # insert to db
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(INSERT_TEST_TYPE_QUERY, values)
        db.commit()
        result = True
    except Exception as e:
        print("Error in creating test type: {}".format(e))
        db.rollback()

    db.close()
    return result


def view_test_types(intake_id):
    tests = []
    # open db
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(VIEW_TEST_TYPE_QUERY, (intake_id,))
        for i in cur:
            # render row entry into patient class model
            temp_dict = {}
            count = 0
            for field in TEST_TYPE_FIELDS:
                temp_dict[field] = i[count]
                count += 1
            tests.append(temp_dict)

    except Exception as e:
        print("Error in viewing tests: {}".format(e))
        db.rollback()
    db.close()

    return tests


def view_test_result_by_id(result_id):
    result = False
    temp_dict = {}
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(VIEW_TEST_TYPE_BY_ID, (result_id,))
        for i in cur:
            count = 0
            for field in TEST_TYPE_FIELDS:
                temp_dict[field] = i[count]
                count += 1
        db.commit()
    except Exception as e:
        print("Error in viewing test: {}".format(e))
        db.rollback()

    db.close()
    return temp_dict



# Create Patient
def create_test_field(fields: dict) -> bool:
    """
        Since there's alot of fields. room_fields is a dictionary that can be
        passed to this method for testing. 
    """
    result = False
    # bind values, by automatically appending dict vals to tuple
    values = []
    for val in fields:
        values.append(fields[val])

    # convert to tuple
    values = tuple(values)

    # insert to db
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(INSERT_TEST_FIELDS_QUERY , values)
        db.commit()
        result = True
    except Exception as e:
        print("Error in creating test field: {}".format(e))
        db.rollback()

    db.close()
    return result



def view_test_fields(test_result_id):
    # other format
    test_fields = []
    values = (test_result_id,)
    # open db
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(VIEW_RESULT_FIELDS_QUERY , values)
        for i in cur:
            # render row entry into patient class model
            temp_dict = {}
            count = 0
            # generate temp dict
            for field in TEST_FIELD_FIELDS:
                temp_dict[field] = i[count]
                count += 1
            test_fields.append(temp_dict)

    except Exception as e:
        print("Error in viewing test fields: {}".format(e))
        db.rollback()
    db.close()

    return test_fields



def view_field_by_id(result_id):
    result = False
    temp_dict = {}
    db = sqlite3.connect("data/criticare.db")
    try:
        cur = db.cursor()
        cur.execute(VIEW_FIELD_BY_ID, (result_id,))
        for i in cur:
            count = 0
            for field in TEST_FIELD_FIELDS:
                temp_dict[field] = i[count]
                count += 1
        db.commit()
    except Exception as e:
        print("Error in viewing test: {}".format(e))
        db.rollback()

    db.close()
    return temp_dict


