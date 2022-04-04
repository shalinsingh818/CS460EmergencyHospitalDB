import 'package:http/http.dart' as http;
import '../models/patient.dart'; 
import 'dart:async';
import 'dart:convert';


class PatientApi {


    createPatient(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/patient');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'ssn': formData['ssn'],
                'first_name': formData['firstName'], 
                'middle_name': formData['middleName'], 
                'last_name': formData['lastName'], 
                'date_of_birth': formData['dob'], 
                'height': formData['height'], 
                'weight': formData['weight'], 
                'next_of_kin': formData['nextOfKin'], 
                'home_phone': formData['homePhone'], 
                'work_phone': formData['workPhone'], 
                'symptoms': formData['symptoms'], 
                'health_insurance': formData['healthInsurance'], 
                'vaccination': formData['vaccination'], 
                'vaccination_date': formData['vaccinationDate'], 
                'drugs_alchohol': formData['drugsAlcohol'], 
                'sexually_active': formData['sexuallyActive'], 
                'allergies': formData['allergies'], 
                'blood_type': formData['bloodType'], 
                'notes': formData['notes']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Patient');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }

    static Future<List<Patient>> fetchPatients() async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/patient'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<Patient> patients = patientFromJson(response.body);
            return patients;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }

}