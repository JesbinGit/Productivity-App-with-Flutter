import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  late int _minutes;
  late int _seconds;
  late bool _isActive;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _minutes = 25;
    _seconds = 0;
    _isActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Timer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_minutes:${_seconds.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _startTimer();
                  },
                  child: Text("Start"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _stopTimer();
                  },
                  child: Text("Stop"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _resetTimer();
                  },
                  child: Text("Reset"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Slider(
              min: 1,
              max: 60,
              divisions: 59,
              value: _minutes.toDouble(),
              onChanged: (value) {
                setState(() {
                  _minutes = value.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    if (!_isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds -= 1;
          } else {
            if (_minutes > 0) {
              _minutes -= 1;
              _seconds = 59;
            } else {
              _isActive = false;
              _timer.cancel();
            }
          }
        });
      });
      _isActive = true;
    }
  }

  void _stopTimer() {
    if (_isActive) {
      _timer.cancel();
      _isActive = false;
    }
  }

  void _resetTimer() {
    if (!_isActive) {
      setState(() {
        _minutes = 25;
        _seconds = 0;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomTimer(),
  ));
}
