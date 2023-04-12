import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futboltabuapp1/Listeler.dart';
import 'package:futboltabuapp1/OyunSayfas%C4%B1.dart';

class ModSecimi extends StatefulWidget {
  final Map<String, dynamic> GelenListe;
  const ModSecimi({Key? key, required this.GelenListe}) : super(key: key);

  @override
  State<ModSecimi> createState() => _ModSecimiState();
}

class _ModSecimiState extends State<ModSecimi> {
  final _ModKey = GlobalKey<FormState>();
  final _ModKeyy = GlobalKey<FormState>();

  bool sirakimde = true;
 

  Future<List<Listeler>> JsonOku(String ligisim) async {
    String okunanString =
        await DefaultAssetBundle.of(context).loadString(ligisim);
    var jsonObject = jsonDecode(okunanString);
    List<Listeler> liste = (jsonObject as List)
        .map((listeMap) => Listeler.fromMap(listeMap))
        .toList();

    return liste;
  }

  String team1 = "Kırmızı Takım";
  String team2 = "Mavi Takım";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 5)],
                color: Color.fromARGB(255, 68, 128, 128)),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange,
                          border: Border.all(width: 4),
                          boxShadow: [BoxShadow(blurRadius: 2)]),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 36,
                        ),
                      ),
                    ),
                    Text(
                      "TAKIMLARI BELIRLE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 4),
                          boxShadow: [BoxShadow(blurRadius: 2)],
                          shape: BoxShape.circle,
                          color: Colors.deepOrange),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.question_mark,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 4),
                            color: Colors.red),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _ModKey,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            onChanged: ((newValue) {
                              team1 = newValue;
                            }),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                            ],
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: team1,
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                            ),
                          ),
                        )),
                    Text(
                      "VS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black, width: 4),
                            color: Colors.blue),
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        child: Form(
                            key: _ModKeyy,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              cursorColor: Colors.red,
                              textAlign: TextAlign.center,
                              onChanged: ((newValue) {
                                team2 = newValue;
                              }),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(15),
                              ],
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: team2,
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                focusColor: Colors.red,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                              ),
                            ))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "ANLATACAGINIZ LIGI SECİN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    ModContainer(
                        Color.fromARGB(255, 6, 51, 87),
                        Color.fromARGB(255, 192, 29, 29),
                        "PREMIER LEAGUE",
                        'icons/flags/png/gb.png',
                        'assets/data/premier.json',
                        widget.GelenListe),
                    ModContainer(
                        Colors.red,
                        Colors.yellow,
                        "LA LIGA",
                        'icons/flags/png/es.png',
                        'assets/data/listeler.json',
                        widget.GelenListe),
                    ModContainer(
                        Colors.red,
                        Color.fromARGB(255, 176, 143, 143),
                        "SUPER LIG",
                        'icons/flags/png/tr.png',
                        'assets/data/listeler.json',
                        widget.GelenListe),
                    ModContainer(
                        Color.fromARGB(255, 20, 141, 178),
                        Color.fromARGB(255, 16, 100, 20),
                        "SERI A",
                        'icons/flags/png/it.png',
                        'assets/data/listeler.json',
                        widget.GelenListe),
                    ModContainer(
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 16, 24, 79),
                        "LIGUE 1",
                        'icons/flags/png/fr.png',
                        'assets/data/listeler.json',
                        widget.GelenListe),
                    ModContainer(
                        Colors.yellow,
                        Colors.black,
                        "BUNDESLIGA",
                        'icons/flags/png/de.png',
                        'assets/data/listeler.json',
                        widget.GelenListe),
                    ModContainer(
                        Colors.red,
                        Colors.yellow,
                        "LEGENDS",
                        'icons/flags/png/gb.png',
                        'assets/data/listeler.json',
                        widget.GelenListe),
                  ],
                ),
              )
            ]),
          )),
    );
  }

  Container ModContainer(
    Color renk,
    Color renk2,
    String isim,
    String foto,
    String ligisim,
    Map<String, dynamic> GelenListe,
  ) {
    return Container(
      height: 48,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 7)],
        gradient: LinearGradient(
            colors: [renk, renk2],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: FutureBuilder<List<Listeler>>(
        future: JsonOku(ligisim),
        builder: (context, snapshot) {
          return ElevatedButton.icon(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            label: Text(
              isim,
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              AlertDialogIslemi(isim, snapshot.data, GelenListe);
            },
            icon: Image.asset(
              foto,
              package: "country_icons",
              width: 60,
              height: 30,
            ),
          );
        },
      ),
      margin: EdgeInsets.all(13),
    );
  }

  void AlertDialogIslemi(
      String ligisim, List<Listeler>? Liste, Map<String, dynamic> GelenListe) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 221, 206, 211),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              "Oyun başlasın mı?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              ligisim + " modunu seçtiniz",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      label: Text("GERİ DÖN")),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => OyunSayfasi(
                                      anlatimSifir: 0,
                                      turSifir: 0,
                                      Toplam1: 0,
                                      Toplam2: 0,
                                      sira: sirakimde,
                                      Lig: Liste!,
                                      Liste: GelenListe,
                                      takimAdi1: team1,
                                      takimAdi2: team2,
                                    )),
                            (Route<dynamic> route) => route.isFirst);
                      },
                      icon: Icon(Icons.start_rounded),
                      label: Text("BAŞLAT")),
                ],
              ),
            ],
          );
        });
  }
}
