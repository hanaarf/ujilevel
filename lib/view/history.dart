import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ujilevel/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ujilevel/view/create.dart';
import 'package:ujilevel/view/edit.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  // ngenalin data
  late SharedPreferences preferences;
  bool isLoading = false;
  void initState() {
    super.initState();
    getBuku();
    getUserData();
  }

//function ambil data user
  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();

    setState(() {
      isLoading = false;
    });
  }

//ngambil data jadwal
  Future getBuku() async {
    preferences = await SharedPreferences.getInstance();
    int userId = preferences.getInt('user_id') ??
        0; // Default value jika 'user_id' tidak ditemukan
    String id = userId.toString();
    final String url =
        'http://127.0.0.1:8000/api/auth/siswa?id=' + id;
    var respone = await http.get(Uri.parse(url));
    var jsonResponse = jsonDecode(respone.body);
    if (respone.statusCode == 200) {
      var jsonResponse = jsonDecode(respone.body);
      var dataList = jsonResponse['data'];

      return jsonResponse;
      // for (var data in dataList) {
      //   var selectedField = data['siswa']['']; // Ganti 'field' dengan field yang diinginkan
      //   return print(selectedField);
      // }
    } else {
      print('Request failed with status: ${respone.statusCode}');
    }
  }

  // Future deleteProduct(String productId) async {
  //   String url =  'http://127.0.0.1:8000/api/auth/jadwal' + productId;
  //   var response  = await http.delete(Uri.parse(url));
  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 83, 0, 0),
                              ),
                              Icon(
                                Icons.reorder,
                                color: Color(0xFFf000000),
                                size: 40,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0, left: 230),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        child:  Image.asset('assets/img/logodeep.png')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Container(
                           margin: EdgeInsets.only(right: 10,top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "history",
                                    style: TextStyle(
                                        color: Color(0xff09143A),
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                            width: 120,
                            height: 35,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xff3D5A67),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Create()),
                                          );
                                        },
                              child: InkWell(
                                onTap: () {
                                  // loginUser();
                                },
                                child: const Text(
                                  "Create",
                                  style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )),
                             
                                // Container(
                                //           child: IconButton(
                                //         icon: Icon(
                                //           Icons.account_circle,
                                //           color: Colors.grey,
                                //           size: 40,
                                //         ),
                                //         onPressed: () {
                                //           Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     DataSiswa()),
                                //           );
                                //         },
                                //       )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height,
                          child: FutureBuilder(
                              future: getBuku(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: snapshot.data['data'].length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 300,
                                        height: 200,
                                        padding:
                                            EdgeInsets.only(left: 15, top: 20),
                                        margin: EdgeInsets.only(top: 32),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Color(0xFFBFD1DD),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 20, top: 10),
                                                    child: Row(
                                                      children: [
                                                        Transform.scale(
                                                          scale: 2.0,
                                                          child: Icon(
                                                            Icons
                                                                .account_circle,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Text(
                                                                snapshot.data['data'][index]['siswaid']['name'],
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFfFFFFFF),
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Text(
                                                                snapshot.data['data'][index]['deskripsi'],
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFFfFFFFFF),
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 20,
                                                                  top: 15),
                                                          height: 2,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),

                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, top: 8),
                                              child: Row(
                                                children: [
                                                  Transform.scale(
                                                    scale: 1.0,
                                                    child: Icon(
                                                      Icons.access_time,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          5), // Menggunakan SizedBox untuk memberikan jarak antara ikon dan teks
                                                  Text(
                                                    snapshot.data['data'][index]['jam'],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Poppins',
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15, top: 0),
                                                    child: Row(
                                                      children: [
                                                        Transform.scale(
                                                          scale: 0.8,
                                                          child: Icon(
                                                            Icons
                                                                .calendar_today,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                5), // Menggunakan SizedBox untuk memberikan jarak antara ikon dan teks
                                                        Text(
                                                          snapshot.data['data'][index]['tanggal'],
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 2),
                                                          child: Row(
                                                            children: [
                                                              Transform.scale(
                                                                scale: 1,
                                                                child: Icon(
                                                                  Icons
                                                                      .fiber_manual_record,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width:
                                                                      3), // Menggunakan SizedBox untuk memberikan jarak antara ikon dan teks
                                                              Text(
                                                                snapshot.data['data'][index]['status'],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
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
                                            ),
                                            // Container(
                                            //   margin: EdgeInsets.only(right: 0, top: 10),
                                            //   height: 2,
                                            //   width: 250,
                                            //   color: Colors.white,
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    height: 35,
                                                    margin: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Color.fromARGB(
                                                          75, 94, 100, 104),
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 8),
                                                      child: Column(
                                                        children: [
                                                          GestureDetector(onTap: () {
                                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Edit()));
                                                          },
                                                            child: Text(
                                                              "Update",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.white,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    height: 35,
                                                    margin: EdgeInsets.only(
                                                        left: 50, top: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: Color(0xFFf09143A),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 32,
                                                                  top: 6),
                                                          child: Column(
                                                            children: [
                                                              GestureDetector(onTap: (){
                                                                  // deleteProduct(snapshot.data['data'][index]['id'].toString()).then((value){
                                                                  //   setState(() {
                                                                      
                                                                  //   });
                                                                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('product berhasi; dihapus'),));
                                                                  // });
                                                              },
                                                                child: Text(
                                                                  "Delete",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        )
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
