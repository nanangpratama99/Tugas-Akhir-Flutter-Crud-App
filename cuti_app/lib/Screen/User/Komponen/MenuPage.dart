import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuti_app/Screen/User/RoutePage/History_Cuti.dart';
import 'package:cuti_app/constatns/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Pages/Login.dart';
import 'Calender.dart';
import 'Home.dart';
import 'Profile.dart';

class ButtomNavbar extends StatefulWidget {
  const ButtomNavbar({super.key});

  @override
  State<ButtomNavbar> createState() => _ButtomNavbarState();
}

class _ButtomNavbarState extends State<ButtomNavbar> {
  int _selectedIndex = 0;
  bool showProgress = false;
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  // TEXTFIELD CONTROLLER
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _rincianAlasan = TextEditingController();
  final TextEditingController _alasan = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  // LIST PAGE
  static const List<Widget> _widgetOptions = <Widget>[
    HomeMenu(),
    CalenderMenu(),
    ProfilMenu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // DROPDOWN LIST
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Urgent"), value: "Urgent"),
      DropdownMenuItem(child: Text("Bepergian"), value: "Bepergian"),
    ];
    return menuItems;
  }

  String selectedValue = 'Bepergian';

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      // BUTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard_customize_sharp,
              size: 35,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              size: 35,
            ),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school,
              size: 35,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: PurpleColor,
        onTap: _onItemTapped,
      ),

      // FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          return await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              scrollable: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(35.0),
                ),
              ),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.

                  return SizedBox(
                    height: 450,
                    width: 400,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Form Pengajuan Cuti",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(221, 28, 28, 28)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 250,
                                child: TextFormField(
                                  readOnly: true,
                                  controller: _startDateController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Tanggal Cuti',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(
                                          10), // add padding to adjust icon
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: TableCalendar(
                                                      headerStyle: HeaderStyle(
                                                          formatButtonVisible:
                                                              false),
                                                      firstDay: DateTime.utc(
                                                          2010, 10, 16),
                                                      lastDay: DateTime.utc(
                                                          2030, 3, 14),
                                                      focusedDay:
                                                          DateTime.now(),
                                                      onDaySelected:
                                                          (selectedDay,
                                                              focusedDay) {
                                                        _startDateController
                                                                .text =
                                                            selectedDay
                                                                .toString()
                                                                .substring(
                                                                    0, 10);
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        icon: const Icon(Icons.calendar_today),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 252,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 61, 61, 61),
                                          width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(
                                          10), // add padding to adjust icon
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.email_outlined),
                                      ),
                                    ),
                                  ),
                                  icon:
                                      const Icon(Icons.arrow_downward_rounded),
                                  value: selectedValue,
                                  items: dropdownItems,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedValue = value.toString();
                                    });
                                  },
                                  isExpanded: true,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 70,
                                width: 250,
                                child: TextFormField(
                                  controller: _rincianAlasan,
                                  keyboardType: TextInputType.multiline,
                                  minLines:
                                      1, //Normal textInputField will be displayed
                                  maxLines:
                                      5, // when user presses enter it will adapt to it
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.blue, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    labelText: 'Rincian Alasan',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(
                                          10), // add padding to adjust icon
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.email_sharp),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                          const Size(240, 60), //////// HERE
                                    ),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("history_cuti")
                                          .add({
                                        "tanggal_awal":
                                            _startDateController.text,
                                        // "tanggal_akhir":
                                        //     _endDateController.text,
                                        "alasan": selectedValue,
                                        "rincian_alasan": _rincianAlasan.text,
                                        "uid": user!.uid,
                                      });
                                    },
                                    child: const Text(
                                      'Kirim',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
        label: const Text(
          'Ajukan Cuti',
          style: TextStyle(color: Colors.white, fontSize: 17),
          selectionColor: Colors.grey,
        ),
        icon: const Icon(
          Icons.chat_bubble,
          color: Colors.white,
        ),
        backgroundColor: OrangeColor,
      ),
    );
  }

// ===== METHOD LOGOUT ====
  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  // postDetailsToFirestore(String tanggal_awal, String tanggal_akhir,
  //     String alasan, String rincial_alasan) async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   var user = _auth.currentUser;
  //   CollectionReference ref = FirebaseFirestore.instance.collection('users');
  //   ref.doc(user!.uid).set({
  //     'tanggal_awal': tanggal_awal,
  //     'tanggal_akhir': tanggal_akhir,
  //     'alasan': alasan,
  //     'rincial_alasan': rincial_alasan
  //   });
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => HistoryCuti(),
  //     ),
  //   );
  // }
}
