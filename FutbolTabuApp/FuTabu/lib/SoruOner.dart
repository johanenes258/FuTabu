import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SoruOner extends StatefulWidget {
  const SoruOner({super.key});

  @override
  State<SoruOner> createState() => _SoruOnerState();
}

class _SoruOnerState extends State<SoruOner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soru Oner")),
    );
  }
}