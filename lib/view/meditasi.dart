import 'package:flutter/material.dart';
import 'package:ujilevel/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class Meditasi extends StatefulWidget {
  const Meditasi({super.key});

  @override
  State<Meditasi> createState() => _MeditasiState();
}

class _MeditasiState extends State<Meditasi> {
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
                          'Meditasi',
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
                  child: Column(
                    children: [
                      Container(
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              margin: EdgeInsets.only(right: 10),
                              width: 120,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xffBFD1DD),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'suara alam',
                                style: TextStyle(
                                    fontFamily: 'Poppins', color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 8),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 97,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xffE5E6E8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'musik relax',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff484646)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 8),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 97,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xffE5E6E8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'trek religi',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff484646)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3, vertical: 8),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 97,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xffE5E6E8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'suara hujan',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff484646)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 8),
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              width: 97,
                              height: 39,
                              decoration: BoxDecoration(
                                color: Color(0xffE5E6E8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'piano',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff484646)),
                              ),
                            ),
                            // Add more containers as needed
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 5),
                              width: 148,
                              height: 131,
                              decoration: BoxDecoration(
                                color: Color(0xff3D5A67),
                                borderRadius: BorderRadius.circular(
                                    10), // Ubah nilai radius sesuai keinginan
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/img/d4.png",
                                    width: 90.0,
                                  ),
                                  Text(
                                    'Emergency',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                               padding: EdgeInsets.only(top: 15),
                              width: 148,
                              height: 131,
                              decoration: BoxDecoration(
                                color: Color(0xffBFD1DD),
                                borderRadius: BorderRadius.circular(
                                    10), // Ubah nilai radius sesuai keinginan
                              ),
                               child: Column(
                                children: [
                                  Image.asset(
                                    "assets/img/d6.png",
                                 
                                  ),
                                  Text(
                                    'Bedtime story',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xff454545),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                         Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              width: 148,
                              height: 131,
                              decoration: BoxDecoration(
                                color: Color(0xffBFD1DD),
                                borderRadius: BorderRadius.circular(
                                    10), // Ubah nilai radius sesuai keinginan
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/img/d2.png",
                                  ),
                                  Text(
                                    'Emergency',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xff454545),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                               padding: EdgeInsets.only(top: 15),
                              width: 148,
                              height: 131,
                              decoration: BoxDecoration(
                                color: Color(0xff3D5A67),
                                borderRadius: BorderRadius.circular(
                                    10), // Ubah nilai radius sesuai keinginan
                              ),
                               child: Column(
                                children: [
                                  Image.asset(
                                    "assets/img/d3.png",
                                 
                                  ),
                                  Text(
                                    'Resitance',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 148,
                              height: 131,
                              decoration: BoxDecoration(
                                color: Color(0xff3D5A67),
                                borderRadius: BorderRadius.circular(
                                    10), // Ubah nilai radius sesuai keinginan
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/img/d1.png",width: 80,
                                  ),
                                  Text(
                                    'affirmation',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                               padding: EdgeInsets.only(top: 15),
                              width: 148,
                              height: 131,
                              decoration: BoxDecoration(
                                color: Color(0xffBFD1DD),
                                borderRadius: BorderRadius.circular(
                                    10), // Ubah nilai radius sesuai keinginan
                              ),
                               child: Column(
                                children: [
                                  Image.asset(
                                    "assets/img/d5.png",
                                 
                                  ),
                                  Text(
                                    'anxiety',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xff454545),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
