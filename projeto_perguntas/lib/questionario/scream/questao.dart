import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // usar para alinha o texto
      margin: const EdgeInsets.all(20), // margem
      child: Text(
        _text,
        style: const TextStyle(fontSize: 28), // aumentar o tamanho da tela
        textAlign: TextAlign.center, // centralizar o texto
      ),
    );
  }

  const Questao({Key? key, required String text})
      : _text = text,
        super(key: key);
}
