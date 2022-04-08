import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../grid_views/medications.dart';
import '../models/intake.dart'; 


class IntakeDetailPage extends StatefulWidget {

    final Intake? intake;
    const IntakeDetailPage({Key? key, @required this.intake}) : super(key: key);

  @override
  _IntakeDetailState createState() => _IntakeDetailState(intake: this.intake);
}

class _IntakeDetailState extends State<IntakeDetailPage> {

    Intake? intake; 
    _IntakeDetailState({this.intake});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intake Patient Detail"),
        backgroundColor: Colors.red
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
                                            Text("180/20", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.blue),),
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MedicationPage()));
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
                                    leading: Icon(
                                        Icons.accessibility_outlined,
                                        color: Colors.red, 
                                    ),
                                    title: Text("View Test Results", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    subtitle: Text('View test results related to patient procedures'),
                                    trailing: Icon(
                                        Icons.more_vert,
                                    ),
                                ),
                                 ListTile(
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