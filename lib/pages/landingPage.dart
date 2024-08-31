import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to WAVE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Are you a deaf user?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _setUserType(context, true),
                  child: Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () => _setUserType(context, false),
                  child: Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _setUserType(BuildContext context, bool isDeaf) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDeaf', isDeaf);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }
}