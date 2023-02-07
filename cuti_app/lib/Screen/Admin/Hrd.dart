import 'package:awesome_dialog/awesome_dialog.dart';
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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: new Text('App Name'),
        actions: [
          // action button
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
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
          icon: Icon(Icons.person),
          onPressed: () {},
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 330,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40, left: 20),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40, right: 20),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, right: 20),
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                                        child: Icon(
                                          Icons.person,
                                          size: 50,
                                          color:
                                              Color.fromARGB(255, 40, 38, 38),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Akun Terdaftar",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                          onPressed: () {},
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
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Icon(
                                          Icons.person,
                                          size: 50,
                                          color:
                                              Color.fromARGB(255, 40, 38, 38),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Approval",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                          onPressed: () {},
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
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
