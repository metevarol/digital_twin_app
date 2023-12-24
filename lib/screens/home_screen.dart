import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _accuracy = "0";
  String _currentMove = "";
  int _duration = 0;
  bool _isStarted = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("Users/${user.uid}/currentMovement");

      ref.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          setState(() {
            _accuracy = '${data['accuracy'] ?? 0}%';
            _currentMove = data['currentMove'] ?? '';
            _duration = int.parse(data['duration'] ?? '0');
            _isStarted = data['isStarted'] == 'true';
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercise Area")),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: _isStarted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Egzersiz bilgileri
                  // ... Egzersiz ile ilgili widget'lar ...
                  Text('Current Movement',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('$_currentMove',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal)),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/shouldergif.gif',
                    width: 300.0,
                  ), // Resim burada yükleniyor
                  SizedBox(height: 50),
                  Text('Accuracy Rate: $_accuracy',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 17, 201, 17))),
                  SizedBox(height: 50),
                  Text('Time Remaining',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  CountdownTimer(duration: 30),
                  SizedBox(height: 50),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Exercises waiting..',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
      ),
    );
  }
}

// CountdownTimer sınıfınız aynı kalabilir
class CountdownTimer extends StatefulWidget {
  final int duration;
  CountdownTimer({required this.duration});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingTime;
  Timer? _timer;
  late double _progress; // İlerlemeyi takip etmek için

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
    _progress = 1.0; // İlerlemenin başlangıcı (tam dolu)

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _remainingTime--;
        _progress = _remainingTime / widget.duration; // İlerlemeyi güncelle

        if (_remainingTime == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(
          value: _progress, // İlerleme değeri
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(
            Color.fromRGBO(
              35,
              135,
              46,
              1,
            ),
          ),
        ),
      ],
    );
  }
}

// CountdownTimer sınıfınızı güncelleyin

/*
class CountdownTimer extends StatefulWidget {
  final int duration;
  CountdownTimer({required this.duration});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
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
*/

/*
class CurrentMove {
  String accuracy;
  String currentMove;
  String duration;
  String isStarted;

  CurrentMove(
      {required this.accuracy,
      required this.currentMove,
      required this.duration,
      required this.isStarted});
}
*/

/*
List<CurrentMove> currentMoves = [
  CurrentMove(
      accuracy: "75", currentMove: "Move 1", duration: "30", isStarted: "true"),
  CurrentMove(
      accuracy: "65", currentMove: "Move 2", duration: "30", isStarted: "true"),
  CurrentMove(
      accuracy: "33", currentMove: "Move 3", duration: "30", isStarted: "true"),
  CurrentMove(
      accuracy: "52", currentMove: "Move 4", duration: "30", isStarted: "true"),
];
*/

/*
        SizedBox(height: 20),
        Text(
          'Remaining time: $_remainingTime s',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        */