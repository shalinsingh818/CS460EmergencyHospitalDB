import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class EmployeeApi {


    createEmployee(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/employees');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'first_name': formData['firstName'], 
                'middle_name': formData['middleName'], 
                'last_name': formData['lastName'], 
                'permission_id': formData['permissionId']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Employee');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }

}