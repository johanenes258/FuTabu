import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Ayarlar extends StatefulWidget {
  const Ayarlar({super.key});

  @override
  State<Ayarlar> createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  List<int> dropdown = List.generate(250, (index) => index + 1);

  double pas = 3;
  double sure = 60;
  bool finish1 = true;
  bool finish2 = false;
  String finishDegisken = "Hedeflenen Puan : ";

  int dropdownValue = 50;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? Liste = {
      "Pas": pas,
      "Sure": sure,
      "Kontrol": finish1,
      "Finish": dropdownValue
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 15, 84, 119),
            Color.fromARGB(255, 17, 10, 74)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "OYUN AYARLARI",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.settings,
                  size: 48,
                  color: Colors.brown,
                )),
            Container(
              margin: EdgeInsets.only(top: 25, right: 15, left: 15, bottom: 25),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 168, 16, 188),
                    Color.fromARGB(255, 49, 3, 117)
                  ]),
                  border: Border.all(
                      width: 5, color: Colors.black.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 10)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Pas Hakkı : ${pas.toInt()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 10.0,
                      trackShape: RoundedRectSliderTrackShape(),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12.0,
                        pressedElevation: 8.0,
                      ),
                    ),
                    child: Slider(
                      value: pas,
                      onChanged: (yenipas) {
                        setState(() {
                          pas = yenipas;
                        });
                      },
                      label: pas.toInt().toString(),
                      max: 10,
                      min: 0,
                      divisions: 10,
                      focusNode: FocusNode(),
                      thumbColor: Colors.deepOrange,
                      activeColor: Colors.deepOrange,
                      inactiveColor: Color.fromARGB(255, 23, 97, 158),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 25),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 168, 16, 188),
                    Color.fromARGB(255, 49, 3, 117)
                  ]),
                  border: Border.all(
                      width: 5, color: Colors.black.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 10)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Süre : ${sure.toInt()} sn",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 10.0,
                        trackShape: RoundedRectSliderTrackShape(),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12.0,
                          pressedElevation: 8.0,
                        ),
                      ),
                      child: Slider(
                        value: sure,
                        onChanged: (yenisure) {
                          setState(() {
                            sure = yenisure;
                          });
                        },
                        label: sure.toInt().toString(),
                        max: 180,
                        min: 30,
                        divisions: 150,
                        focusNode: FocusNode(),
                        thumbColor: Colors.deepOrange,
                        activeColor: Colors.deepOrange,
                        inactiveColor: Color.fromARGB(255, 23, 97, 158),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 168, 16, 188),
                    Color.fromARGB(255, 49, 3, 117)
                  ]),
                  border: Border.all(
                      width: 5, color: Colors.black.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 10)]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Oyun Nasıl Bitsin?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SwitchListTile(
                            activeColor: Colors.deepOrange,
                            title: Text(
                              "Puana Gelince",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            value: finish1,
                            onChanged: (value) {
                              setState(() {
                                if (finish2 == true) {
                                  finish2 = false;
                                  finish1 = true;
                                  finishDegisken = "Hedeflenen Puan : ";
                                  dropdownValue = 50;
                                } else {
                                  finish1 = false;
                                  finish2 = true;
                                  finishDegisken = "Tur Sayısı : ";
                                  dropdownValue = 10;
                                }
                              });
                            }),
                      ),
                      Expanded(
                        child: SwitchListTile(
                            activeColor: Colors.deepOrange,
                            title: Text(
                              "Tur Bitince",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            value: finish2,
                            onChanged: (value) {
                              setState(() {
                                if (finish1 == true) {
                                  finish1 = false;
                                  finish2 = true;
                                  finishDegisken = "Tur Sayısı : ";
                                  dropdownValue = 10;
                                } else {
                                  finish2 = false;
                                  finish1 = true;
                                  finishDegisken = "Hedeflenen Puan : ";
                                  dropdownValue = 50;
                                }
                              });
                            }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              finishDegisken,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 15, left: 45, right: 15, bottom: 15),
                            child: DropdownButton<int>(
                              dropdownColor: Colors.black,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              value: dropdownValue,
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: dropdown
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                    child: Text("$value"), value: value);
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 168, 16, 188),
                        Color.fromARGB(255, 49, 3, 117)
                      ]),
                      border: Border.all(
                          width: 5, color: Colors.black.withOpacity(0.6)),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(blurRadius: 10)],
                    ),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: Text(
                        "Ana Sayfa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      icon: Icon(
                        Icons.home,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 168, 16, 188),
                        Color.fromARGB(255, 49, 3, 117)
                      ]),
                      border: Border.all(
                          width: 5, color: Colors.black.withOpacity(0.6)),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(blurRadius: 10)],
                    ),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pushNamed(context, "/ModSeçimi",
                            arguments: Liste);
                      },
                      label: Text(
                        "Devam",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      icon: Icon(
                        Icons.arrow_circle_right_outlined,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
