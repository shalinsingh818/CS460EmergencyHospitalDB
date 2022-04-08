import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PatientInfo extends StatefulWidget {

    final Patient? patient;
    const PatientInfo({Key? key, @required this.patient}) : super(key: key);


  @override
  _PatientInfoState createState() => _PatientInfoState(patient: this.patient);
}

class _PatientInfoState extends State<PatientInfo> {

    Patient? patient; 
    _PatientInfoState({this.patient});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home page '),
      ),

    );
  }
}