import 'package:http/http.dart' as http;
//import '../models/room.dart'; 
import 'dart:async';
import 'dart:convert';


class ProcedureApi {


    createProcedure(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/patientProcedure');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'room_id': formData['room_id'],
                'cost': formData['cost'],
                'notes': formData['notes'],
                'name': formData['name']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Procedure');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }

}