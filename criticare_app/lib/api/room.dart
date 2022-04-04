import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class RoomApi {


    createRoom(Map<String, dynamic> formData) async {

        final _client = http.Client();
        var _loginUrl = Uri.parse('http://127.0.0.1:5000/room');

        final response = await http.post(_loginUrl,
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            }, 
            body: jsonEncode({
                'number': formData['number'],
                'cost': formData['cost']
            }),
        );
        //if this user gets a token, send them to the home page
        if (response.statusCode == 200) {
            print('Created Hospital Room');
            return "Success"; 
        } else {
            return "Failure"; 
        }
    }

}