import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:expenses_app/expenses/util/currency_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ElevationEnum.dp12.value,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  onChanged: (value) => {},
                  maxLength: 30,
                  keyboardType: TextInputType.text,
                  controller: tituloController,
                  decoration: InputDecoration(labelText: widget.labelTextTitle),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Titulo não informado';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 15,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: valorController,
                  decoration: InputDecoration(labelText: widget.labelTextValue),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CurrencyInputFormatter()
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Valor não informado';
                    }
                    return null;
                  },
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Transação salva')),
                            );
                            final title = tituloController.text;
                            final value = valorController.text
                                .replaceAll('R\$', '')
                                .replaceAll('.', '')
                                .replaceAll(RegExp('\\s+'), '')
                                .replaceAll(',', '.');

                            widget._onSave(title, double.parse(value));
                            tituloController.text = '';
                            valorController.text = '';
                          }
                        },
                        child: const Text("Nova Transação"))),
              ],
            )),
      ),
    );
  }
}
