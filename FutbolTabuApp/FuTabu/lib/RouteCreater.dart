import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:futboltabuapp1/Ayarlar.dart';
import 'package:futboltabuapp1/Berabere.dart';
import 'package:futboltabuapp1/GecisSayfas%C4%B1.dart';
import 'package:futboltabuapp1/Listeler.dart';
import 'package:futboltabuapp1/Nas%C4%B1lOynan%C4%B1r.dart';
import 'package:futboltabuapp1/OyunBitti.dart';
import 'package:futboltabuapp1/OyunSayfas%C4%B1.dart';

import 'ModSecimi.dart';
import 'SoruOner.dart';
import 'main.dart';

class RouteCreater {
  static Route<dynamic>? routecreater(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return routeOlustur(AnaSayfa(), settings);
      case '/SoruOner':
        return routeOlustur(SoruOner(), settings);
      case '/GecisSayfasi':
        var Takim1 = settings.arguments as String;
        var Takim2 = settings.arguments as String;
        var Dogru1 = settings.arguments as int;
        var Dogru2 = settings.arguments as int;
        var yeniTayfa = settings.arguments as List<Listeler>;
        var hangi = settings.arguments as bool;
        var donenListe = settings.arguments as Map<String, dynamic>;
        var kacinciTur = settings.arguments as int;
        var kacinciAnlatim = settings.arguments as int;
        return routeOlustur(
            GecisSayfasi(
                tur: kacinciTur,
                anlatim: kacinciAnlatim,
                DonenListe: donenListe,
                hangiTakim: hangi,
                YeniOyuncuTayfasi: yeniTayfa,
                birinciTakim: Takim1,
                ikinciTakim: Takim2,
                DogruSayisi1: Dogru1,
                DogruSayisi2: Dogru2),
            settings);
      case '/Ayarlar':
        return routeOlustur(Ayarlar(), settings);
      case '/NasilOynanir':
        return routeOlustur(NasilOynanir(), settings);
      case '/Berabere':
        var firstTeam = settings.arguments as String;
        var secondTeam = settings.arguments as String;
        var firstTeamscore = settings.arguments as int;
        var secondTeamscore = settings.arguments as int;
        return routeOlustur(
            Berabere(
                firstTeam: firstTeam,
                secondTeam: secondTeam,
                firstTeamscore: firstTeamscore,
                secondTeamscore: secondTeamscore),
            settings);
      case '/OyunBitti':
        var kazanan = settings.arguments as String;
        var firstTeam = settings.arguments as String;
        var secondTeam = settings.arguments as String;
        var firstTeamscore = settings.arguments as int;
        var secondTeamscore = settings.arguments as int;

        return routeOlustur(
            OyunBitti(
                Kazanan: kazanan,
                firstTeam: firstTeam,
                secondTeam: secondTeam,
                firstTeamscore: firstTeamscore,
                secondTeamscore: secondTeamscore),
            settings);
      case '/ModSeçimi':
        var AktarListe = settings.arguments as Map<String, dynamic>;
        return routeOlustur(ModSecimi(GelenListe: AktarListe), settings);
      case '/OyunSayfasi':
        var GelentakimAdi1 = settings.arguments as String;
        var GelentakimAdi2 = settings.arguments as String;
        var GelenLig = settings.arguments as List<Listeler>;
        var GelenListe = settings.arguments as Map<String, dynamic>;
        var sira = settings.arguments as bool;
        var Toplam1 = settings.arguments as int;
        var Toplam2 = settings.arguments as int;
        var anlatimSifir = settings.arguments as int;
        var turSifir = settings.arguments as int;
        return routeOlustur(
            OyunSayfasi(
              anlatimSifir: anlatimSifir,
              turSifir: turSifir,
              Toplam1: Toplam1,
              Toplam2: Toplam2,
              sira: sira,
              Liste: GelenListe,
              Lig: GelenLig,
              takimAdi1: GelentakimAdi1,
              takimAdi2: GelentakimAdi2,
            ),
            settings);
    }
    return null;
  }

  static PageRoute<dynamic> routeOlustur(
      Widget gidilicekSayfa, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
          builder: (context) => gidilicekSayfa, settings: settings);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
          builder: (context) => gidilicekSayfa, settings: settings);
    } else {
      return CupertinoPageRoute(
          builder: (context) => gidilicekSayfa, settings: settings);
    }
  }
}
