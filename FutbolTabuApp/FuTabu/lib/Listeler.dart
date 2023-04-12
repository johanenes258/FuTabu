import 'dart:convert';

Listeler listelerFromMap(String str) => Listeler.fromMap(json.decode(str));

String listelerToMap(Listeler data) => json.encode(data.toMap());

class Listeler {
    Listeler({
        required this.isim,
        required this.ozellik1,
        required this.ozellik2,
        required this.ozellik3,
        required this.ozellik4,
        required this.ozellik5,
    });

    final String isim;
    final String ozellik1;
    final String ozellik2;
    final String ozellik3;
    final String ozellik4;
    final String ozellik5;

    factory Listeler.fromMap(Map<String, dynamic> json) => Listeler(
        isim: json["isim"],
        ozellik1: json["ozellik1"],
        ozellik2: json["ozellik2"],
        ozellik3: json["ozellik3"],
        ozellik4: json["ozellik4"],
        ozellik5: json["ozellik5"],
    );

    Map<String, dynamic> toMap() => {
        "isim": isim,
        "ozellik1": ozellik1,
        "ozellik2": ozellik2,
        "ozellik3": ozellik3,
        "ozellik4": ozellik4,
        "ozellik5": ozellik5,
    };
}