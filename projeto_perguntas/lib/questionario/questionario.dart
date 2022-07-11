import 'package:flutter/material.dart';
import 'scream/index.dart';
import 'service/index.dart';

class _State extends State<Questionario> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas;

  _State({required List<Map<String, Object>> perguntas})
      : _perguntas = perguntas;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('Perguntas'));
    Pergunta? perguntaWidget;
    if (temPerguntaSelecionada) {
      final pergunta = _perguntas[_perguntaSelecionada];
      final respostas = pergunta['respostas'] as List;
      final respostasWidget = respostas
          .map((e) => Resposta(text: e, onPressed: _responder))
          .toList();
      perguntaWidget = temPerguntaSelecionada
          ? Pergunta(
              questao: Questao(text: pergunta['pergunta'] as String),
              respostas: Respostas(children: respostasWidget))
          : null;
    }

    var widget = temPerguntaSelecionada
        ? perguntaWidget
        : const Resultado(texto: "Parabéns");

    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Scaffold(appBar: appBar, body: widget));
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() => {_perguntaSelecionada++});
      print('clique no botão $_perguntaSelecionada');
    }
  }
}

class Questionario extends StatefulWidget {
  Questionario({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _State(perguntas: QuestionarioService().buscarQuestionarios());
}
