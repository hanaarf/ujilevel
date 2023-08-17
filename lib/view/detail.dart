import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:ujilevel/view/edit.dart';

import '../onboard/utils.dart';

class DetailPage extends StatefulWidget {
  final Map data;
  DetailPage({super.key, required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // detailS2m (1:2)
            padding:
                EdgeInsets.fromLTRB(25 * fem, 21 * fem, 12 * fem, 190 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xfff5f4f2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // group137FuK (1:3)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 45 * fem),
                  width: double.infinity,
                  height: 49 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroup1y4uxoj (BGuhssv1JBePitGDJW1y4u)
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 11 * fem, 79 * fem, 11 * fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                // vectorVHs (1:4)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 112 * fem, 0 * fem),
                                width: 10 * fem,
                                height: 17 * fem,
                                child: Image.asset(
                                  'assets/img/vector.png',
                                  width: 10 * fem,
                                  height: 17 * fem,
                                ),
                              ),
                            ),
                            Text(
                              // deepmindUQh (1:5)
                              'Deepmind',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff09143a),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // darkbluemodernwatercolourlette (1:6)
                        width: 56 * fem,
                        height: 49 * fem,
                        child: Image.asset(
                          'assets/img/darkbluemodernwatercolourletterdlogo-removebg-preview-2.png',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // tiganbianwelcome2h2Z (1:34)
                  margin: EdgeInsets.fromLTRB(
                      66 * fem, 0 * fem, 79 * fem, 51 * fem),
                  width: double.infinity,
                  height: 132 * fem,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/img/tigan-bian-welcome-2-bg.png',
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(5 * fem, 5 * fem),
                        blurRadius: 5 * fem,
                      ),
                    ],
                  ),
                ),
                Container(
                  // group138Z4m (1:35)
                  margin: EdgeInsets.fromLTRB(
                      92 * fem, 0 * fem, 104 * fem, 62 * fem),
                  width: double.infinity,
                  height: 47 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // namehanaUSd (1:36)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 105 * fem,
                            height: 24 * fem,
                            child: Text(
                              'Name : Hana\n\n',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff1a4b6c),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // counselorrickymZDB (1:37)
                        left: 0 * fem,
                        top: 23 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 157 * fem,
                            height: 24 * fem,
                            child: Text(
                              'Counselor : Ricky M',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff1a4b6c),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupqbydDoX (BGugrjwspNqiTm7ZrBQbYD)
                  margin: EdgeInsets.fromLTRB(
                      30 * fem, 0 * fem, 57 * fem, 26 * fem),
                  width: double.infinity,
                  height: 43 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group132M93 (1:7)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 120 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            1.67 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: 83 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupcum74JM (BGuh4QH7YcyHXZTF6McUM7)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 7 * fem, 5 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // infofill0wght400grad0opsz481Zk (1:8)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 15.67 * fem, 0 * fem),
                                    width: 16.67 * fem,
                                    height: 16.67 * fem,
                                    child: Image.asset(
                                      'assets/img/infofill0wght400grad0opsz48-1.png',
                                      width: 16.67 * fem,
                                      height: 16.67 * fem,
                                    ),
                                  ),
                                  Text(
                                    // statusrk1 (1:10)
                                    'Status',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff082032),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              // waitingntZ (1:11)
                              widget.data['status'],
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.5 * ffem / fem,
                                color: Color(0xffbc8737),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group131joo (1:17)
                        padding: EdgeInsets.fromLTRB(
                            1.67 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: 63 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupzadwfhT (BGuhEyopau6yszWBLTZADw)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 5 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // schedulefill0wght400grad0opsz4 (1:18)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 11.67 * fem, 0 * fem),
                                    width: 16.67 * fem,
                                    height: 16.67 * fem,
                                    child: Image.asset(
                                      'assets/img/schedulefill0wght400grad0opsz48-1.png',
                                      width: 16.67 * fem,
                                      height: 16.67 * fem,
                                    ),
                                  ),
                                  Text(
                                    // timeKX7 (1:21)
                                    'Time',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff082032),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // Fff (1:20)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5 * fem, 0 * fem),
                              child: Text(
                                widget.data['jam'],
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w300,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xffbc8737),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupwsu3n9o (BGuhNeFih7hnTyUCGWwsu3)
                  margin: EdgeInsets.fromLTRB(
                      30 * fem, 0 * fem, 38 * fem, 93 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // group135WrV (1:12)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 99 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            2.5 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: 104 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroup8bkfpsB (BGuhWirbDdP122ALpJ8bKF)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 39 * fem, 5 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // calendarmonthfill0wght400grad0 (1:13)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 16.5 * fem, 0 * fem),
                                    width: 15 * fem,
                                    height: 16.67 * fem,
                                    child: Image.asset(
                                      'assets/img/calendarmonthfill0wght400grad0opsz48-1.png',
                                      width: 15 * fem,
                                      height: 16.67 * fem,
                                    ),
                                  ),
                                  Text(
                                    // dateUgq (1:16)
                                    'Date',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff082032),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // QKb (1:15)
                              margin: EdgeInsets.fromLTRB(
                                  31.5 * fem, 0 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                widget.data['tanggal'],
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w300,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xffbc8737),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // group136LU9 (1:22)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 10 * fem, 0 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            3.33 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: 82 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupujdf4Q9 (BGuhfdmQajD3WCJkbWuJDf)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 12 * fem, 7 * fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // locationonfill0wght400grad0ops (1:23)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 17.33 * fem, 0 * fem),
                                    width: 13.33 * fem,
                                    height: 16.67 * fem,
                                    child: Image.asset(
                                      'assets/img/locationonfill0wght400grad0opsz48-1.png',
                                      width: 13.33 * fem,
                                      height: 16.67 * fem,
                                    ),
                                  ),
                                  Text(
                                    // placeAbb (1:26)
                                    'Place',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff082032),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              // canteenJho (1:25)
                              widget.data['tempat'],
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.5 * ffem / fem,
                                color: Color(0xffbc8737),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // group33eFs (1:27)
                  margin:
                      EdgeInsets.fromLTRB(37 * fem, 0 * fem, 50 * fem, 0 * fem),
                  width: double.infinity,
                  height: 30 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: widget.data['status'] == "waiting"
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Edit(data: widget.data,)));
                              },
                              child: Container(
                                // group133AV7 (1:28)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 28 * fem, 0 * fem),
                                width: 119 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff082032),
                                  borderRadius: BorderRadius.circular(10 * fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Update',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // group134EE5 (1:31)
                              width: 119 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff082032),
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Delete',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 13 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
