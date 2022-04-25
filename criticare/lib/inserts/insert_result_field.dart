import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/results.dart'; 
import '../models/test_results.dart'; 


class InsertResultFieldPage extends StatefulWidget {

    final TestResults? result;
    const InsertResultFieldPage({Key? key, @required this.result}) : super(key: key);


  @override
  _InsertResultFieldPageState createState() => _InsertResultFieldPageState(result: result);
}

class _InsertResultFieldPageState extends State<InsertResultFieldPage> {

  ResultsApi _resultsApi = ResultsApi(); 
  TestResults? result;
  _InsertResultFieldPageState({this.result});

  // fields
  TextEditingController nameController = new TextEditingController();
  TextEditingController valueController = new TextEditingController();
  TextEditingController unitController = new TextEditingController();


  submitResultData() async {

    Map <String, dynamic> fieldApiData =  {
        'name': nameController.text,
        'value': valueController.text, 
        'unit': unitController.text
    }; 

    String status = await _resultsApi.createResultField(fieldApiData, result?.testId);
    _showMyDialog(); 

  }

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
                      Text('Inserted result field!', style: TextStyle(color: Colors.black)),
                      
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

  Container submitButton(){
      return Container(
          height: 55, 
          width: 200, 
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15.0)
           ),
           child: Center(
               child: Text(
                   'Add Result Field',
                   style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16 
                   ),
               ),
           ),
      );
  }

  Container textSection(){
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          margin: EdgeInsets.only(top: 30.0),
          child: Center(
              child: Column(
                  children: <Widget> [
                     SizedBox(height: 20.0),
                     textFieldWidget("Name: ", Icons.person, nameController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Value: ", Icons.person, valueController),
                     SizedBox(height: 20.0),
                     textFieldWidget("Unit: ", Icons.person, unitController),
                     SizedBox(height: 20.0),
                  ]
              ),
          ),
      );
  }

   TextFormField textFieldWidget(String title, IconData icon, TextEditingController txtController){
      return TextFormField(
          controller: txtController,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true, 
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              hintText: title, 
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(icon, color: Colors.red)
          ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Add Test Result Field"),
            backgroundColor: Colors.red
        ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget> [
                  textSection(), 
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: (){
                        submitResultData();
                    },
                    child: submitButton(), 
                  ),
                  SizedBox(height: 20.0),
              ]
          ),
      ),
      
    );
  }
}