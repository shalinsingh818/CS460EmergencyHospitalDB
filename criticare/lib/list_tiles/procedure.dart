import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/procedure.dart'; 

class ProcedureListTile extends StatefulWidget {

  final Procedure? procedure;
  const ProcedureListTile({Key? key, @required this.procedure}) : super(key: key);


  @override
  _ProcedureListTileState createState() => _ProcedureListTileState(procedure: this.procedure);
}

class _ProcedureListTileState extends State<ProcedureListTile> {

  Procedure? procedure; 
  _ProcedureListTileState({this.procedure});


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
                        "${procedure?.name} ",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    ), 
                    subtitle: Text(
                        "Notes: ${procedure?.notes} ",
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