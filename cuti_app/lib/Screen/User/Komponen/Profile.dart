import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

final _formkey = GlobalKey<FormState>();

class ProfilMenu extends StatefulWidget {
  const ProfilMenu({super.key});

  @override
  State<ProfilMenu> createState() => _ProfilMenuState();
}

class _ProfilMenuState extends State<ProfilMenu> {
  var users = FirebaseFirestore.instance.collection("users");
  var user = FirebaseAuth.instance.currentUser;

  // FORMKEY
  final _auth = FirebaseAuth.instance;

  // TEXTFIELD CONTROLLER
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nikController = TextEditingController();
  final alamatController = TextEditingController();
  final imgUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection("users");
    var user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // FUTURE BUILDER GET DATA
            FutureBuilder<DocumentSnapshot>(
                future: users.doc(user!.uid).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  //Error Handling conditions
                  if (snapshot.hasError) {
                    return const Text("Ada sesuatu yang salah");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return const Text("Document / data tidak ada");
                  }

                  //Data is output to the user
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;

                    // PARSING DATA
                    String nama = "${data['name']}";
                    String email = "${data['email']}";
                    String imgUrl = "${data['imgUrl']}";
                    String nik = "${data['nik']}";
                    String alamat = "${data['alamat']}";

                    nameController.text = nama;
                    emailController.text = email;
                    imgUrlController.text = imgUrl;
                    nikController.text = nik;
                    alamatController.text = alamat;

                    return Column(
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: <Color>[
                                Colors.deepPurple,
                                // Colors.deepOrange.shade400,
                                Color.fromARGB(255, 148, 202, 255),
                              ], // Gradient from https://learnui.design/tools/gradient-generator.html
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          child: SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: (CircleAvatar(
                                    backgroundImage: NetworkImage(imgUrl),
                                    minRadius: 50,
                                    maxRadius: 75,
                                  )),
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  nama,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: MediaQuery.of(context).size.height / 1.8,
                          width: MediaQuery.of(context).size.width / 1,
                          child: Column(
                            children: [
                              // Note: Same code is applied for the TextFormField as well
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 50, horizontal: 20),
                                child: Form(
                                  key: _formkey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          hintText: "Nama Lengkap",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 2, //<-- SEE HERE
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.all(
                                                10), // add padding to adjust icon
                                            child: Icon(
                                              Icons.person,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 2, //<-- SEE HERE
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.all(
                                                10), // add padding to adjust icon
                                            child: Icon(
                                              Icons.email,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: nikController,
                                        decoration: InputDecoration(
                                          hintText: "Nik",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 2, //<-- SEE HERE
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.all(
                                                10), // add padding to adjust icon
                                            child: Icon(
                                              Icons.document_scanner,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: alamatController,
                                        decoration: InputDecoration(
                                          hintText: "Alamat",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 2, //<-- SEE HERE
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.all(
                                                10), // add padding to adjust icon
                                            child: Icon(
                                              Icons.location_on_rounded,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          onPrimary: Colors.white,
                                          shadowColor: Colors.greenAccent,
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0)),
                                          minimumSize:
                                              Size(500, 60), //////// HERE
                                        ),
                                        onPressed: () {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.rightSlide,
                                            title: 'Update Data Berhasil',
                                            btnCancelOnPress: () {},
                                            btnOkOnPress: () {
                                              if (_formkey.currentState!
                                                  .validate()) {
                                                users.doc(user.uid).update({
                                                  "name": nameController.text,
                                                  "email": emailController.text,
                                                  "nik": nikController.text,
                                                  "alamat":
                                                      alamatController.text,
                                                });
                                                // Navigator.of(context).pop();
                                              }
                                            },
                                          ).show();
                                        },
                                        child: const Text(
                                          'Update',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
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
