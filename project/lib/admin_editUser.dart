import 'package:flutter/material.dart';
import 'package:project/Profile_admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: admin_editUser(),
    );
  }
}

class admin_editUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7F5),  //0xFFFDF7F5
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
       ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => admin_profile()),
  );
                  },
                ),
              ),
              SizedBox(height: 10),
            
           /// **Profile Name Text **
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
      "Alanoud Almutairi",
      style: TextStyle(color: Color.fromARGB(209, 71, 102, 59), fontSize: 16 ,fontWeight:FontWeight.bold),
    ),
  ),
),
SizedBox(height: 70),

           
  
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ASSIGNED SENSORS",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,  color: Color.fromARGB(209, 71, 102, 59),),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_circle,  color: Color.fromARGB(209, 71, 102, 59),),
                ),
              ],
            ), 
            SizedBox(height: 10),
            _buildSensorCard("Sensor 1", "Meeting room"),
            SizedBox(height: 10),
            _buildSensorCard("Sensor 2", "Manager room"),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF51633E),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorCard(String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow,  color: Color.fromARGB(209, 71, 102, 59),),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
