import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/procedure.dart'; 
import '../models/test_results.dart';
import '../models/intake.dart'; 
import '../list_tiles/test_result.dart';
import '../api/results.dart';

class ViewPatientResults extends StatefulWidget {

  final Intake? intake;
  const ViewPatientResults ({Key? key, @required this.intake}) : super(key: key);


  @override
  _ViewPatientResultsState createState() => _ViewPatientResultsState(intake: this.intake);
}

class _ViewPatientResultsState extends State<ViewPatientResults> {


  Intake? intake; 
  _ViewPatientResultsState({this.intake});

  List<TestResults> _results = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    ResultsApi.fetchTestResults(intake?.intakeId).then((results){
      setState(() {
        _results = results; 
        is_loading = false; 

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Test Results"),
        backgroundColor: Colors.red
      ),
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    TestResults result = _results[index]; 
                    return ResultListTile(result : result);
                }, 
                childCount: _results == null ? 0: _results.length,
             ),), 
          ]
      ),
    );
  }
}