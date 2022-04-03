import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'home.dart';
import 'inserts/insert_patient.dart';

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  /**
   * Get the current youtube API key stored in the django database to set it
   * in shared preferences
   * 
   * Might need to move this to the library.dart file
   */



  /**
   * Bottom navigation bar index selection
   */


  int selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30
  );
  List<Widget> _widgetOptions = <Widget> [
    Text('Property page'),
    HomePage(), 
    Text('Intake Page'), 
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Criticare"),
          backgroundColor: Colors.red
        ),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('CRITICARE LLC'),
            ),
            ListTile(
              title: const Text('Add Patient'),
              leading: Icon(
                Icons.accessible, 
                color: Colors.red,
              ),
              onTap: () {
                // Update the state of the app
                // ...
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InsertPatientPage()));
                // Then close the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person, 
                color: Colors.red,
              ),
              title: const Text('Add Employee'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(
                Icons.check_box_rounded, 
                color: Colors.red,
              ),
              title: const Text('Add Hospital Room'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),


            ListTile(
              leading: Icon(
                Icons.medication, 
                color: Colors.red,
              ),
              title: const Text('Add medication'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(
                Icons.copy_sharp, 
                color: Colors.red,
              ),
              title: const Text('Add Medicial Condition'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(
                Icons.room, 
                color: Colors.red,
              ),
              title: const Text('Add Hospital Room'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),


          ],
        ),
      ),

      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate, 
              color: Colors.grey,
            ),
            label: 'Intake'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music,
              color: Colors.grey,
            ),
            label: 'home'
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            label: 'employees'
          ),

        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),

    

    );
  }
}