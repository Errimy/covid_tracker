import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/Login.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovidApp',
      theme: ThemeData(
    primarySwatch: Colors.pink,
    ),
    home: FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          print("Error");
        }
        if(snapshot.connectionState== ConnectionState.done){
          return Login();
        }
        return CircularProgressIndicator();
      },
    ),
    debugShowCheckedModeBanner: false,
    );
  }
}

