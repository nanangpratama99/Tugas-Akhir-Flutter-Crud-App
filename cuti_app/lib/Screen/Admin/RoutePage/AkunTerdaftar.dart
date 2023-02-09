import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_app/Screen/Admin/Hrd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AkunTerdaftar extends StatefulWidget {
  const AkunTerdaftar({super.key});

  @override
  State<AkunTerdaftar> createState() => _AkunTerdaftarState();
}

class _AkunTerdaftarState extends State<AkunTerdaftar> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'Akun Terdaftar',
          style: TextStyle(fontSize: 30),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HrdPage()),
            );
          },
          icon: const Icon(
            Icons.arrow_circle_left_sharp,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where('rool', isEqualTo: 'Karyawan')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Terjadi kesalahan ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    int user = snapshot.data!.docs.length;

                    // RETURN DATA
                    return Center(
                      child: Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  width: 350,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: const Offset(
                                            0, 9), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text("Nama"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Email"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Nik"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text("Alamat"),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(":"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(":"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(":"),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(" ${e['name']}"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(" ${e['email']}"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(" ${e['nik']}"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(" ${e['alamat']}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
