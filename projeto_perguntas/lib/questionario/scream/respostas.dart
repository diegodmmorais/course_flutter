import 'package:flutter/widgets.dart';

class Respostas extends StatelessWidget {
  final List _childrens;

  @override
  Widget build(BuildContext context) {
    return Column(children: [..._childrens]);
  }

  const Respostas({Key? key, required List children})
      : _childrens = children,
        super(key: key);
}
