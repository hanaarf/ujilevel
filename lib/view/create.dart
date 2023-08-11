import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ujilevel/view/history.dart';
import 'package:http/http.dart' as http;

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedValue; // Use Str
  TextEditingController _date = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  TextEditingController _deskripsiController = TextEditingController();
  TextEditingController _jeniskonseling_idController = TextEditingController();
  TextEditingController _siswa_idController = TextEditingController();
  TextEditingController _gurubk_idController = TextEditingController();
  TextEditingController _walas_idController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _jamController = TextEditingController();
  TextEditingController _tempatController = TextEditingController();
  int _selectedJenisKonseling = 1; // Default value

  Future saveProduct() async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/api/auth/store"), body: {
      "deskripsi": _deskripsiController.text,
      'jeniskonseling_id': _selectedJenisKonseling.toString(),
      "siswa_id": _siswa_idController.text,
      "gurubk_id": _gurubk_idController.text,
      "walas_id": _walas_idController.text,
      // "status": _statusController.text,
      "tanggal": _date.text,
      "jam": _jamController.text,
      "tempat": _tempatController.text,
    });

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(top: 20, bottom: 30, left: 10, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        margin: EdgeInsets.only(left: 35, top: 5),
                        child: Text(
                          'Create counseling',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xff09143A),
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: TextFormField(
                      controller: _deskripsiController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          labelText: 'Deskripsi',
                          hintStyle: const TextStyle(
                              color: Color(0xff454545),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan tesk";
                        }
                        return null;
                      },
                    ),
                  ),
                 
                  const SizedBox(height: 20.0),
                  Container(
                     padding: const EdgeInsets.only(left: 35, right: 35, top: 5),
                    child: DropdownButtonFormField<int>(
                      value: _selectedJenisKonseling,
                      onChanged: (value) {
                        setState(() {
                          _selectedJenisKonseling = value!;
                        });
                      },
                      items: [
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text('Bimbingan Pribadi'),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text('Bimbingan Sosial'),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text('Bimbingan Karir'),
                        ),
                        DropdownMenuItem<int>(
                          value: 4,
                          child: Text('Bimbingan Belajar'),
                        ),
                      ],
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xffBFD1DD)), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          // enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xffBFD1DD)), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Counseling',
                      ),
                      onSaved: (value) {
                        _selectedJenisKonseling = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Pilih jenis konseling';
                        }
                        return null;
                      },
                    ),
                  ),

                 
                  Container(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: TextFormField(
                      controller: _siswa_idController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          labelText: 'siswa',
                          hintStyle: const TextStyle(
                              color: Color(0xff454545),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan tesk";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: TextFormField(
                      controller: _gurubk_idController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          labelText: 'gurubk',
                          hintStyle: const TextStyle(
                              color: Color(0xff454545),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan tesk";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: TextFormField(
                      controller: _walas_idController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          labelText: 'walas',
                          hintStyle: const TextStyle(
                              color: Color(0xff454545),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan tesk";
                        }
                        return null;
                      },
                    ),
                  ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.only(left: 35, right: 35, top: 20),
                  //   child: TextFormField(
                  //     controller: _statusController,
                  //     decoration: InputDecoration(
                  //         focusedBorder: OutlineInputBorder(
                  //           // enabledBorder: UnderlineInputBorder(
                  //           borderSide: const BorderSide(
                  //               width: 3,
                  //               color: Color(0xffBFD1DD)), //<-- SEE HERE
                  //           borderRadius: BorderRadius.circular(50.0),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           // enabledBorder: UnderlineInputBorder(
                  //           borderSide: const BorderSide(
                  //               width: 3,
                  //               color: Color(0xffBFD1DD)), //<-- SEE HERE
                  //           borderRadius: BorderRadius.circular(50.0),
                  //         ),
                  //         labelText: 'status',
                  //         hintStyle: const TextStyle(
                  //             color: Color(0xff454545),
                  //             fontFamily: 'Poppins',
                  //             fontWeight: FontWeight.w500)),
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "masukan tesk";
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: TextField(
                      controller: _date,
                      decoration: InputDecoration(
                        labelText: "select date",
                        focusedBorder: OutlineInputBorder(
                          // enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color(0xffBFD1DD)), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          // enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color(0xffBFD1DD)), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickeddate != null) {
                          setState(() {
                            _date.text =
                                DateFormat('yyyy-MM-dd').format(pickeddate);
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: TextFormField(
                      controller: _jamController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          labelText: 'Jam',
                          hintStyle: const TextStyle(
                              color: Color(0xff454545),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan tesk";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: TextFormField(
                      controller: _tempatController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xffBFD1DD)), //<-- SEE HERE
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          labelText: 'Tempat',
                          hintStyle: const TextStyle(
                              color: Color(0xff454545),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan tesk";
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 120,
                            height: 45,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xffD4D5D8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {},
                              child: InkWell(
                                onTap: () {
                                  // loginUser();
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Color(0xff454545),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )),
                        SizedBox(
                            width: 120,
                            height: 45,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xff3D5A67),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Jika form valid, lanjutkan dengan menyimpan produk
                                  saveProduct().then((value) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => history()),
                                    );
                                  });
                                }
                              },
                              child: InkWell(
                                onTap: () {
                                  // loginUser();
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Container(
                  //   padding: EdgeInsets.only(left: 25, right: 25),
                  //   child: DropdownButtonFormField<String>(
                  //     decoration: InputDecoration(
                  //       focusedBorder: OutlineInputBorder(
                  //         // enabledBorder: UnderlineInputBorder(
                  //         borderSide: const BorderSide(
                  //             width: 3,
                  //             color: Color(0xffA1BCCD)), //<-- SEE HERE
                  //         borderRadius: BorderRadius.circular(50.0),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         // enabledBorder: UnderlineInputBorder(
                  //         borderSide: const BorderSide(
                  //             width: 3,
                  //             color: Color(0xffA1BCCD)), //<-- SEE HERE
                  //         borderRadius: BorderRadius.circular(50.0),
                  //       ),
                  //       labelText: 'Counseling',
                  //     ),
                  //     value: gender,
                  //     items: genderOptions.map((String value) {
                  //       return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(value),
                  //       );
                  //     }).toList(),
                  //     onChanged: (newValue) {
                  //       setState(() {
                  //         gender = newValue;
                  //       });
                  //     },
                  //   ),
                  // ),

                  // SizedBox(height: 20.0),
                  // DropdownButtonFormField<String>(
                  //   decoration: InputDecoration(
                  //     labelText: 'Religion',
                  //   ),
                  //   value: religion,
                  //   items: religionOptions.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (newValue) {
                  //     setState(() {
                  //       religion = newValue;
                  //     });
                  //   },
                  // ),
                  // SizedBox(height: 20.0),
                  // DropdownButtonFormField<String>(
                  //   decoration: InputDecoration(
                  //     labelText: 'Education',
                  //   ),
                  //   value: education,
                  //   items: educationOptions.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (newValue) {
                  //     setState(() {
                  //       education = newValue;
                  //     });
                  //   },
                  // ),



 // Container(
                //   margin: EdgeInsets.only(top: 0, bottom: 20),
                //   child: const Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         'Create Counseling',
                //         style: TextStyle(
                //             fontFamily: 'Poppins',
                //             color: Color(0xff09143A),
                //             fontSize: 19,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     ],
                //   ),
                // ),

                // Container(
                //   margin: EdgeInsets.only(left: 25, top: 40),
                //   child: Text(
                //     'Desc',
                //     style: TextStyle(
                //         fontFamily: 'Poppins',
                //         color: Color(0xff3D5A67),
                //         fontSize: 15,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 25, right: 25, bottom: 15, top: 10),
                //   child: Container(
                //     height: 50,
                //     width: double.infinity,
                //     child: TextField(
                //       cursorHeight: 20,
                //       autofocus: false,
                //       decoration: InputDecoration(
                //         hintText: "Type desc",
                //         contentPadding: EdgeInsets.all(20.0),
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide(
                //               color: Color.fromARGB(255, 46, 156, 224),
                //               width: 2),
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 25, top: 5),
                //   child: Text(
                //     'Time',
                //     style: TextStyle(
                //         fontFamily: 'Poppins',
                //         color: Color(0xff3D5A67),
                //         fontSize: 15,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 25, right: 25, bottom: 15, top: 10),
                //   child: Container(
                //     height: 50,
                //     width: double.infinity,
                //     child: TextField(
                //       cursorHeight: 20,
                //       autofocus: false,
                //       decoration: InputDecoration(
                //           hintText: "Type Time",
                //           contentPadding: EdgeInsets.all(20.0),
                //           border: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   color: Color(0xffA1BCCD), width: 2),
                //               borderRadius: BorderRadius.circular(30))),
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(left: 25, top: 5),
                //   child: Text(
                //     'Date',
                //     style: TextStyle(
                //         fontFamily: 'Poppins',
                //         color: Color(0xff3D5A67),
                //         fontSize: 15,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 25, right: 25, bottom: 15, top: 10),
                //   child: Container(
                //     height: 50,
                //     width: double.infinity,
                //     child: TextField(
                //       cursorHeight: 20,
                //       autofocus: false,
                //       decoration: InputDecoration(
                //           hintText: "Type Date",
                //           contentPadding: EdgeInsets.all(20.0),
                //           border: OutlineInputBorder(
                //               borderSide: BorderSide(
                //                   color: Color(0xffA1BCCD), width: 2),
                //               borderRadius: BorderRadius.circular(30))),
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.only(left: 20,right: 20,top: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //        SizedBox(
                //               width: 120,
                //               height: 35,
                //               child: TextButton(
                //                 style: TextButton.styleFrom(
                //                   backgroundColor: Color(0xffD4D5D8),
                //                   shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(30),
                //                   ),
                //                 ),
                //                 onPressed: () {},
                //                 child: InkWell(
                //                   onTap: () {
                //                     // loginUser();
                //                   },
                //                   child: Text(
                //                     "Cancel",
                //                     style: TextStyle(
                //                         color: Color(0xff454545),
                //                         fontFamily: 'Poppins',
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                 ),
                //               )),
                //        SizedBox(
                //               width: 120,
                //               height: 35,
                //               child: TextButton(
                //                 style: TextButton.styleFrom(
                //                   backgroundColor: Color(0xff3D5A67),
                //                   shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(30),
                //                   ),
                //                 ),
                //                 onPressed: () {},
                //                 child: InkWell(
                //                   onTap: () {
                //                     // loginUser();
                //                   },
                //                   child: Text(
                //                     "Save",
                //                     style: TextStyle(
                //                         color: Color(0xffffffff),
                //                         fontFamily: 'Poppins',
                //                         fontWeight: FontWeight.w400),
                //                   ),
                //                 ),
                //               ))
                //     ],
                //   ),
                // ),