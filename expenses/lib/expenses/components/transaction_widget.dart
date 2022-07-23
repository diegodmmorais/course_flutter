import 'package:flutter/material.dart';
import 'package:expenses_app/expenses/components/card_input_widget.dart';
import 'package:flutter/services.dart';

class TrasactionWidget extends StatelessWidget {
  final tituloController = TextEditingController();
  final valorController = TextEditingController();
  final String labelTextTitle;
  final String labelTextValue;

  TrasactionWidget(
      {Key? key,
      this.labelTextTitle = 'Titulo',
      this.labelTextValue = 'Valor (R\$)'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardInputWidget(children: [
      TextField(
        controller: tituloController,
        maxLength: 27,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: labelTextTitle),
      ),
      TextField(
        controller: valorController,
        maxLength: 10,
        decoration: InputDecoration(labelText: labelTextValue),
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
      ElevatedButton(
          onPressed: () {
            print(tituloController.text);
            print(valorController.text);
          },
          child: const Text("Nova Transação"))
    ]);
  }
}
