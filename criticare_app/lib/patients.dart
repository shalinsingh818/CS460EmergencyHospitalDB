import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'models/patient.dart'; 
import 'api/patient.dart';

class ViewPatientsPage extends StatefulWidget {


  @override
  _ViewPatientsState createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatientsPage> {

  List<Patient> _patients = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    PatientApi.fetchPatients().then((patients){
      setState(() {
        _patients = patients; 
        is_loading = false; 

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    Patient patient = _patients[index]; 
                    return Card(
                        child: Column(
                            children: <Widget> [
                                ListTile(
                                    leading: Icon(
                                        Icons.face_rounded,
                                        color: Colors.red 
                                    ), 
                                    title: Text(
                                        "testing",
                                        style: TextStyle(fontWeight: FontWeight.bold)
                                    ), 
                                    subtitle: Text("IDK"),
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
                            ]
                        )
                    ); 
                }, 
                childCount: _patients == null ? 0: _patients.length,
             ),), 
          ]
      ),
    );
  }
}