import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konseling App',
      home: KonselingForm(),
    );
  }
}

class KonselingForm extends StatefulWidget {
  @override
  _KonselingFormState createState() => _KonselingFormState();
}

class _KonselingFormState extends State<KonselingForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jamController = TextEditingController();
  final TextEditingController _tempatController = TextEditingController();
  int _selectedJenisKonseling = 1; // Default value

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Form is valid, send data to API
      final Map<String, dynamic> data = {
        'deskripsi': _deskripsiController.text,
        'tanggal': _tanggalController.text,
        'jam': _jamController.text,
        'tempat': _tempatController.text,
        'jeniskonseling_id': _selectedJenisKonseling,
      };

      final response = await http.post(
        Uri.parse('YOUR_API_ENDPOINT'), // Replace with your API endpoint
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 201) {
        // Successful creation
        print('Konseling berhasil dibuat');
      } else {
        // Handle error
        print('Terjadi kesalahan saat membuat konseling');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buat Jadwal Konseling'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<int>(
                value: _selectedJenisKonseling,
                onChanged: (value) {
                  setState(() {
                    _selectedJenisKonseling = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Bimbingan Pribadi'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('Bimbingan Sosial'),
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Text('Bimbingan Karir'),
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Text('Bimbingan Belajar'),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: 'Jenis Konseling',
                ),
              ),
              TextFormField(
                controller: _deskripsiController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Deskripsi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jamController,
                decoration: InputDecoration(labelText: 'Jam'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jam tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tempatController,
                decoration: InputDecoration(labelText: 'Tempat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tempat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Buat Jadwal Konseling'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';


// class CreateKonselingScreen extends StatefulWidget {
//   const CreateKonselingScreen({super.key});

//   @override
//   State<CreateKonselingScreen> createState() => _CreateKonselingScreenState();
// }

// class _CreateKonselingScreenState extends State<CreateKonselingScreen> {
//     final _formKey = GlobalKey<FormState>();
//   TextEditingController _date = TextEditingController();
//   String? selectedValue; // Use Str
  

//   TextEditingController _deskripsiController = TextEditingController();
//   TextEditingController _tanggalController = TextEditingController();
//   TextEditingController _tempatController = TextEditingController();
//   TextEditingController _jamController = TextEditingController();
//   TextEditingController _jenisKonselingController = TextEditingController();

//   void _submitForm() async {
//     Map<String, dynamic> requestData = {
//       'deskripsi': _deskripsiController.text,
//       'tanggal': _tanggalController.text,
//       'tempat': _tempatController.text,
//       'jam': _jamController.text,
//       'jeniskonseling_id': _jenisKonselingController.text,
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(
//             'http://127.0.0.1:8000/api/auth/store'), // Ganti dengan URL API Anda
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           // Tambahkan header lain yang diperlukan (misalnya authorization token)
//         },
//         body: jsonEncode(requestData),
//       );

//       if (response.statusCode == 201) {
//         // Jika berhasil, tampilkan pesan atau navigasi ke halaman lain
//         print('Konseling berhasil dibuat');
//         // ... tambahkan aksi sesuai kebutuhan Anda ...
//       } else {
//         // Jika gagal, tampilkan pesan kesalahan
//         print('Gagal membuat jadwal konseling');
//         print('Response: ${response.body}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Buat Jadwal Konseling'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _deskripsiController,
//                 decoration: InputDecoration(labelText: 'Deskripsi'),
//               ),

//               TextFormField(
//                      controller: _tanggalController,
//                       decoration: InputDecoration(
//                         labelText: "select date",
                       
//                       ),
//                         onTap: () async{
//                           DateTime? pickeddate = await showDatePicker(
//                             context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));

//                             if(pickeddate !=null){
//                               setState(() {
//                                 _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
//                               });
//                             }
//                         },
//                     ),

//               // TextFormField(
//               //   controller: _tanggalController,
//               //     decoration: InputDecoration(
//               //           labelText: "select date",
//               //                                   focusedBorder: OutlineInputBorder(
//               //             // enabledBorder: UnderlineInputBorder(
//               //             borderSide: const BorderSide(
//               //                 width: 3, color: Color(0xffBFD1DD)), //<-- SEE HERE
//               //             borderRadius: BorderRadius.circular(50.0),
//               //           ),
//               //           enabledBorder: OutlineInputBorder(
//               //             // enabledBorder: UnderlineInputBorder(
//               //             borderSide: const BorderSide(
//               //                 width: 3, color: Color(0xffBFD1DD)), //<-- SEE HERE
//               //             borderRadius: BorderRadius.circular(50.0),
//               //           ),
//               //         ),
//               //           onTap: () async{
//               //             DateTime? pickeddate = await showDatePicker(
//               //               context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));

//               //               if(pickeddate !=null){
//               //                 setState(() {
//               //                   _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
//               //                 });
//               //               }
//               //           },
//               // ),
//               TextFormField(
//                 controller: _tempatController,
//                 decoration: InputDecoration(labelText: 'Tempat'),
//               ),
//               TextFormField(
//                 controller: _jamController,
//                 decoration: InputDecoration(labelText: 'Jam'),
//               ),
//               TextFormField(
//                 controller: _jenisKonselingController,
//                 decoration: InputDecoration(labelText: 'Jenis Konseling'),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_deskripsiController.text.isEmpty ||
//                       _tanggalController.text.isEmpty ||
//                       _tempatController.text.isEmpty ||
//                       _jamController.text.isEmpty ||
//                       _jenisKonselingController.text.isEmpty) {
//                     print('Semua field harus diisi');
//                   } else {
//                     _submitForm();
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// // class CreateKonselingScreen extends StatefulWidget {
// //   @override
// //   _CreateKonselingScreenState createState() => _CreateKonselingScreenState();
// // }

// // class _CreateKonselingScreenState extends State<CreateKonselingScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   TextEditingController _deskripsiController = TextEditingController();
// //   TextEditingController _tanggalController = TextEditingController();
// //   TextEditingController _tempatController = TextEditingController();
// //   TextEditingController _jamController = TextEditingController();
// //   TextEditingController _jenisKonselingController = TextEditingController();

// //   void _submitForm() async {
// //     Map<String, dynamic> requestData = {
// //       'deskripsi': _deskripsiController.text,
// //       'tanggal': _tanggalController.text,
// //       'tempat': _tempatController.text,
// //       'jam': _jamController.text,
// //       'jenis_konseling_id': _jenisKonselingController.text,
// //     };

// //     try {
// //       final response = await http.post(
// //         Uri.parse(
// //             'https://example.com/api/konseling-pribadi/create'), // Ganti dengan URL API Anda
// //         headers: <String, String>{
// //           'Content-Type': 'application/json',
// //           // Tambahkan header lain yang diperlukan (misalnya authorization token)
// //         },
// //         body: jsonEncode(requestData),
// //       );

// //       if (response.statusCode == 201) {
// //         // Jika berhasil, tampilkan pesan atau navigasi ke halaman lain
// //         print('Konseling berhasil dibuat');
// //         // ... tambahkan aksi sesuai kebutuhan Anda ...
// //       } else {
// //         // Jika gagal, tampilkan pesan kesalahan
// //         print('Gagal membuat jadwal konseling');
// //         print('Response: ${response.body}');
// //       }
// //     } catch (e) {
// //       print('Error: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Buat Jadwal Konseling'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               TextFormField(
// //                 controller: _deskripsiController,
// //                 decoration: InputDecoration(labelText: 'Deskripsi'),
// //               ),
// //               TextFormField(
// //                 controller: _tanggalController,
// //                 decoration: InputDecoration(labelText: 'Tanggal'),
// //               ),
// //               TextFormField(
// //                 controller: _tempatController,
// //                 decoration: InputDecoration(labelText: 'Tempat'),
// //               ),
// //               TextFormField(
// //                 controller: _jamController,
// //                 decoration: InputDecoration(labelText: 'Jam'),
// //               ),
// //               TextFormField(
// //                 controller: _jenisKonselingController,
// //                 decoration: InputDecoration(labelText: 'Jenis Konseling'),
// //               ),
// //               SizedBox(height: 16.0),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_deskripsiController.text.isEmpty ||
// //                       _tanggalController.text.isEmpty ||
// //                       _tempatController.text.isEmpty ||
// //                       _jamController.text.isEmpty ||
// //                       _jenisKonselingController.text.isEmpty) {
// //                     print('Semua field harus diisi');
// //                   } else {
// //                     _submitForm();
// //                   }
// //                 },
// //                 child: Text('Submit'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // void main() => runApp(MaterialApp(home: CreateKonselingScreen()));




// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Date Picker Form Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   DateTime selectedDate = DateTime.now();

// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime picked = await showDatePicker(
// //       context: context,
// //       initialDate: selectedDate,
// //       firstDate: DateTime(2000),
// //       lastDate: DateTime(2101),
// //     );
// //     if (picked != null && picked != selectedDate) {
// //       setState(() {
// //         selectedDate = picked;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Date Picker Form Example'),
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               TextFormField(
// //                 onTap: () => _selectDate(context),
// //                 readOnly: true,
// //                 decoration: InputDecoration(
// //                   labelText: 'Select a date',
// //                   border: OutlineInputBorder(),
// //                 ),
// //                 controller: TextEditingController(
// //                   text: "${selectedDate.toLocal()}".split(' ')[0],
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   // Implement form submission logic here
// //                 },
// //                 child: Text('Submit'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Date Picker Example',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: MyHomePage(),
// // //     );
// // //   }
// // // }

// // // class MyHomePage extends StatefulWidget {
// // //   @override
// // //   _MyHomePageState createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {
// // //   DateTime selectedDate = DateTime.now();

// // //   Future<void> _selectDate(BuildContext context) async {
// // //     final DateTime picked = await showDatePicker(
// // //       context: context,
// // //       initialDate: selectedDate,
// // //       firstDate: DateTime(2000),
// // //       lastDate: DateTime(2101),
// // //     );
// // //     if (picked != null && picked != selectedDate)
// // //       setState(() {
// // //         selectedDate = picked;
// // //       });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Date Picker Example'),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             TextFormField(
// // //               onTap: () => _selectDate(context),
// // //               controller: TextEditingController(
// // //                 text: "${selectedDate.toLocal()}".split(' ')[0],
// // //               ),
// // //               decoration: InputDecoration(
// // //                 labelText: 'Select a date',
// // //                 border: OutlineInputBorder(),
// // //               ),
// // //               readOnly: true,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }



// // // // import 'package:flutter/material.dart';
// // // // class coba extends StatefulWidget {
// // // //   const coba({super.key});

// // // //   @override
// // // //   State<coba> createState() => _cobaState();
// // // // }

// // // // class _cobaState extends State<coba> {
// // // //    String? selectedValue; // Use String? for nullable value
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             SizedBox(height: 20),
// // // //             DropdownButtonFormField<String>(
              
// // // //               value: selectedValue,
// // // //               onChanged: (newValue) {
// // // //                 setState(() {
// // // //                   selectedValue = newValue;
// // // //                 });
// // // //               },
// // // //               items: [
// // // //                 DropdownMenuItem(
// // // //                   value: '1',
// // // //                   child: Text('Bimbingan Pribadi'),
// // // //                 ),
// // // //                 DropdownMenuItem(
// // // //                   value: '2',
// // // //                   child: Text('Bimbingan Sosial'),
// // // //                 ),
// // // //                 DropdownMenuItem(
// // // //                   value: '3',
// // // //                   child: Text('Bimbingan Karir'),
// // // //                 ),
// // // //                 DropdownMenuItem(
// // // //                   value: '4',
// // // //                   child: Text('Bimbingan Belajar'),
// // // //                 ),
// // // //               ],
// // // //                decoration: InputDecoration(
// // // //                         focusedBorder: OutlineInputBorder(
// // // //                           // enabledBorder: UnderlineInputBorder(
// // // //                           borderSide: const BorderSide(
// // // //                               width: 3,
// // // //                               color: Color(0xffA1BCCD)), //<-- SEE HERE
// // // //                           borderRadius: BorderRadius.circular(50.0),
// // // //                         ),
// // // //                         enabledBorder: OutlineInputBorder(
// // // //                           // enabledBorder: UnderlineInputBorder(
// // // //                           borderSide: const BorderSide(
// // // //                               width: 3,
// // // //                               color: Color(0xffA1BCCD)), //<-- SEE HERE
// // // //                           borderRadius: BorderRadius.circular(50.0),
// // // //                         ),
// // // //                         labelText: 'Counseling',
// // // //                       ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // class coba extends StatefulWidget {
// // // //   @override
// // // //   _cobaState createState() => _cobaState();
// // // // }

// // // // class _cobaState extends State<coba> {
// // // //   String? selectedValue; // Use String? for nullable value

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Dropdown Example'),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             Text('Select a type of guidance:'),
// // // //             SizedBox(height: 20),
// // // //             DropdownButtonFormField<String>(
// // // //               value: selectedValue,
// // // //               onChanged: (newValue) {
// // // //                 setState(() {
// // // //                   selectedValue = newValue;
// // // //                 });
// // // //               },
// // // //               items: [
// // // //                 DropdownMenuItem(
// // // //                   value: '1',
// // // //                   child: Text('Bimbingan Pribadi'),
// // // //                 ),
// // // //                 DropdownMenuItem(
// // // //                   value: '2',
// // // //                   child: Text('Bimbingan Sosial'),
// // // //                 ),
// // // //                 DropdownMenuItem(
// // // //                   value: '3',
// // // //                   child: Text('Bimbingan Karir'),
// // // //                 ),
// // // //                 DropdownMenuItem(
// // // //                   value: '4',
// // // //                   child: Text('Bimbingan Belajar'),
// // // //                 ),
// // // //               ],
// // // //               decoration: InputDecoration(
// // // //                 labelText: 'Select guidance type',
// // // //                 border: OutlineInputBorder(),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }






























// // // // import 'package:flutter/material.dart';

// // // // class Selfhelp extends StatefulWidget {
// // // //   const Selfhelp({super.key});

// // // //   @override
// // // //   State<Selfhelp> createState() => _SelfhelpState();
// // // // }

// // // // class _SelfhelpState extends State<Selfhelp> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: SafeArea(child: Container(
     
// // // //         // selfhelpqs3 (821:7)
// // // //         padding: EdgeInsets.fromLTRB(25, 38, 26, 150),
// // // //         width: double.infinity,
// // // //         decoration: BoxDecoration (
// // // //           color: Color(0xfff5f4f2),
// // // //         ),
// // // //         child: 
// // // //       Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.center,
// // // //         children: [
// // // //       Container(
// // // //         // autogrouphbqxKGR (WYkDBZeJwMTtTX622wHBqX)
// // // //         margin: EdgeInsets.fromLTRB(3, 0, 132, 38),
// // // //         width: double.infinity,
// // // //         child: 
// // // //       Row(
// // // //         crossAxisAlignment: CrossAxisAlignment.end,
// // // //         children: [
     
// // // //       Text(
// // // //         // selfhelpXtH (821:11)
// // // //         'Self-Help',
// // // //         // style: SafeGoogleFont (
// // // //         //   'Poppins',
// // // //         //   fontSize: 15,
// // // //         //   fontWeight: FontWeight.w600,
// // // //         //   height: 1.5,
// // // //         //   letterSpacing: 0.3,
// // // //         //   color: Color(0xff454545),
// // // //         // ),
// // // //       ),
// // // //         ],
// // // //       ),
// // // //       ),
// // // //       Container(
// // // //         // autogrouphvhkTG9 (WYkDHydHngqT9Jse7qHvHK)
// // // //         margin: EdgeInsets.fromLTRB(3, 0, 1, 28),
// // // //         width: double.infinity,
// // // //         height: 44,
// // // //         child: 
// // // //       Row(
// // // //         crossAxisAlignment: CrossAxisAlignment.center,
// // // //         children: [
// // // //       Container(
// // // //         // autogroupjej7PQh (WYkDQPcGe2D1q6fGCjJej7)
// // // //         margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
// // // //         padding: EdgeInsets.fromLTRB(21, 14, 21, 13),
// // // //         width: 276,
// // // //         height: double.infinity,
// // // //         decoration: BoxDecoration (
// // // //           color: Color(0xffe5e6e8),
// // // //           borderRadius: BorderRadius.circular(10),
// // // //         ),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   'search topik',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 11,
// // // //       //     fontWeight: FontWeight.w400,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xffa5a5a5),
// // // //       //   ),
// // // //       // ),
// // // //       ),
// // // //       Container(
// // // //         // autogroupmqybFho (WYkDTtWSZJ3gkSMxyamQyB)
// // // //         padding: EdgeInsets.fromLTRB(19, 17, 20, 16),
// // // //         height: double.infinity,
// // // //         decoration: BoxDecoration (
// // // //           color: Color(0xffe5e6e8),
// // // //           borderRadius: BorderRadius.circular(10),
// // // //         ),
// // // //         child: 
// // // //       Center(
// // // //         // iconlylightoutlinesearchnhj (821:14)
// // // //         // child: 
// // // //       // SizedBox(
// // // //       //   width: 12,
// // // //       //   height: 11,
// // // //       //   child: 
// // // //       // Image.network(
// // // //       //   [Image url],
// // // //       //   width: 12,
// // // //       //   height: 11,
// // // //       // ),
// // // //       // ),
// // // //       ),
// // // //       ),
// // // //         ],
// // // //       ),
// // // //       ),
// // // //       Container(
// // // //         // autogroupfm7jhZo (WYkDa8q2qiBtFQFwDPfM7j)
// // // //         margin: EdgeInsets.fromLTRB(0, 0, 1, 23),
// // // //         width: 338,
// // // //         height: 115,
// // // //         child: 
// // // //       Stack(
// // // //         children: [
// // // //       Positioned(
// // // //         // group124Rkh (821:24)
// // // //         left: 0,
// // // //         top: 2,
// // // //         child: 
// // // //       Container(
// // // //         padding: EdgeInsets.fromLTRB(192, 26, 26, 39),
// // // //         width: 338,
// // // //         height: 113,
// // // //         decoration: BoxDecoration (
// // // //           color: Color(0xffbfd1dd),
// // // //           borderRadius: BorderRadius.circular(20),
// // // //         ),
// // // //         child: 
// // // //       Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.end,
// // // //         children: [
// // // //       Container(
// // // //         // managingstressWn9 (821:20)
// // // //         margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   'managing stress',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 14,
// // // //       //     fontWeight: FontWeight.w500,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xff1a1a1a),
// // // //       //   ),
// // // //       // ),
// // // //       ),
// // // //       Container(
// // // //         // sessions31P (821:21)
// // // //         margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   '9 sessions',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 12,
// // // //       //     fontWeight: FontWeight.w400,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xff000000),
// // // //       //   ),
// // // //       // ),
// // // //       ),
// // // //         ],
// // // //       ),
// // // //       ),
// // // //       ),
// // // //       Positioned(
// // // //         // youngdepressedwomansittingmeta (821:56)
// // // //         left: 8,
// // // //         top: 0,
// // // //         child: 
// // // //       Align(
// // // //         child: 
// // // //       SizedBox(
// // // //         width: 90,
// // // //         height: 108,
// // // //       //   child: 
// // // //       // Image.network(
// // // //       //   [Image url]
// // // //       //   fit: BoxFit.cover,
// // // //       // ),
// // // //       ),
// // // //       ),
// // // //       ),
// // // //         ],
// // // //       ),
// // // //       ),
// // // //       // Container(
// // // //       //   // group125Da5 (821:25)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 1, 23),
// // // //       //   width: 338,
// // // //       //   height: 113,
// // // //       //   decoration: BoxDecoration (
// // // //       //     color: Color(0xff3d5a67),
// // // //       //     borderRadius: BorderRadius.circular(20),
// // // //       //   ),
// // // //       //   child: 
// // // //       // Stack(
// // // //       //   children: [
// // // //       // Positioned(
// // // //       //   // getridofinsecurityj2d (821:27)
// // // //       //   left: 192,
// // // //       //   top: 26,
// // // //       //   child: 
// // // //       // Align(
// // // //       //   child: 
// // // //       // SizedBox(
// // // //       //   width: 136,
// // // //       //   height: 21,
// // // //       //   child: 
// // // //       // Text(
// // // //       //   'get rid of insecurity',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 14,
// // // //       //     fontWeight: FontWeight.w500,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xffffffff),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       // ),
// // // //       // ),
// // // //       // Positioned(
// // // //       //   // sessionscs7 (821:28)
// // // //       //   left: 248,
// // // //       //   top: 56,
// // // //       //   child: 
// // // //       // Align(
// // // //       //   child: 
// // // //       // SizedBox(
// // // //       //   width: 62,
// // // //       //   height: 18,
// // // //       //   child: 
// // // //       // Text(
// // // //       //   '9 sessions',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 12,
// // // //       //     fontWeight: FontWeight.w400,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xffffffff),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       // ),
// // // //       // ),
// // // //       // Positioned(
// // // //       //   // group128vcu (821:40)
// // // //       //   left: 0,
// // // //       //   top: 0,
// // // //       //   child: 
// // // //       // Container(
// // // //       //   width: 338,
// // // //       //   height: 113,
// // // //       //   decoration: BoxDecoration (
// // // //       //     borderRadius: BorderRadius.circular(20),
// // // //       //   ),
// // // //       //   child: 
// // // //       // Container(
// // // //       //   // group127sHF (821:36)
// // // //       //   padding: EdgeInsets.fromLTRB(13, 11, 10, 12),
// // // //       //   width: double.infinity,
// // // //       //   height: double.infinity,
// // // //       //   decoration: BoxDecoration (
// // // //       //     color: Color(0xff3d5a67),
// // // //       //     borderRadius: BorderRadius.circular(20),
// // // //       //   ),
// // // //       //   child: 
// // // //       // Row(
// // // //       //   crossAxisAlignment: CrossAxisAlignment.center,
// // // //       //   children: [
// // // //       // Container(
// // // //       //   // girlwithmentaldisordersemiflat (821:54)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 89, 0),
// // // //       //   width: 90,
// // // //       //   height: 90,
// // // //       //   child: 
// // // //       // Image.network(
// // // //       //   [Image url]
// // // //       //   fit: BoxFit.cover,
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //       //   // autogroup5qertCM (WYkE8hj6o8joEps1B95QER)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 15, 0, 27),
// // // //       //   height: double.infinity,
// // // //       //   child: 
// // // //       // Column(
// // // //       //   crossAxisAlignment: CrossAxisAlignment.end,
// // // //       //   children: [
// // // //       // Container(
// // // //       //   // getridofinsecurityE1K (821:38)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   'get rid of insecurity',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 14,
// // // //       //     fontWeight: FontWeight.w500,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xffffffff),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //       //   // sessionsYnh (821:39)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   '9 sessions',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 12,
// // // //       //     fontWeight: FontWeight.w400,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xffffffff),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       //   ],
// // // //       // ),
// // // //       // ),
// // // //       //   ],
// // // //       // ),
// // // //       // ),
// // // //       // ),
// // // //       // ),
// // // //       //   ],
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //       //   // group126HEV (821:31)
// // // //       //   margin: EdgeInsets.fromLTRB(1, 0, 0, 23),
// // // //       //   padding: EdgeInsets.fromLTRB(12, 11, 10, 12),
// // // //       //   width: double.infinity,
// // // //       //   height: 113,
// // // //       //   decoration: BoxDecoration (
// // // //       //     color: Color(0xffbfd1dd),
// // // //       //     borderRadius: BorderRadius.circular(20),
// // // //       //   ),
// // // //       //   child: 
// // // //       // Row(
// // // //       //   crossAxisAlignment: CrossAxisAlignment.center,
// // // //       //   children: [
// // // //       // Container(
// // // //       //   // anxietyconceptillustration1143 (821:53)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 75, 0),
// // // //       //   width: 90,
// // // //       //   height: 90,
// // // //       //   child: 
// // // //       // Image.network(
// // // //       //   [Image url]
// // // //       //   fit: BoxFit.cover,
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //       //   // autogrouphxwk6Sq (WYkDvD5vEJTQEu54hXHXwK)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 16, 0, 27),
// // // //       //   height: double.infinity,
// // // //       //   child: 
// // // //       // Column(
// // // //       //   crossAxisAlignment: CrossAxisAlignment.end,
// // // //       //   children: [
// // // //       // Container(
// // // //       //   // reducepanicattacksRzu (821:33)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   'reduce panic attacks',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 14,
// // // //       //     fontWeight: FontWeight.w500,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xff1a1a1a),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //       //   // sessionskXP (821:34)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 18, 0),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   '9 sessions',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 12,
// // // //       //     fontWeight: FontWeight.w400,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xff000000),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       //   ],
// // // //       // ),
// // // //       // ),
// // // //       //   ],
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //         // group1295Jm (821:41)
// // // //         // margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
// // // //         // width: 338,
// // // //         // height: 113,
// // // //         // decoration: BoxDecoration (
// // // //         //   borderRadius: BorderRadius.circular(20),
// // // //         // ),
// // // //         // child: 
// // // //       // Container(
// // // //       //   // group1272E1 (821:42)
// // // //       //   padding: EdgeInsets.fromLTRB(12, 11, 9, 12),
// // // //       //   width: double.infinity,
// // // //       //   height: double.infinity,
// // // //       //   decoration: BoxDecoration (
// // // //       //     color: Color(0xff3d5a67),
// // // //       //     borderRadius: BorderRadius.circular(20),
// // // //       //   ),
// // // //       //   child: 
// // // //       // Row(
// // // //       //   crossAxisAlignment: CrossAxisAlignment.center,
// // // //       //   children: [
// // // //       // Container(
// // // //       //   // sulkinessconceptillustration11 (821:55)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 112, 0),
// // // //       //   width: 90,
// // // //       //   height: 90,
// // // //       //   child: 
// // // //       // Image.network(
// // // //       //   [Image url]
// // // //       //   fit: BoxFit.cover,
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //       //   // autogroupfhdxG8M (WYkEJnGe8fBQ2nEysyfhDX)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 14, 0, 27),
// // // //       //   height: double.infinity,
// // // //       //   child: 
// // // //       // Column(
// // // //       //   crossAxisAlignment: CrossAxisAlignment.center,
// // // //       //   children: [
// // // //       // Container(
// // // //       //   // makelifehappyoe5 (821:44)
// // // //       //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   'make life happy',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 14,
// // // //       //     fontWeight: FontWeight.w500,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xffffffff),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       // Container(
// // // //       //   // sessions9C9 (821:45)
// // // //       //   margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
// // // //       //   child: 
// // // //       // Text(
// // // //       //   '9 sessions',
// // // //       //   style: SafeGoogleFont (
// // // //       //     'Poppins',
// // // //       //     fontSize: 12,
// // // //       //     fontWeight: FontWeight.w400,
// // // //       //     height: 1.5,
// // // //       //     color: Color(0xffffffff),
// // // //       //   ),
// // // //       // ),
// // // //       // ),
// // // //       //   ],
// // // //       // ),
// // // //       // ),
// // // //       //   ],
// // // //       // ),
// // // //       // ),
// // // //       // ),
// // // //         ],
// // // //       ),

// // // //       ),),
// // // //     );
// // // //   }
// // // // }