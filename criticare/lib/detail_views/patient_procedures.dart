import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/procedure.dart'; 
import '../models/intake.dart'; 
import '../api/procedure.dart';
import '../list_tiles/procedure.dart';

class ViewPatientProcedures extends StatefulWidget {

  final Intake? intake;
  const ViewPatientProcedures({Key? key, @required this.intake}) : super(key: key);


  @override
  _ViewPatientProceduresState createState() => _ViewPatientProceduresState(intake: this.intake);
}

class _ViewPatientProceduresState extends State<ViewPatientProcedures> {


  Intake? intake; 
  _ViewPatientProceduresState({this.intake});

  List<Procedure> _procedures = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    ProcedureApi.fetchPatientProcedures(intake?.intakeId).then((procedures){
      setState(() {
        _procedures = procedures; 
        is_loading = false; 

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Procedures"),
        backgroundColor: Colors.red
      ),
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    Procedure procedure = _procedures[index]; 
                    return ProcedureListTile(procedure: procedure);
                }, 
                childCount: _procedures == null ? 0: _procedures.length,
             ),), 
          ]
      ),
    );
  }
}