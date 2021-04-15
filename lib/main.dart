import 'package:comanda_virtual_app/screens/comanda/list.dart';
import 'package:flutter/material.dart';

void main() => {runApp(ComandaVirtual())};

class ComandaVirtual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ComandaList(),
    );
  }
}
