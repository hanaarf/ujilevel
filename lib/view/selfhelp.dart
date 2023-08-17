import 'package:flutter/material.dart';
import 'package:ujilevel/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class self extends StatefulWidget {
  const self({super.key});

  @override
  State<self> createState() => _selfState();
}

class _selfState extends State<self> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20, left: 5),
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
                        child: Text(
                          'self help',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xff454545),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset('assets/img/logodeep.png')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10), // Adju
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: Color(0xffA5A5A5),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[200],
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.only(bottom: 10),
                //   child: Padding(
                //     padding: const EdgeInsets.all(15),
                //     child: Container(
                //       height: 50,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //           color: Color(0xFFE5E6E8),
                //           borderRadius: BorderRadius.circular(20)),
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 20),
                //         child: TextField(
                //           cursorHeight: 20,
                //           autofocus: false,
                //           decoration: InputDecoration(
                //               hintText: "search topik",
                //               icon:Icon(Icons.search),
                //               border: InputBorder.none,),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Center(
                    child: Wrap(
                      // spacing: 20,
                      // //unutk mngtur jarak container ynng di tengah2
                      // runSpacing: 20.0,
                      children: <Widget>[
                        Container(
                          child: Card(
                            color: Color(0xffBFD1DD),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/img/d4.png",
                                    width: 90.0,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'managing stress',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xff1A1A1A),
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 50),
                                            child: Text('9 sessions',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff1A1A1A),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Center(
                    child: Wrap(
                      // spacing: 20,
                      // //unutk mngtur jarak container ynng di tengah2
                      // runSpacing: 20.0,
                      children: <Widget>[
                        Container(
                          child: Card(
                            color: Color(0xff3D5A67),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/img/d3.png",
                                    width: 90.0,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'get rid of insecurity',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color.fromARGB(
                                                      255, 242, 242, 242),
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 60),
                                            child: Text('9 sessions',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color.fromARGB(
                                                        255, 243, 243, 243),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Center(
                    child: Wrap(
                      // spacing: 20,
                      // //unutk mngtur jarak container ynng di tengah2
                      // runSpacing: 20.0,
                      children: <Widget>[
                        Container(
                          child: Card(
                            color: Color(0xffBFD1DD),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/img/d2.png",
                                    width: 90.0,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'reduce panic attacks',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xff1A1A1A),
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 50),
                                            child: Text('9 sessions',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xff1A1A1A),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Center(
                    child: Wrap(
                      // spacing: 20,
                      // //unutk mngtur jarak container ynng di tengah2
                      // runSpacing: 20.0,
                      children: <Widget>[
                        Container(
                          child: Card(
                            color: Color(0xff3D5A67),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/img/d1.png",
                                    width: 90.0,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              'make life happy',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color.fromARGB(
                                                      255, 223, 223, 223),
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        Container(
                                            margin: EdgeInsets.only(left: 50),
                                            child: Text('9 sessions',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13))),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
