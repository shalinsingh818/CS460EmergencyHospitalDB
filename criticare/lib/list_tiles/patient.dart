import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/patient.dart'; 
import '../models/patient.dart'; 
import '../inserts/insert_intake.dart'; 

class PatientListTile extends StatefulWidget {

  final Patient? patient;
  const PatientListTile({Key? key, @required this.patient}) : super(key: key);


  @override
  _PatientListTileState createState() => _PatientListTileState(patient: this.patient);
}

class _PatientListTileState extends State<PatientListTile> {

  Patient? patient; 
  _PatientListTileState({this.patient});

  @override
  void initState(){
    super.initState(); 
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Criticare LLC', style: TextStyle(color: Colors.red)),
            content: SingleChildScrollView(
                child: ListBody(
                    children: <Widget>[
                        Text('Patient intake denied! (Delete patient information from system)', style: TextStyle(color: Colors.black)),
                    ],
                ),
            ),
            actions: <Widget>[
                FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                        Navigator.of(context).pop();
                    },
                ),
            ],
        );
      },
    );
  }


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
                        "${patient?.firstName} : ${patient?.lastName}",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Date Created: ${patient?.dateOfBirth} SSN: ${patient?.ssn}",
                    ),
                    trailing: Wrap(
                        spacing: 15,
                        children: <Widget>[
                            IconButton(
                                icon: Icon(
                                    Icons.check, 
                                    color: Colors.green, 
                                ),
                                onPressed: (){
                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => InsertIntakePage(patientId: patient?.patientId)));
                                }
                            ),


                            IconButton(
                                icon: Icon(
                                    Icons.do_not_disturb_on_outlined, 
                                    color: Colors.red, 
                                ),
                                onPressed: (){
                                    PatientApi.deletePatient(patient?.patientId);
                                    _showMyDialog(); 
                                    initState(); 
                                }
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