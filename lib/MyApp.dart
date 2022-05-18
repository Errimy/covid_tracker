import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens/Home.dart';
import 'screens/Login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CovidApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return Home();
            }
            else{
              return Login();
            }
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}


