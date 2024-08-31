import 'package:flutter/material.dart';
import 'pages/landingPage.dart'; // Import your landing page
import 'pages/emergencyPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agora Video Call',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmergencyPage(), // Set the landing page as the initial screen
    );
  }
}
