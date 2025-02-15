import 'package:flutter/material.dart';


void main() {
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7F5), // Background color
    appBar: AppBar(
      backgroundColor: Colors.transparent, // No background color
      elevation: 0, // No elevation (no shadow)
      toolbarHeight: 10,
    ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child : Text(
        "Overview",  // Title of the AppBar
        style: TextStyle(
          color: Color.fromARGB(209, 71, 102, 59),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ) , ),
            // User Profile Row
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/icons/Person.png"), // Change to your image path
                ),
              
              ],
            ),



  const SizedBox(width: 10),
          Center(
              child: Text(
                  "Room 10, Sensor 1",
                  style: TextStyle(color: Color.fromARGB(209, 71, 102, 59), fontSize: 14),
                )) ,

            const SizedBox(height: 50),

            // Main CO2 Circular Progress
            Center(
              child: Column(
                children: [
                  CustomCircularChart(value: 300, size: 150 , division : 1000),
                 
                  const SizedBox(height: 30 ),
                    const Text(
                    "CO2 (ppm)",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                
                 
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Humidity & Temperature
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DataCard(title: "HUMIDITY (%)", value: 50),
                DataCard(title: "TEMPERATURE (C)", value: 25),
              ],
            ),

            const SizedBox(height: 60),

            // Status Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StatusIndicator(color: Colors.green, text: "Good"),
                StatusIndicator(color: Colors.orange, text: "Fair"),
                StatusIndicator(color: Colors.red, text: "Poor"),
              ],
            ),

            const Spacer(),

            // Keep Going Button
            Center(
              child: Text(
                "KEEP GOING",
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
        
      ),
    );
  }
}

// Custom Circular Chart
class CustomCircularChart extends StatelessWidget {
  final double value;
  final double size;
 final double division ;

  const CustomCircularChart({super.key, required this.value, required this.size , required this.division  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
             value : value / division ,
              strokeWidth: 15,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
                Text(
            "$value",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}





// Data Card Widget
class DataCard extends StatelessWidget {
  final String title;
  final double value;

  const DataCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          CustomCircularChart(value: value, size: 80 , division: 100),
          const SizedBox(height: 25),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Status Indicator Widget
class StatusIndicator extends StatelessWidget {
  final Color color;
  final String text;

  const StatusIndicator({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
