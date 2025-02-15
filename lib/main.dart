import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: HomeScreen()),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Flutter 101"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
          child: Center(
              child: Container(
        height: 300,
        width: 300,
        color: Colors.blueGrey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, top: 40, bottom: 20, right: 20),
          child: Text(
            "Hello",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.pink.withOpacity(0.9),
            ),
          ),
        ),
      ))),
    );
  }
}
