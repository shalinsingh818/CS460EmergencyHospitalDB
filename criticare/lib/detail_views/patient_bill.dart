import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/bill.dart';


class PatientBillPage extends StatefulWidget {

    final Future<PatientBill>? bill;
    const PatientBillPage({Key? key, @required this.bill}) : super(key: key);


  @override
  _PatientBillPageState createState() => _PatientBillPageState(bill: this.bill);
}

class _PatientBillPageState extends State<PatientBillPage> {


    Future<PatientBill>? bill; 
    _PatientBillPageState({this.bill});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Billing Cost"),
        backgroundColor: Colors.red
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<PatientBill>(
          future: bill,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget> [

                     ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Cost of medications", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("USD: ${snapshot.data!.medicationsCost} ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),

                    ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Cost of procedures", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("USD: ${snapshot.data!.proceduresCost} ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),


                     ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Overnight charge cost", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("USD: ${snapshot.data!.overnightCharge} ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),

                     ListTile(
                        leading: Icon(
                            Icons.location_city,
                            color: Colors.red, 
                        ),
                        title: Text("Total Cost ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("USD: ${snapshot.data!.total} ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        trailing: Icon(
                            Icons.more_vert,
                        ),
                    ),

                    ListTile(
                        leading: Icon(
                            Icons.money,
                            color: Colors.red, 
                        ),
                        title: Text("DISCHARGE and bill patient ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        subtitle: Text("Complete patient stay and send billing cost. "),
                        trailing: Icon(
                            Icons.check,
                        ),
                    ),

                ], 
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )
      ),
    );
  }
}