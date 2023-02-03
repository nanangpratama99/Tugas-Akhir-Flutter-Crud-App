import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constatns/colors.dart';

class SliderInfo extends StatefulWidget {
  const SliderInfo({super.key});

  @override
  State<SliderInfo> createState() => _SliderInfoState();
}

class _SliderInfoState extends State<SliderInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Column(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 70,
                        color: Colors.deepOrange.withOpacity(0.6),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      // child: Text(
                      //   "Pada Tanggal\n30-Februari-2023\nAkan diadakan\nFamilyGathering",
                      //   style: TextStyle(fontSize: 20),
                      // ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: White,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 300.0,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 70,
                        color: Colors.deepOrange.withOpacity(0.6),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      // child: Text(
                      //   "Pada Tanggal\n30-Februari-2023\nAkan diadakan\nFamilyGathering",
                      //   style: TextStyle(fontSize: 20),
                      // ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: White,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 300.0,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
