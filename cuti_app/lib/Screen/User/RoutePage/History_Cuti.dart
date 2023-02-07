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
        title: Text(
          'History Cuti',
          style: const TextStyle(fontSize: 30),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left_sharp,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("history_cuti")
                    .where('uid', isEqualTo: user!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Terjadi kesalahan ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    int user = snapshot.data!.docs.length;
                    int cccc = 12 - user;

                    // RETURN DATA
                    return Center(
                      child: Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => Container(
                                  margin: EdgeInsets.only(bottom: 10),
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
                                        offset: Offset(
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
                                            "Tanggal Awal : ${e['tanggal_awal']}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Tanggal Akhir : ${e['tanggal_akhir']}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Alasan : ${e['alasan']}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            "Rincian Alasan : ${e['rincian_alasan']}"),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: 500,
                                          height: 50,
                                          decoration: BoxDecoration(
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
                                              Text(
                                                "Status",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                "Not Approv",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text("$user"),
                                              Text("$cccc"),
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

                  //   Container(
                  //     width: 350,
                  //     height: 200,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(35),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.3),
                  //           spreadRadius: 5,
                  //           blurRadius: 10,
                  //           offset: Offset(0, 9), // changes position of shadow
                  //         ),
                  //       ],
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(20.0),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text("Tanggal Awal : "),
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           Text("Tanggal Akhir : "),
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           Text("Alasan : "),
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           Text("Rincian Alasan : "),
                  //           SizedBox(
                  //             height: 30,
                  //           ),
                  //           Container(
                  //             width: 500,
                  //             height: 50,
                  //             decoration: BoxDecoration(
                  //               color: Colors.deepPurple,
                  //               borderRadius: BorderRadius.only(
                  //                 bottomLeft: Radius.circular(25),
                  //                 bottomRight: Radius.circular(25),
                  //               ),
                  //             ),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               children: [
                  //                 Text(
                  //                   "Status",
                  //                   style: TextStyle(color: Colors.white),
                  //                 ),
                  //                 Text(
                  //                   "Not Approv",
                  //                   style: TextStyle(color: Colors.white),
                  //                 ),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  // }
                  return const CircularProgressIndicator();
                }),

            // CARD HISTORY CUTI
          ],
        ),
      ),
    );
  }
}
