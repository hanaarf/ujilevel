import 'package:flutter/material.dart';
import 'package:ujilevel/nav.dart';
import 'package:ujilevel/profile/profile.dart';
import 'package:ujilevel/signin.dart';
import 'package:ujilevel/onboard/onboard.dart';
import 'package:ujilevel/view/consultant/consul.dart';
import 'package:ujilevel/splaschscreen.dart';
import 'package:ujilevel/view/create.dart';
import 'package:ujilevel/view/history.dart';
import 'package:ujilevel/view/homescr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ujilevel/view/selfhelp.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      // const Scaffold(
      //   body: Create(),
      // ),

      FutureBuilder(
          future: SharedPreferences.getInstance(), //memanggil fungsi nya
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(), //tampilan saat masih proses
              ); 
            } else if (snapshot.hasError) { 
              return Text('Some error has Occurred'); //tampilan saat terjadi error
            } else if (snapshot.hasData) {
              final token = snapshot.data!.getString('token');
              if (token != null) {
                return nav(); //jika ada token ke home
              } else {
                return OnBoard(); //jika tidak akan ke login
              }
            } else {
              return OnBoard();
           }
           
           }),
      );
  }
}
