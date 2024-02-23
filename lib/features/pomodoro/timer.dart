import 'dart:async';
import 'dart:ui'; // Import the Color class

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first/common/utils/constants.dart';
import 'package:first/common/widgets/appstyle.dart';
import 'package:first/common/widgets/hieght_spacer.dart';
import 'package:first/common/widgets/reusable_text.dart';
import 'package:first/features/auth/pages/login.dart';
import 'package:first/features/todo/pages/homepage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: Colors.white, // Set the background color to white
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppConst.ccBlack,
        selectedItemColor: AppConst.ccBlack,
        backgroundColor: Colors
            .white, // Set the background color of the navigation bar to white
        elevation: 8,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time,
                size: 30, color: Colors.black), // Set the icon color to black
            label: 'Pomodoro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud, size: 30, color: Colors.black),
            label: 'Weather',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomTimer()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              break;
          }
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$_minutes:${_seconds.toString().padLeft(2, '0')}",
              style: TextStyle(
                  fontSize: 40, color: Colors.black), // Set text color to black
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _startTimer();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(
                        0, 140, 255, 1), // Set button color to RGB(0, 140, 255)
                    shadowColor: Colors.black, // Set drop shadow color to black
                    elevation: 8, // Set the elevation for the drop shadow
                  ),
                  child: Text("Start",
                      style: TextStyle(
                          color:
                              Colors.black)), // Set button text color to black
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _stopTimer();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 140, 255, 1),
                    shadowColor: Colors.black,
                    elevation: 8,
                  ),
                  child: Text("Stop", style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _resetTimer();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 140, 255, 1),
                    shadowColor: Colors.black,
                    elevation: 8,
                  ),
                  child: Text("Reset", style: TextStyle(color: Colors.black)),
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
              activeColor: Color.fromRGBO(0, 140, 255,
                  1), // Set the active part of the slider to the specified blue
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
