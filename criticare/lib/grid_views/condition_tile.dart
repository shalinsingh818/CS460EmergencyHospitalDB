import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/condition.dart';
import '../api/medical_condition.dart';
import '../models/intake.dart';



class ConditionTile extends StatefulWidget {

  final Intake? intake;
  final Condition? condition;
  const ConditionTile({Key? key, @required this.condition, @required this.intake}) : super(key: key);


  @override
  _ConditionTileState createState() => _ConditionTileState(condition: this.condition, intake: this.intake);
}

class _ConditionTileState extends State<ConditionTile> {

  Condition? condition; 
  Intake? intake; 
  _ConditionTileState({this.condition, this.intake});


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
                      Text('Diagnosed patient with medical condition!', style: TextStyle(color: Colors.black)),
                      
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
    return Scaffold(
      body: GestureDetector(
          onTap: () {
              MedicalConditionApi.diagnoseCondition(intake?.intakeId, condition?.conditionId); 
              _showMyDialog(); 
          }, 
          child: Container(
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
                      Text('${condition?.name}', style: TextStyle(color: Colors.red, fontSize: 30)),
                      SizedBox(height: 15.0), 
                      Text('${condition?.code}', style: TextStyle(color: Colors.green, fontSize: 20)),
                  ],
              ),
              color: Colors.grey[200],
          ),
        )
      )

    );
  }
}