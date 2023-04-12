import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:futboltabuapp1/RouteCreater.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteCreater.routecreater,
      builder: EasyLoading.init(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  AnaSayfa({super.key});
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 65),
              child: Text(
                "FUTBOL TABU",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                      image: AssetImage("assets/images/kapak2.png"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnaSayfaContainer(context, "Oyuna Başla",
                      Icon(Icons.sports_soccer_rounded), "/Ayarlar"),
                  AnaSayfaContainer(context, "Nasıl Oynanır", Icon(Icons.info),
                      "/NasilOynanir")
                ],
              ),
            ),
            SizedBox(height: 30),
            AnaSayfaContainer(context, "Soru Önerin",
                Icon(Icons.question_mark_rounded), "/SoruOner")
          ],
        ),
      ),
    );
  }

  Container AnaSayfaContainer(
      BuildContext context, String isim, Icon ikon, String sayfa,
      {var arguman}) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 235, 14),
              Color.fromARGB(255, 133, 46, 11)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: AnaSayfaButon(isim, ikon, sayfa, context),
    );
  }

  ElevatedButton AnaSayfaButon(
      String isim, Icon ikon, String sayfa, BuildContext context,
      {var arguman}) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(context, sayfa, arguments: arguman);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        elevation: 100,
      ),
      icon: ikon,
      label: Text(
        isim,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black87),
      ),
    );
  }
}
