import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HistoryCuti extends StatelessWidget {
  const HistoryCuti({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'History Cuti',
          style: TextStyle(fontSize: 30),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
                    .where('uid', isEqualTo: user!.uid)
                    .where('status', isEqualTo: 'Pending')
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Tanggal Cuti : ${e['tanggal_awal']}"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text("Alasan : ${e['alasan']}"),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Rincian Alasan : ${e['rincian_alasan']}"),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: 500,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Text(
                                                "Status",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "${e['status']}",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  AwesomeDialog(
                                                    context: context,
                                                    dialogType:
                                                        DialogType.warning,
                                                    animType:
                                                        AnimType.rightSlide,
                                                    title: 'Hapus!',
                                                    desc:
                                                        'Apa kamu yakin mau menghapus?',
                                                    btnCancelOnPress: () {},
                                                    btnOkOnPress: () {
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              "history_cuti")
                                                          .doc(e.id)
                                                          .delete();
                                                    },
                                                  ).show();
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.amber,
                                                ),
                                              ),
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
