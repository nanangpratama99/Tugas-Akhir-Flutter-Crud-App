import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Pages/Login.dart';
import 'Komponen/MenuPage.dart';

class KaryawanPage extends StatefulWidget {
  const KaryawanPage({super.key});

  @override
  State<KaryawanPage> createState() => _KaryawanPageState();
}

class _KaryawanPageState extends State<KaryawanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("KaryawanPage"),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         logout(context);
      //       },
      //       icon: Icon(
      //         Icons.logout,
      //       ),
      //     )
      //   ],
      // ),
      body: Center(),
      bottomNavigationBar: ButtomNavbar(),
    );
  }

  // Future<void> logout(BuildContext context) async {
  //   CircularProgressIndicator();
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => LoginPage(),
  //     ),
  //   );
  // }
}
