import 'package:cuti_app/Screen/Admin/Hrd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AkunTerdaftar extends StatelessWidget {
  const AkunTerdaftar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Akun Terdaftar',
          style: const TextStyle(fontSize: 30),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HrdPage()),
            );
          },
          icon: const Icon(
            Icons.arrow_circle_left_sharp,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Email"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Alamat"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Nik"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(" :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(" :"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(" :"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("text"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("text"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("text"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("text"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
