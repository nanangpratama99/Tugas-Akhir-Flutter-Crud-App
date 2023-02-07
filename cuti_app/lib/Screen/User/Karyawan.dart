import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Komponen/MenuPage.dart';

class KaryawanPage extends StatefulWidget {
  const KaryawanPage({super.key});

  @override
  State<KaryawanPage> createState() => _KaryawanPageState();
}

class _KaryawanPageState extends State<KaryawanPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
      bottomNavigationBar: ButtomNavbar(),
    );
  }
}
