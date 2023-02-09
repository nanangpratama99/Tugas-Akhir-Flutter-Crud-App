import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

final _formkey = GlobalKey<FormState>();

class Bio_Data extends StatefulWidget {
  const Bio_Data({super.key});

  @override
  State<Bio_Data> createState() => _Bio_DataState();
}

class _Bio_DataState extends State<Bio_Data> {
  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection("bio_data");
    var user = FirebaseAuth.instance.currentUser;

    // FORMKEY
    final _auth = FirebaseAuth.instance;

    // TEXTFIELD CONTROLLER
    final idKaryawanContoller = TextEditingController();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final nikController = TextEditingController();
    final ttlController = TextEditingController();
    final agamaController = TextEditingController();
    final kewarganegaraanController = TextEditingController();
    final jenisKelamincontroller = TextEditingController();
    final statusPerkawinanController = TextEditingController();

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
                    String idKaryawan = "${data['id_karyawan']}";
                    String name = "${data['name']}";
                    String email = "${data['email']}";
                    String nik = "${data['nik']}";
                    String ttl = "${data['ttl']}";
                    String agama = "${data['agama']}";
                    String jenisKelamin = "${data['jenis_kelamin']}";
                    String kewarganegaraan = "${data['kewarganegaraan']}";
                    String statusPerkawinan = "${data['status_perkawinan']}";

                    idKaryawanContoller.text = user.uid;
                    nameController.text = name;
                    emailController.text = email;
                    nikController.text = nik;
                    ttlController.text = ttl;
                    agamaController.text = agama;
                    jenisKelamincontroller.text = jenisKelamin;
                    kewarganegaraanController.text = kewarganegaraan;
                    statusPerkawinanController.text = statusPerkawinan;

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
                              ],
                              tileMode: TileMode.mirror,
                            ),
                          ),
                          child: SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Bio Data Karyawan",
                                  style: TextStyle(
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
                          height: 900,
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
                                        controller: idKaryawanContoller,
                                        decoration: InputDecoration(
                                          hintText: "ID Karyawan",
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
                                              Icons.key,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
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
                                              Icons.document_scanner_outlined,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: ttlController,
                                        decoration: InputDecoration(
                                          hintText: "Tempat-Tanggal, Lahir",
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
                                      TextFormField(
                                        controller: agamaController,
                                        decoration: InputDecoration(
                                          hintText: "Agama",
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
                                              Icons.mosque,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: jenisKelamincontroller,
                                        decoration: InputDecoration(
                                          hintText: "Jenis Kelamin",
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
                                              Icons.male_rounded,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: kewarganegaraanController,
                                        decoration: InputDecoration(
                                          hintText: "Kewarganegaraan",
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
                                              Icons.flag,
                                              size: 35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: statusPerkawinanController,
                                        decoration: InputDecoration(
                                          hintText: "Status Perkawinan",
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
                                                  "id_karyawan":
                                                      idKaryawanContoller.text,
                                                  "name": nameController.text,
                                                  "email": emailController.text,
                                                  "nik": nikController.text,
                                                  "ttl": ttlController.text,
                                                  "agama": agamaController.text,
                                                  "jenis_kelamin":
                                                      jenisKelamincontroller
                                                          .text,
                                                  "kewarganegaraan":
                                                      kewarganegaraanController
                                                          .text,
                                                  "status_perkawinan":
                                                      statusPerkawinanController
                                                          .text,
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
