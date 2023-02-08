import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_app/Screen/Admin/Hrd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RejectPage extends StatefulWidget {
  const RejectPage({super.key});

  @override
  State<RejectPage> createState() => _RejectPageState();
}

class _RejectPageState extends State<RejectPage> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text(
          'Cuti Ditolak',
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
                    .collection("history_cuti")
                    .where('status', isEqualTo: 'Reject')
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
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Column(
                                      children: [
                                        Row(
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
                                                Text("Tanggal"),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Alasan"),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text("Rincian Alasan"),
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
                                                Text("Nama Karyawan"),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(" ${e['tanggal_awal']}"),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(" ${e['alasan']}"),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(" ${e['rincian_alasan']}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                        ),
                                        Container(
                                          height: 40,
                                          width: 300,
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Status",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Divider(
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Cuti Telah Ditolak",
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
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

            // CARD HISTORY CUTI
          ],
        ),
      ),
    );
  }
}
