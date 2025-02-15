import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: admin_editSensor(),
    );
  }
}

class admin_editSensor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFFDF7F4),//FDF7F4
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
 Center(
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: Color(0xFFFDF7F4),
      border: Border.all(
        color: Color.fromARGB(209, 71, 102, 59), // Border color
      width: 1, // Border width
    ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      "Sensor 1",
      style: TextStyle(color: Color.fromARGB(209, 71, 102, 59), fontSize: 16 ,fontWeight:FontWeight.bold),
    ),
    
  ),
),
SizedBox(height: 20),


            SizedBox(height: 20),
            _buildTextField(label: 'Sensor ID', initialValue: '10'),
            _buildTextField(label: 'Room Name', initialValue: 'meeting room'),
            _buildTextField(label: 'Room Size', initialValue: '3 * 4 m' ),
            _buildTextField(label: 'Average number of people', initialValue: '7 people'),
            SizedBox(height:20),
            Text('Room Light', style: TextStyle(color: Color.fromARGB(209, 71, 102, 59) ,fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildRadioOption('0%' , selected: true),
                _buildRadioOption('50%'),
                _buildRadioOption('100%'),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Color.fromARGB(209, 71, 102, 59),fontWeight: FontWeight.bold)),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          controller: TextEditingController(text: initialValue),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildRadioOption(String label, {bool selected = false}) {
    return Row(
      children: [
        Radio(
          value: label,
          groupValue: selected ? label : null,
          onChanged: (value) {},
        ),
        Text(label),
      ],
    );
  }
}
