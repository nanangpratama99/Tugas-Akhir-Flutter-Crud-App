import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_app/Screen/Admin/RoutePage/AkunTerdaftar.dart';
import 'package:cuti_app/constatns/colors.dart';
import 'package:cuti_app/constatns/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../constatns/colors.dart';
import '../Pages/Login.dart';

class HrdPage extends StatefulWidget {
  const HrdPage({super.key});

  @override
  State<HrdPage> createState() => _HrdPageState();
}

class _HrdPageState extends State<HrdPage> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text('HRD Dashboard'),
        actions: [
          // action button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.rightSlide,
                title: 'Logout!',
                desc: 'Apa kamu yakin mau keluar?.............',
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  logout(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ).show();
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 330,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(1, 4),
                    colors: <Color>[
                      Colors.deepPurple,
                      // Colors.deepOrange.shade400,
                      Color.fromARGB(255, 148, 202, 255),
                    ], // Gradient from https://learnui.design/tools/gradient-generator.html
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Column(
                  children: [
                    // STREAM BUILDER
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .where('rool', isEqualTo: 'Karyawan')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    'Terjadi kesalahan ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            int karyawan = snapshot.data!.docs.length;

                            // RETURN WIDGET
                            return Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    // ======== JUMLAH KARYAWAN ========
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 40, left: 20),
                                      height: 100,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$karyawan',
                                            style: const TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 67, 67, 67),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Jumlah Karyawan",
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ======== JUMLAH CUTI ========
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 40, right: 10),
                                      height: 100,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection("history_cuti")
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                      child: Text(
                                                          'Terjadi kesalahan ${snapshot.error}'));
                                                } else if (snapshot.hasData) {
                                                  int jumCuti = snapshot
                                                      .data!.docs.length;
                                                  return Text(
                                                    "$jumCuti",
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  );
                                                }
                                                return CircularProgressIndicator();
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 67, 67, 67),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Jumlah Cuti",
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    // ======== CUTI DI APPROVE ========
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 40, left: 20),
                                      height: 100,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection("history_cuti")
                                                  .where('status',
                                                      isEqualTo: 'Approved')
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                      child: Text(
                                                          'Terjadi kesalahan ${snapshot.error}'));
                                                } else if (snapshot.hasData) {
                                                  int cutiApproved = snapshot
                                                      .data!.docs.length;
                                                  return Text(
                                                    "$cutiApproved",
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  );
                                                }
                                                return CircularProgressIndicator();
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 67, 67, 67),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Cuti di Approve",
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ======== CUTI DI REJECT ========
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 40, right: 10),
                                      height: 100,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection("history_cuti")
                                                  .where('status',
                                                      isEqualTo: 'Reject')
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                      child: Text(
                                                          'Terjadi kesalahan ${snapshot.error}'));
                                                } else if (snapshot.hasData) {
                                                  int cutiRejected = snapshot
                                                      .data!.docs.length;
                                                  return Text(
                                                    "$cutiRejected",
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  );
                                                }
                                                return CircularProgressIndicator();
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 67, 67, 67),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Cuti di Reject",
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                          return const CircularProgressIndicator();
                        }),
                  ],
                ),
              ),

              // LIST MENU
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          // AKUN TERDAFTAR
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Icon(
                                          Icons.person,
                                          size: 50,
                                          color:
                                              Color.fromARGB(255, 40, 38, 38),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "Akun Terdaftar",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AkunTerdaftar(),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.arrow_circle_right_sharp,
                                            size: 40,
                                            color: Color.fromARGB(
                                                255, 109, 109, 109),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                          // APROVAL
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 20),
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Icon(
                                              Icons.checklist,
                                              size: 50,
                                              color: Color.fromARGB(
                                                  255, 40, 38, 38),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Approval",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 65,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                          onPressed: () {},
                                          // ignore: prefer_const_constructors
                                          icon: Icon(
                                            Icons.arrow_circle_right_sharp,
                                            size: 40,
                                            color: Color.fromARGB(
                                                255, 109, 109, 109),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
