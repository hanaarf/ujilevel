import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ujilevel/view/history.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';

class Edit extends StatefulWidget {
  final Map data;
  Edit({super.key, required this.data});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedValue; // Use Str
  TextEditingController _date = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _jamController = TextEditingController();
  TextEditingController _tempatController = TextEditingController();
  int _selectedJenisKonseling = 1; // Default value

  late SharedPreferences preferences;
  Future saveProduct() async {
    preferences = await SharedPreferences.getInstance();
    int userId = preferences.getInt('user_id') ?? 0;

    final response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/jadwal/edit"), body: {
      'id': widget.data['id'].toString(),
      "tanggal": _date.text,
      "jam": _jamController.text,
      "tempat": _tempatController.text,
    });
    final responses = jsonDecode(response.body);
    if (responses['status'] == 200) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('yyyy-MM-dd');
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
                          'Update counseling',
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
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: DateTimeField(
                      format: format,
                      onShowPicker: (context, currentValue) async {
                        final date = showDatePicker(
                            context: context,
                            initialDate: currentValue ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        return date;
                      },
                      controller: _date..text = widget.data['tanggal'],
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
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 20),
                    child: TextFormField(
                      controller: _jamController..text = widget.data['jam'],
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
                      controller: _tempatController
                        ..text = widget.data['tempat'],
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
