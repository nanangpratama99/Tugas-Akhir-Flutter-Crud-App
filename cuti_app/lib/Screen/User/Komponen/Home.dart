import 'package:cuti_app/Screen/User/Widget/CardMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../Widget/SliderInfo.dart';
import '../Widget/WidUser.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.deepPurple,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.circle_notifications_rounded,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 234, 234, 234),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WidUser(),
              Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          "INFORMASI",
                          style: TextStyle(
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const SliderInfo(),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          "CARD",
                          style: TextStyle(
                              color: Color.fromARGB(255, 74, 74, 74),
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CardMenu(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
