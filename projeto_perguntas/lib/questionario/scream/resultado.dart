import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final Function() callback;

  const Resultado({super.key, required this.pontuacao, required this.callback});

  @override
  Widget build(BuildContext context) {
    String texto;
    Color color = Colors.green;
    texto = 'Parabéns, sua pontuação é: $pontuacao';
    if (pontuacao >= 0 && pontuacao < 10) {
      color = Colors.redAccent.shade100;
      texto = 'Que pena, sua pontuação é: $pontuacao';
    } else if (pontuacao > 10 && pontuacao < 15) {
      color = Colors.orange;
      texto = 'Não desista, sua pontuação é: $pontuacao';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(texto,
                style: TextStyle(
                  color: color,
                  fontSize: 16.0,
                ))),
        const SizedBox(height: 10),
        TextButton(
          onPressed: callback,
          style: TextButton.styleFrom(backgroundColor: Colors.purple),
          child: const Text("Voltar", style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
