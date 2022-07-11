import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String _texto;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      _texto,
      style: const TextStyle(color: Colors.purple, fontSize: 16.0),
    ));
  }

  const Resultado({Key? key, required String texto})
      : _texto = texto,
        super(key: key);
}
