import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercise Area")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Current Movement',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/shoulder_press.png',
              width: 300.0,
            ), // Resim burada yükleniyor
            SizedBox(height: 50),
            Text('Accuracy Rate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('75%',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(
                        255, 17, 201, 17))), // Dummy accuracy rate
            SizedBox(height: 50),
            Text('Time Remaining',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            CountdownTimer(), // Custom Timer Widget
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// CountdownTimer sınıfınız aynı kalabilir

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _remainingTime = 30;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_remainingTime == 0) {
        timer.cancel();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_remainingTime s',
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
    );
  }
}
