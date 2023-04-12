import 'dart:async';
import 'package:futboltabuapp1/Listeler.dart';
import 'package:restart_app/restart_app.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:futboltabuapp1/Berabere.dart';
import 'package:futboltabuapp1/GecisSayfas%C4%B1.dart';
import 'package:futboltabuapp1/OyunBitti.dart';

class OyunSayfasi extends StatefulWidget {
  final Map<String, dynamic> Liste;
  final List<Listeler> Lig;
  final String takimAdi1;
  final String takimAdi2;
  final bool sira;
  final int Toplam1;
  final int Toplam2;
  final int turSifir;
  final int anlatimSifir;
  const OyunSayfasi(
      {Key? key,
      required this.turSifir,
      required this.anlatimSifir,
      required this.Liste,
      required this.Lig,
      required this.takimAdi1,
      required this.sira,
      required this.Toplam1,
      required this.Toplam2,
      required this.takimAdi2})
      : super(key: key);

  @override
  State<OyunSayfasi> createState() => _OyunSayfasiState();
}

class _OyunSayfasiState extends State<OyunSayfasi> {
  Future<bool> _onWillPop() async {
    PauseTimer();
    return (await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 221, 206, 211),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              "Oyundan çıkmak mı istiyorsunuz?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil("/", (route) => false);
                      },
                      icon: Icon(Icons.home),
                      label: Text("ANA SAYFA", style: TextStyle(fontSize: 12))),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ResumeTimer();
                    },
                    icon: Icon(Icons.double_arrow),
                    label: Text(
                      "OYUNA DÖN",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          );
        }));
  }

  late int ToplamDogru1;
  late int ToplamDogru2;
  late double pas;
  late double sure;
  int i = 0;
  int x = 0;
  int? degisken;
  int dogruSayac = 0;
  Timer? timer;
  late int turSayisi;
  late int hedefpuan;
  late int tur;
  late int anlatim;
  late List<Listeler> YeniListe;

  void removeLastList() {
    YeniListe.removeLast();
  }

  void ListeAta() {
    YeniListe = widget.Lig;
  }

  void BitisFonksiyonu() {
    if (widget.Liste["Kontrol"] == true) {
      if (ToplamDogru1 >= hedefpuan && ToplamDogru2 < hedefpuan) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => OyunBitti(
                      firstTeamscore: ToplamDogru1,
                      secondTeamscore: ToplamDogru2,
                      Kazanan: widget.takimAdi1,
                      firstTeam: widget.takimAdi1,
                      secondTeam: widget.takimAdi2,
                    )),
            (route) => route.isFirst);
      } else if (ToplamDogru2 >= hedefpuan && ToplamDogru1 < hedefpuan) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => OyunBitti(
                    firstTeamscore: ToplamDogru1,
                    secondTeamscore: ToplamDogru2,
                    Kazanan: widget.takimAdi2,
                    firstTeam: widget.takimAdi1,
                    secondTeam: widget.takimAdi2)),
            (route) => route.isFirst);
      } else {
        if (anlatim % 2 == 0) {
          anlatim++;
          tur++;
        } else {
          anlatim++;
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => GecisSayfasi(
                    tur: tur,
                    anlatim: anlatim,
                    DonenListe: widget.Liste,
                    hangiTakim: widget.sira,
                    YeniOyuncuTayfasi: YeniListe,
                    birinciTakim: widget.takimAdi1,
                    ikinciTakim: widget.takimAdi2,
                    DogruSayisi1: ToplamDogru1,
                    DogruSayisi2: ToplamDogru2)),
            (route) => route.isFirst);
      }
    } else if (widget.Liste["Kontrol"] == false) {
      if (tur < turSayisi) {
        if (anlatim % 2 == 0) {
          anlatim++;
          tur++;
        } else {
          anlatim++;
        }
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => GecisSayfasi(
                    tur: tur,
                    anlatim: anlatim,
                    DonenListe: widget.Liste,
                    hangiTakim: widget.sira,
                    YeniOyuncuTayfasi: YeniListe,
                    birinciTakim: widget.takimAdi1,
                    ikinciTakim: widget.takimAdi2,
                    DogruSayisi1: ToplamDogru1,
                    DogruSayisi2: ToplamDogru2)),
            (route) => route.isFirst);
      } else if (tur == turSayisi && anlatim == 1) {
        if (ToplamDogru1 > ToplamDogru2) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => OyunBitti(
                      firstTeamscore: ToplamDogru1,
                      secondTeamscore: ToplamDogru2,
                      firstTeam: widget.takimAdi1,
                      secondTeam: widget.takimAdi2,
                      Kazanan: widget.takimAdi1)),
              (route) => route.isFirst);
        } else if (ToplamDogru2 > ToplamDogru1) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => OyunBitti(
                      firstTeamscore: ToplamDogru1,
                      secondTeamscore: ToplamDogru2,
                      firstTeam: widget.takimAdi1,
                      secondTeam: widget.takimAdi2,
                      Kazanan: widget.takimAdi2)),
              (route) => route.isFirst);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => Berabere(
                      firstTeam: widget.takimAdi1,
                      secondTeam: widget.takimAdi2,
                      firstTeamscore: ToplamDogru1,
                      secondTeamscore: ToplamDogru2)),
              (route) => route.isFirst);
        }
      }
    }
  }

  void DegiskenAta() {
    YeniListe.shuffle();
    degisken = YeniListe.length - 1;
    if (widget.Liste["Kontrol"] == true) {
      hedefpuan = widget.Liste["Finish"];
    } else {
      turSayisi = widget.Liste["Finish"];
    }
    anlatim = widget.anlatimSifir;
    tur = widget.turSifir;
    pas = widget.Liste["Pas"];
    sure = widget.Liste["Sure"];
    ToplamDogru1 = widget.Toplam1;
    ToplamDogru2 = widget.Toplam2;
  }

  void Randomisim() {
    setState(() {
      YeniListe.removeLast();
      YeniListe.shuffle();
      degisken = YeniListe.length - 1;
    });
  }

  @override
  void initState() {
    ListeAta();
    removeLastList();
    DegiskenAta();
    super.initState();
    StartTimer();
  }

  void DogruSayacArttir() {
    dogruSayac++;
    if (widget.sira == true) {
      ToplamDogru1++;
    } else {
      ToplamDogru2++;
    }
    setState(() {});
  }

  void DogruSayacAzalt() {
    dogruSayac--;
    if (widget.sira == true) {
      ToplamDogru1--;
    } else {
      ToplamDogru2--;
    }
    setState(() {});
  }

  void StartTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (sure > 0) {
          sure--;
        } else if (sure == 0) {
          BitisFonksiyonu();
        }
      });
    });
  }

  void PauseTimer() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  void ResumeTimer() {
    if (timer != null) {
      StartTimer();
    }
  }

  void PasAzalt() {
    if (pas > 0) {
      pas--;
      Randomisim();
    } else {
      EasyLoading.showToast(
        "Pas hakkınız kalmadı.",
        toastPosition: EasyLoadingToastPosition.bottom,
      );
    }
    i++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 5)],
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 15, 84, 119),
                Color.fromARGB(255, 17, 10, 74)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: IconButton(
                              onPressed: () {
                                PauseTimer();
                                PauseDialog();
                              },
                              icon: Icon(
                                Icons.pause,
                                size: 36,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 145),
                            child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 40,
                                child: Text(
                                  "Sure: ${sure.toInt()}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(blurRadius: 5)],
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(255, 241, 234, 241),
                                    Color.fromARGB(255, 157, 153, 163)
                                  ]),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 100,
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  " Pas : ${pas.toInt()} ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(blurRadius: 5)],
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(255, 241, 234, 241),
                                    Color.fromARGB(255, 157, 153, 163)
                                  ]),
                                )),
                            Container(
                                width: 100,
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  "Doğru: $dogruSayac",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(blurRadius: 5)],
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(255, 241, 234, 241),
                                    Color.fromARGB(255, 157, 153, 163)
                                  ]),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 50, top: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 5)],
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 241, 234, 241),
                        Color.fromARGB(255, 157, 153, 163)
                      ]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: Text(
                            YeniListe.elementAt(degisken!).isim,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 168, 16, 188),
                              Color.fromARGB(255, 49, 3, 117)
                            ]),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 28),
                                child: Text(
                                  YeniListe.elementAt(degisken!).ozellik1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Text(
                                  YeniListe.elementAt(degisken!).ozellik2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Text(
                                    YeniListe.elementAt(degisken!).ozellik3,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: Text(
                                    YeniListe.elementAt(degisken!).ozellik4,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 35, bottom: 35),
                                child: Text(
                                    YeniListe.elementAt(degisken!).ozellik5,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                            onPressed: () {
                              DogruSayacAzalt();
                              Randomisim();
                            },
                            icon: Icon(Icons.close),
                            iconSize: 60),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {
                            PasAzalt();
                          },
                          icon: Icon(Icons.loop),
                          iconSize: 60,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100)),
                        child: IconButton(
                          onPressed: () {
                            Randomisim();
                            DogruSayacArttir();
                          },
                          icon: Icon(Icons.check),
                          iconSize: 60,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  void PauseDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.pause_circle,
            size: 36,
          ),
          backgroundColor: Color.fromARGB(255, 221, 206, 211),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            "DURDURULDU",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            ButtonBar(alignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton.icon(
                  onPressed: () {
                    ResumeTimer();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.double_arrow),
                  label: Text("DEVAM ET")),
            ])
          ],
        );
      },
    );
  }
}
