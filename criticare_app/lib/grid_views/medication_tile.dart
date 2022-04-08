import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/medication.dart';



class MedicationTile extends StatefulWidget {

  final Medication? medication;
  const MedicationTile({Key? key, @required this.medication}) : super(key: key);


  @override
  _MedicationTileState createState() => _MedicationTileState(medication: this.medication);
}

class _MedicationTileState extends State<MedicationTile> {

  Medication? medication; 
  _MedicationTileState({this.medication});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(8),
          child: Container(
            alignment: Alignment.center, 
            padding: const EdgeInsets.all(8),
            child: Column(
                children: <Widget> [
                    SizedBox(height: 30), 
                    Icon(
                        Icons.medication,
                        color: Colors.red, 
                        size: 100,
                    ), 
                    SizedBox(height: 10.0), 
                    Text('${medication?.name}', style: TextStyle(color: Colors.red, fontSize: 30)),
                    SizedBox(height: 15.0), 
                    Text('\$ ${medication?.price}', style: TextStyle(color: Colors.green, fontSize: 20)),
                ],
            ),
            color: Colors.grey[200],
        ),
      )

    );
  }
}