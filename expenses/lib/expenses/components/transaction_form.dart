import 'dart:ffi';

import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrasactionForm extends StatefulWidget {
  final String labelTextTitle;
  final String labelTextValue;
  final Function(String title, double value) _onSave;

  const TrasactionForm({
    Key? key,
    this.labelTextTitle = 'Titulo',
    this.labelTextValue = 'Valor (R\$)',
    required Function(String title, double value) onSave,
  })  : _onSave = onSave,
        super(key: key);

  @override
  State<TrasactionForm> createState() => _TrasactionFormState();
}

class _TrasactionFormState extends State<TrasactionForm> {
  final tituloController = TextEditingController();

  final valorController = TextEditingController();

  var _validTitle = false;
  var _validValue = false;

  _validateTitle(String value) {
    if (value.isEmpty) {
      setState(() {
        _validTitle = false;
      });
    } else {
      setState(() {
        _validTitle = true;
      });
    }
  }

  _validateValue(String value) {
    if (value.isEmpty) {
      setState(() {
        _validValue = false;
      });
    } else {
      setState(() {
        _validValue = true;
      });
    }
  }

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
              onChanged: (value) => _validateTitle(value),
              controller: tituloController,
              maxLength: 30,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: widget.labelTextTitle,
                  errorText: _validTitle ? null : 'Titulo não informado'),
            ),
            TextField(
              onChanged: (value) => _validateValue(value),
              controller: valorController,
              maxLength: 10,
              decoration: InputDecoration(
                  labelText: widget.labelTextValue,
                  errorText: _validValue ? null : 'Valor não informado'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_validTitle || _validValue) {
                        final title = tituloController.text;
                        final value = double.parse(valorController.text);
                        widget._onSave(title, value);
                      }
                    },
                    child: const Text("Nova Transação"))),
          ],
        ),
      ),
    );
  }
}
