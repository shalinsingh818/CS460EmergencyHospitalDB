import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../inserts/insert_test_result.dart';
import '../grid_views/medications.dart';
import '../grid_views/conditions.dart';
import '../grid_views/rooms.dart';
import '../api/patient.dart';
import '../api/intake.dart'; 
import '../models/intake.dart'; 
import '../models/patient.dart'; 
import '../models/bill.dart'; 
import 'patient_info.dart';
import 'patient_procedures.dart';
import 'patient_medication.dart';
import 'patient_conditions.dart';
import 'patient_test_results.dart'; 
import 'patient_bill.dart';


class IntakeDetailPage extends StatefulWidget {

    final Intake? intake;
    const IntakeDetailPage({Key? key, @required this.intake}) : super(key: key);

  @override
  _IntakeDetailState createState() => _IntakeDetailState(intake: this.intake);
}

class _IntakeDetailState extends State<IntakeDetailPage> {


    int? permissionId;

    Intake? intake; 
    _IntakeDetailState({this.intake});

    Future<Patient>? futurePatient;
    Future<PatientBill>? futurePatientBill;


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
                        Text('Invalid permissions (Must be doctor)', style: TextStyle(color: Colors.black)),
                        
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


    Future<void> _showBottomDialog(Intake? intake) async {
        return  showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
                return Container(
                height: 350,
                color: Colors.white,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                            ListTile(
                                onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ViewPatientMedications(intake: intake)));
                                },
                                leading: Icon(
                                    Icons.medication,
                                    color: Colors.red 
                                ), 
                                title: Text(
                                    "View Medications",
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ), 
                                subtitle: Text(
                                    "View all medications prescribed to patient",
                                ),
                            ),

                            ListTile(
                                onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ViewPatientProcedures(intake: intake)));
                                },
                                leading: Icon(
                                    Icons.location_city,
                                    color: Colors.red 
                                ), 
                                title: Text(
                                    "View Procedures",
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ), 
                                subtitle: Text(
                                    "View all procedures assigned to patient",
                                ),
                            ),

                            ListTile(
                                 onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ViewPatientConditions(intake: intake)));
                                },
                                leading: Icon(
                                    Icons.location_city,
                                    color: Colors.red 
                                ), 
                                title: Text(
                                    "View Medical Conditions",
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ), 
                                subtitle: Text(
                                    "View all conditions diagnosed to patient",
                                ),
                            ),


                            ListTile(
                                 onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ViewPatientResults(intake: intake)));
                                },
                                leading: Icon(
                                    Icons.location_city,
                                    color: Colors.red 
                                ), 
                                title: Text(
                                    "Create Fields For Test Result",
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ), 
                                subtitle: Text(
                                    "Create Dynamic Schema Test Result",
                                ),
                            ),


                            ListTile(
                                 onTap: () {
                                    Navigator.push(
                                        context,
                                    MaterialPageRoute(builder: (context) => PatientBillPage(bill: futurePatientBill)));
                                },
                                leading: Icon(
                                    Icons.location_city,
                                    color: Colors.red 
                                ), 
                                title: Text(
                                    "View Patient Bill",
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                ), 
                                subtitle: Text(
                                    "View Total Costs For Patient Stay In ER",
                                ),
                            ),
                            
                        ],
                    ),
                ),
                );
            },
        );
    }

    void getPermission() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final pId = prefs.getInt('permission_id');
        permissionId = pId;
    }

    @override
    void initState() {
        super.initState();
        this.getPermission();
        futurePatient = PatientApi.fetchPatient(intake?.patientId);
        futurePatientBill = IntakeApi.fetchIntakePatientBill(intake?.intakeId); 
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intake Patient Detail"),
        backgroundColor: Colors.red,
        actions: <Widget> [
             IconButton(
                icon: Icon(
                    Icons.check, 
                    color: Colors.green, 
                ),
                onPressed: (){
                    _showBottomDialog(intake); 
                }
            ),
            
        ]

      ),
      body: CustomScrollView(
          slivers: [
              SliverToBoxAdapter(
                  child: Center(
                      child: Column(
                          children: [
                                SizedBox(
                                    height: 10.0, 
                                ), 
                                Container(
                                    margin: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red, width: 5.0), 
                                        color: Colors.white,
                                        shape: BoxShape.circle, 
                                    ),
                                    height: 270,
                                    child: Center(
                                    child: Column(
                                        children: [
                                            SizedBox(
                                                height: 50,
                                            ), 
                                            Text("${intake?.bloodPressure}", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue),),
                                            SizedBox(
                                                height: 20,
                                            ), 
                                            Text('Stable', style: TextStyle(color: Colors.green, fontSize: 45))
                                        ],),
                                    ),
                                ),

                                SizedBox(height: 20.0), 


                                ListTile(
                                    onTap: () {
                                        if(permissionId !=2 ){
                                            _showMyDialog(); 
                                        }else{
                                            // navgiate to page as doctor
                                            Navigator.push(
                                                context,
                                            MaterialPageRoute(builder: (context) => MedicationPage(intake: intake)));
                                        }
                                    },
                                    leading: Icon(
                                        Icons.medication,
                                        color: Colors.red, 
                                    ),
                                    title: Text("Prescribe Medication", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    subtitle: Text('Search medications factory and prescribe to current patient'),
                                    trailing: Icon(
                                        Icons.more_vert,
                                    ),
                                ),
                                
                                ListTile(
                                    onTap: (){
                                        if(permissionId != 2){
                                            _showMyDialog();
                                        }else{
                                            Navigator.push(
                                                context,
                                            MaterialPageRoute(builder: (context) => RoomPage(intake: intake)));
                                        }
                        
                                    },
                                    leading: Icon(
                                        Icons.location_city,
                                        color: Colors.red, 
                                    ),
                                    title: Text("Assign Procedure", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    subtitle: Text('Search for available rooms, assign patient procedure'),
                                    trailing: Icon(
                                        Icons.more_vert,
                                    ),
                                ),


                                ListTile(
                                    onTap: (){
                                        if(permissionId != 2){
                                            _showMyDialog();
                                        }else{
                                            Navigator.push(
                                                context,
                                            MaterialPageRoute(builder: (context) => ConditionPage(intake: intake)));
                                        }
                                        
                                    },
                                    leading: Icon(
                                        Icons.location_city,
                                        color: Colors.red, 
                                    ),
                                    title: Text("Diagnose Medical Condition", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    subtitle: Text('Diagnose patient with medical conditions in Criticare DB'),
                                    trailing: Icon(
                                        Icons.more_vert,
                                    ),
                                ),



                                 ListTile(
                                    onTap: () {
                                        if(permissionId != 2){
                                            _showMyDialog();
                                        }else{
                                            Navigator.push(
                                                context,
                                            MaterialPageRoute(builder: (context) => InsertTestResultPage(intake: intake)));
                                        }
                                    },
                                    leading: Icon(
                                        Icons.accessibility_outlined,
                                        color: Colors.red, 
                                    ),
                                    title: Text("Create Procedure Test Result", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    subtitle: Text('Create custom test result for patient. '),
                                    trailing: Icon(
                                        Icons.more_vert,
                                    ),
                                ),
                                 ListTile(
                                    onTap: () {
                                        if(permissionId != 2){
                                             _showMyDialog();
                                        }else{
                                            Navigator.push(
                                                context,
                                            MaterialPageRoute(builder: (context) => PatientInfo(patient: futurePatient)));
                                        }
                                       
                                    },
                                    leading: Icon(
                                        Icons.accessible_outlined,
                                        color: Colors.red, 
                                    ),
                                    title: Text("View patient information", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    subtitle: Text('View personal information regarding the patient'),
                                    trailing: Icon(
                                        Icons.more_vert,
                                    ),
                                ),
                                SizedBox(
                                    height: 10,
                                ),
                                ListTile(
                                    leading: Icon(
                                        Icons.more_vert,
                                        color: Colors.red, 
                                    ),
                                    title: Text("Messages", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0)),
                                
                                ),
                          ]

                      ),
                  ),
              ),

              SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                return  Card(
                    child: Column(children: [
                    ListTile(
                        leading: Icon(
                        Icons.message, 
                        color: Colors.red
                        ), 
                        title: Text("Alert Type", style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("Notifcation information"),
                    )
                    ],) ,
                );
                },
                childCount: 5,  
            ),)

          ]
      ),

    );
  }
}