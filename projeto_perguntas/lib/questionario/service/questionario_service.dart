class QuestionarioService {
  List<Map<String, Object>> buscarQuestionarios() {
    return [
      {
        "pergunta": "Qual o seu animal favorito?",
        "respostas": [
          {"texto": "Cachorros", "pontuacao": 10},
          {"texto": "Gato", "pontuacao": 10},
          {"texto": "Passarinho", "pontuacao": 4},
          {"texto": "Leão", "pontuacao": 1},
        ]
      },
      {
        "pergunta": "Qual a sua cor favorita?",
        "respostas": [
          {"texto": "Azul", "pontuacao": 10},
          {"texto": "Rosa", "pontuacao": 10},
          {"texto": "Verde", "pontuacao": 4},
          {"texto": "Vermelho", "pontuacao": 1},
        ]
      },
      {
        "pergunta": "Qual o o seu pais favorito?",
        "respostas": [
          {"texto": "Brasil", "pontuacao": 10},
          {"texto": "Estados Unidos da America", "pontuacao": 10},
          {"texto": "Austrália", "pontuacao": 4},
          {"texto": "Itália", "pontuacao": 1},
        ]
      }
    ];
  }
}
