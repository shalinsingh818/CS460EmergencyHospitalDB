import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/medication.dart'; 

class MedicationListTile extends StatefulWidget {

  final Medication? medication;
  const MedicationListTile({Key? key, @required this.medication}) : super(key: key);


  @override
  _MedicationListTileState createState() => _MedicationListTileState(medication: this.medication);
}

class _MedicationListTileState extends State<MedicationListTile> {

  Medication? medication; 
  _MedicationListTileState({this.medication});

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
                        "${medication?.name} ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Notes: ${medication?.code} :  ${medication?.price}",
                    ),
                    trailing: Wrap(
                        spacing: 15,
                        children: <Widget>[
                            Icon(
                                Icons.more_vert, 
                                color: Colors.blue, 
                            ),
                        ]
                    )
                ),
            ],
        ),
    );
  }
}