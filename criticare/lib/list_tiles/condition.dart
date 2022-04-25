import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/condition.dart'; 

class ConditionListTile extends StatefulWidget {

  final Condition? condition;
  const ConditionListTile({Key? key, @required this.condition}) : super(key: key);


  @override
  _ConditionListTileState createState() => _ConditionListTileState(condition: this.condition);
}

class _ConditionListTileState extends State<ConditionListTile> {

  Condition? condition; 
  _ConditionListTileState({this.condition});

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
                        "${condition?.name} ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Notes: ${condition?.code} ",
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