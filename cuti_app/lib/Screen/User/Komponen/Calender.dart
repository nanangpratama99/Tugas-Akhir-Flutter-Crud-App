import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

late Map<DateTime, List<Event>> selectedEvents;
CalendarFormat format = CalendarFormat.month;
DateTime selectedDay = DateTime.now();
DateTime focusedDay = DateTime.now();

class Event {
  final String title;
  Event({required this.title});

  String toString() => this.title;
}

final TextEditingController _eventController = TextEditingController();
var dateData1 = TextEditingController();
final dateData2 = TextEditingController();

// FUTURE
Future<void> getData() async {
  selectedEvents = {};
  final response =
      await http.get(Uri.parse("https://api-harilibur.vercel.app/api"));
  List<dynamic> json = jsonDecode(response.body);
  for (var i = 0; i < json.length; i++) {
    if (json[i]["is_national_holiday"] == true) {
      if (json[i]["holiday_date"].length == 9) {
        var time = json[i]["holiday_date"].substring(0, 8) +
            '0' +
            json[i]["holiday_date"].substring(8, 9);
        selectedDay = DateTime.parse(time + " 07:00:00.000").toUtc();
      } else {
        selectedDay =
            DateTime.parse(json[i]["holiday_date"] + " 07:00:00.000").toUtc();
      }
      _eventController.text = json[i]["holiday_name"];
      Event event = Event(title: _eventController.text);
      selectedEvents[selectedDay] = [event];
      selectedDay = DateTime.now();
    }
  }
}

class CalenderMenu extends StatefulWidget {
  const CalenderMenu({super.key});

  @override
  State<CalenderMenu> createState() => _CalenderMenuState();
}

class _CalenderMenuState extends State<CalenderMenu> {
  @override
  void initState() {
    getData();
    setState(() {});
    super.initState();
    // _eventController = TextEditingController();
  }

// LIST EVENT
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                    child: Icon(
                      Icons.date_range,
                      size: 37,
                    ),
                  ),
                  Text(
                    "Calender",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TableCalendar(
                      headerVisible: true,
                      calendarStyle: const CalendarStyle(
                        selectedTextStyle:
                            TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        headerMargin:
                            const EdgeInsets.only(bottom: 17, top: 10),
                        formatButtonVisible: false,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        leftChevronIcon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                        rightChevronIcon: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.white,
                        ),
                        titleTextStyle:
                            TextStyle(color: Colors.white, fontSize: 25),
                      ),

                      focusedDay: selectedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2050),
                      calendarFormat: format,
                      onFormatChanged: (CalendarFormat _format) {
                        setState(() {
                          format = _format;
                        });
                      },
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      daysOfWeekVisible: true,

                      //Day Changed
                      onDaySelected: (DateTime selectDay, DateTime focusDay) {
                        setState(() {
                          selectedDay = selectDay;
                          dateData1.text =
                              selectDay.toString().substring(0, 10);
                          print(selectedDay);
                          focusedDay = focusDay;
                        });
                      },

                      selectedDayPredicate: (DateTime date) {
                        return isSameDay(selectedDay, date);
                      },

                      eventLoader: _getEventsfromDay,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 370,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Row(
                        children: const [
                          Text(
                            "Event",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    ..._getEventsfromDay(selectedDay).map(
                      (Event event) => ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            event.title,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
