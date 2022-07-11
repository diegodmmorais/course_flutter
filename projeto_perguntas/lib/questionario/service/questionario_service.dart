class QuestionarioService {
  List<Map<String, Object>> buscarQuestionarios() {
    return [
      {
        "pergunta": "Qual o seu animal favorito?",
        "respostas": ["Cachorro", "Gato", "Passarinho", "Leão", "Outros"]
      },
      {
        "pergunta": "Qual a sua cor favorita?",
        "respostas": ["Azul", "Rosa", "Verde", "Vermelho", "Outros"]
      },
      {
        "pergunta": "Qual o o seu pais favorito?",
        "respostas": [
          "Brasil",
          "Estados Unidos da America",
          "Austrália",
          "Itália",
          "Outros"
        ]
      }
    ];
  }
}
