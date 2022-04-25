import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/medication.dart'; 
import '../models/intake.dart'; 
import '../api/medication.dart';
import '../list_tiles/medication.dart';

class ViewPatientMedications extends StatefulWidget {

  final Intake? intake;
  const ViewPatientMedications({Key? key, @required this.intake}) : super(key: key);


  @override
  _ViewPatientMedicationsState createState() => _ViewPatientMedicationsState(intake: this.intake);
}

class _ViewPatientMedicationsState extends State<ViewPatientMedications> {


  Intake? intake; 
  _ViewPatientMedicationsState({this.intake});

  List<Medication> _medications = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    MedicationApi.fetchPatientMedications(intake?.intakeId).then((medications){
      setState(() {
        _medications = medications; 
        is_loading = false; 

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Medications"),
        backgroundColor: Colors.red
      ),
      body: CustomScrollView(
          slivers: [
             SliverList(delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                    Medication medication = _medications[index]; 
                    return MedicationListTile(medication: medication);
                }, 
                childCount: _medications == null ? 0: _medications.length,
             ),), 
          ]
      ),
    );
  }
}