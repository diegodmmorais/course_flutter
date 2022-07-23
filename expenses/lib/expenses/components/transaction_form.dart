import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrasactionForm extends StatelessWidget {
  final tituloController = TextEditingController();
  final valorController = TextEditingController();
  final String labelTextTitle;
  final String labelTextValue;

  TrasactionForm(
      {Key? key,
      this.labelTextTitle = 'Titulo',
      this.labelTextValue = 'Valor (R\$)'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ElevationEnum.dp12.value,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: tituloController,
              maxLength: 30,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: labelTextTitle),
            ),
            TextField(
              controller: valorController,
              maxLength: 12,
              decoration: InputDecoration(labelText: labelTextValue),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      print(tituloController.text);
                      print(valorController.text);
                    },
                    child: const Text("Nova Transação"))),
          ],
        ),
      ),
    );
  }
}
