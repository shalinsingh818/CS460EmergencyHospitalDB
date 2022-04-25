import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/condition.dart'; 
import '../models/intake.dart'; 
import '../api/medical_condition.dart';
import '../list_tiles/condition.dart';

class ViewPatientConditions extends StatefulWidget {

  final Intake? intake;
  const ViewPatientConditions({Key? key, @required this.intake}) : super(key: key);

  @override
  _ViewPatientConditionsState createState() => _ViewPatientConditionsState(intake: this.intake);
}

class _ViewPatientConditionsState extends State<ViewPatientConditions> {

  Intake? intake; 
  _ViewPatientConditionsState({this.intake});

  List<Condition> _conditions = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    MedicalConditionApi.fetchPatientConditions(intake?.intakeId).then((conditions){
      setState(() {
        _conditions = conditions; 
        is_loading = false; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Medical Conditions"),
        backgroundColor: Colors.red
      ),
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    Condition condition = _conditions[index]; 
                    return ConditionListTile(condition: condition);
                }, 
                childCount: _conditions == null ? 0: _conditions.length,
             ),), 
          ]
      ),
    );
  }
}