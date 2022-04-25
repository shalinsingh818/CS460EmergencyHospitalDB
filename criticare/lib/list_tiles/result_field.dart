import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/test_results.dart'; 
import '../models/result_field.dart'; 


class ResultFieldListTile extends StatefulWidget {

  final TestField? field;
  const ResultFieldListTile({Key? key, @required this.field}) : super(key: key);


  @override
  _ResultFieldListTileState createState() => _ResultFieldListTileState(field: this.field);
}

class _ResultFieldListTileState extends State<ResultFieldListTile> {

  TestField? field; 
  _ResultFieldListTileState({this.field});


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
                        "${field?.name} ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        " ${field?.value}  : ${field?.unitMeasurement}  ",
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
                )
            ],
        ),
    );
  }
}