import 'package:covid_tracker/AuthentificationClass.dart';
import 'package:covid_tracker/screens/Home.dart';
import 'package:covid_tracker/screens/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/Login.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthentificationClass>(create:
          (_)=> AuthentificationClass(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context)=> context.read<AuthentificationClass>().authStateChanges, initialData: null,
          )
          ],
    child: MaterialApp(
      title: 'CovidApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: AuthentificationWrapper(),
      /*FutureBuilder(
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
      ),*/
      debugShowCheckedModeBanner: false,
    )
    );
  }
}
class AuthentificationWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final firebaseUser= context.watch<User>();
    if(firebaseUser != null){
      return Home();
    }
    return Register();

  }
}

