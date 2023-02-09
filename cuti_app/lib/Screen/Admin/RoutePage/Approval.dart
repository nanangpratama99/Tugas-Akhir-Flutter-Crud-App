import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_app/Screen/Admin/Hrd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ApprovalPage extends StatefulWidget {
  const ApprovalPage({super.key});

  @override
  State<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'Approval Page',
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

            // ====== STREAM BUILDER ======
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("history_cuti")
                    .where('status', isEqualTo: 'Pending')
                    .snapshots(),
                builder: (context, snapshot) {
                  var lengs = snapshot.data?.docs.length;
                  print(lengs);
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Terjadi kesalahan ${snapshot.error}'));
                  } else if (lengs == null || lengs == 0) {
                    return Center(
                      child: Text(
                        "Data Kosong",
                        style: const TextStyle(fontSize: 25),
                      ),
                    );
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
                                  height: 210,
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
                                                Text(" ${e['name']}"),
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    CollectionReference cuti =
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "history_cuti");
                                                    cuti.doc(e.id).update(
                                                        {"status": "Approved"});
                                                  },
                                                  icon: const Text(
                                                    "APPROVE",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    CollectionReference cuti =
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "history_cuti");
                                                    cuti.doc(e.id).update(
                                                        {"status": "Reject"});
                                                  },
                                                  icon: const Text(
                                                    "REJECT",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
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
