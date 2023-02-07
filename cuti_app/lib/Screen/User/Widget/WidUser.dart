import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constatns/colors.dart';
import '../../Pages/Login.dart';

class WidUser extends StatefulWidget {
  const WidUser({super.key});

  @override
  State<WidUser> createState() => _WidUserState();
}

class _WidUserState extends State<WidUser> {
  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection("users");
    var user = FirebaseAuth.instance.currentUser;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(70),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                FutureBuilder<DocumentSnapshot>(
                    future: users.doc(user!.uid).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      //Error Handling conditions
                      if (snapshot.hasError) {
                        return const Text("Ada sesuatu yang salah");
                      }

                      if (snapshot.hasData && !snapshot.data!.exists) {
                        return const Text("Data kosong");
                      }

                      //Data is output to the user
                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;

                        String nama = "${data['name']}";
                        String imgUrl = "${data['imgUrl']}";

                        return Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 35,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(imgUrl),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, $nama",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: TextColor),
                                ),
                                const Text("Selamat Datang di Home"),
                              ],
                            )
                          ],
                        );
                      }

                      return Center(
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 40,
                            ),
                            CircularProgressIndicator()
                          ],
                        ),
                      );
                    }),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'Logout!',
                      desc: 'Apa kamu yakin mau keluar?.............',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ).show();
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 35,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
  }
}
