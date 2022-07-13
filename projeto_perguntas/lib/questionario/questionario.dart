import 'package:flutter/material.dart';
import 'scream/index.dart';
import 'service/index.dart';

class _State extends State<Questionario> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas;

  _State({required List<Map<String, Object>> perguntas})
      : _perguntas = perguntas;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: const Text('Perguntas'));
    Pergunta? perguntaWidget;
    if (temPerguntaSelecionada) {
      final pergunta = _perguntas[_perguntaSelecionada];
      final respostas = pergunta['respostas'] as List<Map<String, Object>>;
      final respostasWidget = respostas
          .map((e) => Resposta(
              text: e['texto'] as String,
              onPressed: () => _responder(e['pontuacao'] as int)))
          .toList();
      perguntaWidget = temPerguntaSelecionada
          ? Pergunta(
              questao: Questao(text: pergunta['pergunta'] as String),
              respostas: Respostas(children: respostasWidget))
          : null;
    }

    var widget = temPerguntaSelecionada
        ? perguntaWidget
        : Resultado(pontuacao: _pontuacaoTotal, callback: _reset);

    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: Scaffold(appBar: appBar, body: widget));
  }

  void _reset() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() => {_perguntaSelecionada++});
      _pontuacaoTotal = _pontuacaoTotal + pontuacao;
    }
  }
}

class Questionario extends StatefulWidget {
  const Questionario({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _State(perguntas: QuestionarioService().buscarQuestionarios());
}
