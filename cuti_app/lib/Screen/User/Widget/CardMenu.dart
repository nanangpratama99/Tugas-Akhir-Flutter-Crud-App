import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_app/Screen/User/RoutePage/History_Cuti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardMenu extends StatefulWidget {
  const CardMenu({super.key});

  @override
  State<CardMenu> createState() => _CardMenuState();
}

class _CardMenuState extends State<CardMenu> {
  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection("users");
    var user = FirebaseAuth.instance.currentUser;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 9), // changes position of shadow
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(35)),
              height: 170,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder<DocumentSnapshot>(
                      future: users.doc(user!.uid).get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        //Error Handling conditions
                        if (snapshot.hasError) {
                          return const Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          return const Text("Document does not exist");
                        }

                        //Data is output to the user
                        if (snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;

                          String cutiTersedia = "${data['jumlah_cuti']}";
                          String cutiTerpakai = "${data['cuti_terpakai']}";

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: const Icon(
                                          Icons.calendar_month,
                                          size: 45,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Cuti Tersedia"),
                                          Text(
                                            "$cutiTersedia",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 30),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 60,
                                child: VerticalDivider(
                                    thickness: 2,
                                    color: Color.fromARGB(255, 203, 203, 203)),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: const Icon(
                                          Icons.calendar_month,
                                          size: 45,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Cuti Terpakai"),
                                          Text(
                                            "$cutiTerpakai",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            onPressed: () {
                              print("Selengkaptnya");
                            },
                            icon: Text(
                              "Selengkapnya",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 236, 236, 236),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 9), // changes position of shadow
                  ),
                ],
              ),
              height: 80,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.history,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "History Cuti",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text("Kamu telah melakukan\npengajuan cuti\pada tanggal"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15, right: 15),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryCuti(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_circle_right,
                        size: 50,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 9), // changes position of shadow
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
              height: 80,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Data Diri",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text("Klik untuk melihat\ndata diri anda"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.arrow_circle_right,
                        size: 50,
                        color: Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
