import 'package:http/http.dart' as http; 
import '../models/test_results.dart'; 
import '../models/result_field.dart'; 
import 'dart:async';
import 'dart:convert';


class ResultsApi {


    createTestResult(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/createTestType');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'name': formData["name"], 
                'patient_intake_id': formData["patient_intake_id"],
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Test Name');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }

    static Future<List<TestResults>> fetchTestResults(int? patientId) async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/createTestType?patient=${patientId}'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<TestResults> testResults = testResultsFromJson(response.body);
            return testResults;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }


    createResultField(Map<String, dynamic> formData, int? testResultId) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/createTestField');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'name': formData['name'], 
                'value': formData['value'], 
                'unit': formData['unit'], 
                'test_type_id': testResultId
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Test Result Field');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }


    static Future<List<TestField>> fetchResultFields(int? resultId) async {
        final response = await http.get(Uri.parse('http://127.0.0.1:5000/createTestField?result=${resultId}'));
        if (response.statusCode == 200) {
            // If the server did return a 200 OK response,
            // then parse the JSON.
            final List<TestField> resultFields = testFieldFromJson(response.body);
            return resultFields;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
    }

}