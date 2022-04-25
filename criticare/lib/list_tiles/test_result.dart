import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/test_results.dart'; 
import '../inserts/insert_result_field.dart'; 
import '../detail_views/test_result_fields.dart'; 

class ResultListTile extends StatefulWidget {

  final TestResults? result;
  const ResultListTile({Key? key, @required this.result}) : super(key: key);


  @override
  _ResultListTileState createState() => _ResultListTileState(result: this.result);
}

class _ResultListTileState extends State<ResultListTile> {

  TestResults? result; 
  _ResultListTileState({this.result});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: <Widget> [
                 ListTile(
                    onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestResultFields(result: result))); 
                    }, 
                    leading: Icon(
                        Icons.face_rounded,
                        color: Colors.red 
                    ), 
                    title: Text(
                        "${result?.name} ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Result for patient ",
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