import 'package:cuti_app/Screen/User/Komponen/ExCalender.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  // DATE CONTROLLER
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dateController2 = TextEditingController();

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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Urgent"), value: "Urgent"),
      DropdownMenuItem(child: Text("Bepergian"), value: "Bepergian"),
    ];
    return menuItems;
  }

  String selectedValue = "Urgent";

  @override
  Widget build(BuildContext context) {
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
                    height: 500,
                    width: 400,
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
                                controller: _dateController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Tanggal Awal',
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(
                                        10), // add padding to adjust icon
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TableCalendar(
                                                    firstDay: DateTime.utc(
                                                        2010, 10, 16),
                                                    lastDay: DateTime.utc(
                                                        2030, 3, 14),
                                                    focusedDay: DateTime.now(),
                                                    onDaySelected: (selectedDay,
                                                        focusedDay) {
                                                      _dateController.text =
                                                          selectedDay
                                                              .toString()
                                                              .substring(0, 10);
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.calendar_month),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 70,
                              width: 250,
                              child: TextFormField(
                                controller: _dateController2,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Tanggal Awal',
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(
                                        10), // add padding to adjust icon
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      2,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: TableCalendar(
                                                    firstDay: DateTime.utc(
                                                        2010, 10, 16),
                                                    lastDay: DateTime.utc(
                                                        2030, 3, 14),
                                                    focusedDay: DateTime.now(),
                                                    onDaySelected: (selectedDay,
                                                        focusedDay) {
                                                      _dateController2.text =
                                                          selectedDay
                                                              .toString()
                                                              .substring(0, 10);
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.calendar_month),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 61, 61, 61),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                icon: Icon(Icons.arrow_downward_rounded),
                                value: selectedValue,
                                items: dropdownItems,
                                onChanged: (String? value) {},
                                isExpanded: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 70,
                              width: 250,
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                minLines:
                                    1, //Normal textInputField will be displayed
                                maxLines:
                                    5, // when user presses enter it will adapt to it
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  labelText: 'Rincial Alasan',
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(
                                        10), // add padding to adjust icon
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.email_sharp),
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
                                    minimumSize: Size(240, 60), //////// HERE
                                  ),
                                  onPressed: () {},
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
}
