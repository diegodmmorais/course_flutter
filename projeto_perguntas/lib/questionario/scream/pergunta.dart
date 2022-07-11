import 'package:flutter/widgets.dart';
import 'package:projeto_perguntas/questionario/scream/respostas.dart';
import 'package:projeto_perguntas/questionario/scream/questao.dart';

class Pergunta extends StatelessWidget {
  final Respostas _respostas;
  final Questao _questao;

  @override
  Widget build(BuildContext context) {
    return Column(children: [_questao, _respostas]);
  }

  const Pergunta(
      {Key? key, required Respostas respostas, required Questao questao})
      : _respostas = respostas,
        _questao = questao,
        super(key: key);
}
