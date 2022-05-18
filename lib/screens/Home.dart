import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
          actions: [
            TextButton.icon(
                style: TextButton.styleFrom(primary: Colors.white),
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.exit_to_app),
                label: Text("signOut"))
          ]),
      body: Center(
        child: Text(user.email.toString()),
      ),
    );
  }
}
