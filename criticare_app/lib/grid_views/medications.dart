import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../api/medication.dart';
import '../models/medication.dart';
import 'medication_tile.dart'; 


class MedicationPage extends StatefulWidget {


  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {

  List<Medication> _medications = []; 
  bool is_loading = false;

  @override
  void initState(){
    super.initState(); 
    is_loading = true; 
    MedicationApi.fetchMedications().then((medications){
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
        title: Text("Medications"),
        backgroundColor: Colors.red
      ),
      body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            ),
            itemCount: _medications == null ? 0: _medications.length,
            itemBuilder: (BuildContext context, int index) {
                Medication medication = _medications[index];
                return MedicationTile(medication: medication);
            }
        ),
    );
  }
}