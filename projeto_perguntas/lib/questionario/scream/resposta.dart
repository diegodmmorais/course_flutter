import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resposta extends StatelessWidget {
  final Function() _onPressed;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.0,
      child: TextButton(
        onPressed: _onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.purple,
            primary: Colors.white,
            elevation: 20,
            shadowColor: Colors.purple),
        child: Text(_text),
      ),
    );
  }

  const Resposta(
      {Key? key, required String text, required Function() onPressed})
      : _text = text,
        _onPressed = onPressed,
        super(key: key);
}
