import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class OyunBitti extends StatelessWidget {
  final String Kazanan;
  final String firstTeam;
  final String secondTeam;
  final int firstTeamscore;
  final int secondTeamscore;

  const OyunBitti(
      {super.key,
      required this.Kazanan,
      required this.firstTeam,
      required this.secondTeam,
      required this.firstTeamscore,
      required this.secondTeamscore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 5)],
          color: Color.fromARGB(255, 194, 208, 192),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Tebrikler " + Kazanan + " Kazandı",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                firstTeam + " : $firstTeamscore",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
              Text(
                secondTeam + " : $secondTeamscore",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        exit(0);
                      },
                      backgroundColor: Colors.red,
                      label: Text("Çıkış"),
                      icon: Icon(Icons.exit_to_app),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
                      },
                      backgroundColor: Colors.blue,
                      label: Text("Ana Sayfa"),
                      icon: Icon(Icons.home),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
