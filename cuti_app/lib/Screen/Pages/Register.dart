import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../constatns/colors.dart';
import 'Login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  // TEXTFIELD CONTROLLER
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;

  // ROLE OPTIONS
  var options = [
    'Karyawan',
    'Admin',
  ];
  var _currentItemSelected = "Karyawan";
  var rool = "Karyawan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 151, 144, 139),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 60, 158, 255),
                    // Colors.deepOrange.shade400,
                    Color.fromARGB(255, 148, 202, 255),
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              const Text(
                                "DAFTAR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 40,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 241, 241, 241),
                                      hintText: 'Name',
                                      enabled: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 15.0, bottom: 15.0, top: 15.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 25),
                                    validator: (value) {
                                      if (value!.length == 0 &&
                                          value!.length < 3) {
                                        return "Name harus di isi";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {},
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 241, 241, 241),
                                      hintText: 'Email',
                                      enabled: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 15.0, bottom: 15.0, top: 15.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 25),
                                    validator: (value) {
                                      if (value!.length == 0) {
                                        return "Email cannot be empty";
                                      }
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return ("Please enter a valid email");
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {},
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    obscureText: _isObscure,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      fillColor: const Color.fromARGB(
                                          255, 241, 241, 241),
                                      suffixIcon: IconButton(
                                          icon: Icon(_isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          }),
                                      filled: true,
                                      hintText: 'Password',
                                      enabled: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 15.0, bottom: 15.0, top: 15.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 25),
                                    validator: (value) {
                                      RegExp regex = new RegExp(r'^.{6,}$');
                                      if (value!.isEmpty) {
                                        return "Password cannot be empty";
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("please enter valid password min. 6 character");
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    obscureText: _isObscure2,
                                    controller: confirmpassController,
                                    decoration: InputDecoration(
                                      fillColor: const Color.fromARGB(
                                          255, 241, 241, 241),
                                      suffixIcon: IconButton(
                                          icon: Icon(_isObscure2
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure2 = !_isObscure2;
                                            });
                                          }),
                                      filled: true,
                                      hintText: 'Confirm Password',
                                      enabled: true,
                                      contentPadding: const EdgeInsets.only(
                                          left: 15.0, bottom: 15.0, top: 15.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.white),
                                        borderRadius:
                                            new BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 25),
                                    validator: (value) {
                                      if (confirmpassController.text !=
                                          passwordController.text) {
                                        return "Password did not match";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Role : ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      DropdownButton<String>(
                                        dropdownColor: Colors.blue[900],
                                        isDense: true,
                                        isExpanded: false,
                                        iconEnabledColor: Colors.white,
                                        focusColor: Colors.white,
                                        items: options
                                            .map((String dropDownStringItem) {
                                          return DropdownMenuItem<String>(
                                            value: dropDownStringItem,
                                            child: Text(
                                              dropDownStringItem,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValueSelected) {
                                          setState(() {
                                            _currentItemSelected =
                                                newValueSelected!;
                                            rool = newValueSelected;
                                          });
                                        },
                                        value: _currentItemSelected,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        elevation: 5.0,
                                        height: 60,
                                        minWidth: 350,
                                        onPressed: () {
                                          setState(() {
                                            showProgress = true;
                                          });
                                          signUp(
                                              emailController.text,
                                              passwordController.text,
                                              rool,
                                              nameController.text);
                                        },
                                        color: OrangeColor,
                                        child: const Text(
                                          "Daftar",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      MaterialButton(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        elevation: 5.0,
                                        height: 60,
                                        minWidth: 350,
                                        onPressed: () {
                                          const CircularProgressIndicator();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(),
                                            ),
                                          );
                                        },
                                        color: PurpleColor,
                                        child: const Text(
                                          "Masuk",
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password, String rool, String name) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, rool, name)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String rool, String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'rool': rool,
      'name': name,
      'alamat': '',
      'nik': ''
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
