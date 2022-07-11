import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado({super.key, required this.pontuacao});

  @override
  Widget build(BuildContext context) {
    String texto;
    Color color = Colors.green;
    texto = 'Parabéns, sua pontuação é: $pontuacao';
    if (pontuacao >= 0 && pontuacao < 10) {
      color = Colors.red;
      texto = 'Que pena, sua pontuação é: $pontuacao';
    } else if (pontuacao > 10 && pontuacao < 15) {
      color = Colors.orange;
      texto = 'Não desista, sua pontuação é: $pontuacao';
    } else if (pontuacao > 15) {
      color = Colors.green;
    }

    return Center(
        child: Text(texto,
            style: TextStyle(
                color: color,
                fontSize: 16.0,
                backgroundColor: Colors.black12)));
  }
}
