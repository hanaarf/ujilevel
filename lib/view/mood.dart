import 'package:flutter/material.dart';
import 'package:ujilevel/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:table_calendar/table_calendar.dart';

class Mood extends StatefulWidget {
  const Mood({super.key});

  @override
  State<Mood> createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(child: Image.asset('assets/img/bgtm.png')),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: IconButton(
                      iconSize: 25.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
                Container(
                  child: IconButton(
                      iconSize: 30.0,
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      icon: Icon(Icons.access_time)),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                  child: Center(
                child: Column(
                  children: [
                    Image.asset('assets/img/tm1.png'),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          'How do you feel now?',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff454545),
                              fontSize: 17),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 43,
                          decoration: BoxDecoration(
                            color: Color(0xffBFD1DD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(Icons.emoji_emotions),
                          ),
                        ),
                        SizedBox(width: 10), // Jarak antar kontainer
                        Container(
                          width: 50,
                          height: 43,
                          decoration: BoxDecoration(
                               color: Color(0xffBFD1DD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 43,
                          decoration: BoxDecoration(
                               color: Color(0xffBFD1DD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 43,
                          decoration: BoxDecoration(
                              color: Color(0xffBFD1DD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 43,
                          decoration: BoxDecoration(
                              color: Color(0xffBFD1DD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 43,
                          child: Center(
                            child: Text(
                              'Happy',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Jarak antar kontainer
                        Container(
                          width: 50,
                          height: 43,
                          child: Center(
                              child: Text(
                            'Good',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 12),
                          )),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 43,
                          child: Center(
                              child: Text(
                            'Normal',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 12),
                          )),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 43,
                          child: Center(
                              child: Text(
                            'Sad',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 12),
                          )),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 43,
                          child: Center(
                              child: Text(
                            'Angry',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 12),
                          )),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TableCalendar(
                        headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
                        focusedDay: today, 
                        firstDay: DateTime.utc(2020, 10, 16), 
                        lastDay: DateTime.utc(2025, 3, 14)),
                    )
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
