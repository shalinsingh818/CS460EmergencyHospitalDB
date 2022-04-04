import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PatientListTile extends StatefulWidget {

  final String? patientFirstName; 
  final String? patientMiddleName; 
  final String? patientLastName; 
  final String? patientDateOfBirth;
  final String? ssn;
   

  PatientListTile({
      @required this.patientFirstName, 
      @required this.patientMiddleName,
      @required this.patientLastName,
      @required this.patientDateOfBirth,
      @required this.ssn
    });


  @override
  _PatientListTileState createState() => _PatientListTileState();
}

class _PatientListTileState extends State<PatientListTile> {

  String? patientFirstName = ""; 
  String? patientMiddleName = ""; 
  String? patientLastName = ""; 
  String? patientDateOfBirth = "";
  String? ssn = "";

  _PatientListTileState({
      this.patientFirstName, 
      this.patientMiddleName,
      this.patientLastName,
      this.patientDateOfBirth,
      this.ssn
    });



  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget> [
                 ListTile(
                    leading: Icon(
                        Icons.face_rounded,
                        color: Colors.red 
                    ), 
                    title: Text(
                        "${patientFirstName} : ${patientLastName}",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Date Created: ${patientDateOfBirth} : SSN: ${ssn}",
                    ),
                    trailing: Wrap(
                        spacing: 15,
                        children: <Widget>[
                            Icon(
                                Icons.check, 
                                color: Colors.green, 
                            ),
                            Icon(
                                Icons.do_not_disturb_on_outlined,
                                color: Colors.red, 
                            ),
                            Icon(
                                Icons.more_vert, 
                                color: Colors.blue, 
                            ),
                        ]
                    )
                )
            ],
        ),
    );
  }
}