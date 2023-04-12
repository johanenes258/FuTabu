import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futboltabuapp1/Listeler.dart';

import 'OyunSayfası.dart';

class GecisSayfasi extends StatelessWidget {
  final int anlatim;
  final int tur;
  final Map<String, dynamic> DonenListe;
  final bool hangiTakim;
  final List<Listeler> YeniOyuncuTayfasi;
  final String birinciTakim;
  final String ikinciTakim;
  final int DogruSayisi1;
  final int DogruSayisi2;
  const GecisSayfasi(
      {super.key,
      required this.anlatim,
      required this.tur,
      required this.DonenListe,
      required this.hangiTakim,
      required this.birinciTakim,
      required this.ikinciTakim,
      required this.DogruSayisi1,
      required this.DogruSayisi2,
      required this.YeniOyuncuTayfasi});

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 221, 206, 211),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                        label:
                            Text("ANA SAYFA", style: TextStyle(fontSize: 12))),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
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

    bool siradegisimi = false;
    int yenianlatim = 0;
    if (anlatim % 2 == 0) {
      yenianlatim = 0;
    } else {
      yenianlatim = 1;
    }
    if (hangiTakim == true) {
      siradegisimi = false;
    } else {
      siradegisimi = true;
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 5)],
            color: Color.fromARGB(255, 194, 208, 192),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$tur. tur $anlatim. anlatım sonucu",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  birinciTakim + " : $DogruSayisi1",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
                Text(
                  ikinciTakim + " : $DogruSayisi2",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 150),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => OyunSayfasi(
                                      turSifir: tur,
                                      anlatimSifir: yenianlatim,
                                      Toplam1: DogruSayisi1,
                                      Toplam2: DogruSayisi2,
                                      sira: siradegisimi,
                                      Lig: YeniOyuncuTayfasi,
                                      Liste: DonenListe,
                                      takimAdi1: birinciTakim,
                                      takimAdi2: ikinciTakim,
                                    )),
                            (Route<dynamic> route) => route.isFirst);
                      },
                      label: Text("Sıradaki Anlatım"),
                      icon: Icon(Icons.double_arrow),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
