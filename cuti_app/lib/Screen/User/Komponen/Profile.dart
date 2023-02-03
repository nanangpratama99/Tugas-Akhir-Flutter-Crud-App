import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilMenu extends StatefulWidget {
  const ProfilMenu({super.key});

  @override
  State<ProfilMenu> createState() => _ProfilMenuState();
}

class _ProfilMenuState extends State<ProfilMenu> {
  var users = FirebaseFirestore.instance.collection("users");
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
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
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: (CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                        minRadius: 50,
                        maxRadius: 75,
                      )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Adam Musyafa",
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: [
                  // Note: Same code is applied for the TextFormField as well
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Adam Musyafa",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2, //<-- SEE HERE
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(
                                  10), // add padding to adjust icon
                              child: Icon(
                                Icons.person,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "adam@gmail.com",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2, //<-- SEE HERE
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(
                                  10), // add padding to adjust icon
                              child: Icon(
                                Icons.email,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2, //<-- SEE HERE
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(
                                  10), // add padding to adjust icon
                              child: Icon(
                                Icons.lock,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "NIK",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2, //<-- SEE HERE
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(
                                  10), // add padding to adjust icon
                              child: Icon(
                                Icons.document_scanner,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Alamat",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2, //<-- SEE HERE
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(
                                  10), // add padding to adjust icon
                              child: Icon(
                                Icons.location_on_rounded,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize: Size(500, 60), //////// HERE
                          ),
                          onPressed: () {},
                          child: Text(
                            'Update',
                            style: const TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
//----------
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
