import 'package:flutter/material.dart';
import 'package:project/admin_editUser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: admin_profile(),
    );
  }
}

class admin_profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F4),//FDF7F4
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,),
       
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileHeader(),
            SizedBox(height: 20),
            SensorSection(),
            SizedBox(height: 20),
            UserSection(),
          ],
        ),
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/profile.png'), 
        ),
        SizedBox(width: 10),
        IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios,  color: Color.fromARGB(209, 71, 102, 59),),
                ),
        
   
      ],
    );
  }
}

class SensorSection extends StatelessWidget {
  final List<Map<String, String>> sensors = [
    {'name': 'Sensor 1', 'location': 'Meeting room'},
    {'name': 'Sensor 2', 'location': 'Manager room'},
    {'name': 'Sensor 3', 'location': 'Room 16'},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SENSORS', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(209, 71, 102, 59),)),
                 IconButton(
              icon: Icon(Icons.add_circle, color: Color.fromARGB(209, 71, 102, 59),),
              onPressed: () {},
            ),
              ],
            ),
            ...sensors.map((sensor) => SensorTile(sensor)).toList(),
          ],
        ),
      ),
    );
  }
}

class SensorTile extends StatelessWidget {
  final Map<String, String> sensor;

  SensorTile(this.sensor);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sensor['name']!),
      subtitle: Text(sensor['location']!),
      trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow,  color: Color.fromARGB(209, 71, 102, 59),),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.edit,  color: Color.fromARGB(209, 71, 102, 59),),
              onPressed: () {},
            ),
          ],
        ),
    );
  }
}

class UserSection extends StatelessWidget {
  final List<String> users = [
    'ALanoud Almutairi',
    'Mulook Almutairi'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('USERS', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(209, 71, 102, 59),)),
            ...users.map((user) => UserTile(user)).toList(),
          ],
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String user;

  UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user),
      trailing:  IconButton(
              icon: Icon(Icons.edit,  color: Color.fromARGB(209, 71, 102, 59),),
              onPressed: () {
                 Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>admin_editUser()),
  );
              },
            ),
    );
  }
}
