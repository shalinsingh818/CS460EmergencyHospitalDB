import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/test_results.dart';
import '../models/result_field.dart'; 
import '../list_tiles/result_field.dart';
import '../inserts/insert_result_field.dart'; 
import '../api/results.dart';

class TestResultFields extends StatefulWidget {

  final TestResults? result;
  const TestResultFields({Key? key, @required this.result}) : super(key: key);


  @override
  _TestResultFieldsState createState() => _TestResultFieldsState(result: this.result);
}

class _TestResultFieldsState extends State<TestResultFields> {


  TestResults? result; 
  _TestResultFieldsState({this.result});

  List<TestField> _fields = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    ResultsApi.fetchResultFields(result?.testId).then((fields){
      setState(() {
        _fields = fields; 
        is_loading = false; 

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${result?.name}"),
        backgroundColor: Colors.red
      ),
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    TestField field = _fields[index]; 
                    return ResultFieldListTile(field : field);
                }, 
                childCount: _fields == null ? 0: _fields.length,
             ),), 
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InsertResultFieldPage(result: result))); 
          
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}