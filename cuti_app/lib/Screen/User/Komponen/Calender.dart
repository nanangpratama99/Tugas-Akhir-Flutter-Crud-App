import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CalenderMenu extends StatefulWidget {
  const CalenderMenu({super.key});

  @override
  State<CalenderMenu> createState() => _CalenderMenuState();
}

class _CalenderMenuState extends State<CalenderMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Home")],
    );
  }
}
