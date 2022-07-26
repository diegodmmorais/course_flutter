import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:expenses_app/expenses/util/currency_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrasactionForm extends StatefulWidget {
  final String labelTextTitle;
  final String labelTextValue;
  final Transaction? transaction;
  final Function(String title, double value, [String? id]) _onSave;

  const TrasactionForm({
    Key? key,
    this.labelTextTitle = 'Titulo',
    this.labelTextValue = 'Valor (R\$)',
    this.transaction,
    required Function(String title, double value, [String? id]) onSave,
    Function()? onCloseshowBottomSheet,
  })  : _onSave = onSave,
        super(key: key);

  @override
  State<TrasactionForm> createState() => _TrasactionFormState(this.transaction);
}

class _TrasactionFormState extends State<TrasactionForm> {
  final tituloController = TextEditingController();
  final valorController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Transaction? _transaction;

  _TrasactionFormState(Transaction? transaction) {
    if (transaction != null) {
      _transaction = transaction;
      tituloController.text = transaction.title;
      valorController.text =
          "R\$ ${transaction.value.toString().replaceAll(".", ',')}";
    }
  }

  _submit({bool? isClose}) {
    if (_formKey.currentState!.validate()) {
      final title = tituloController.text;
      final value = valorController.text
          .replaceAll('R\$', '')
          .replaceAll('.', '')
          .replaceAll(RegExp('\\s+'), '')
          .replaceAll(',', '.');
      if (value == '0.00') {
        valorController.text = '';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 10),
          content: const Text(
            'Valor não pode ser igual R\$ 0,00',
            style: TextStyle(color: Colors.red),
          ),
          action: SnackBarAction(
            textColor: Colors.red,
            label: 'Fechar',
            onPressed: () {},
          ),
        ));
        return;
      }
      if (widget.transaction == null) {
        widget._onSave(title, double.parse(value));
      } else {
        widget._onSave(title, double.parse(value), widget.transaction!.id);
      }
      tituloController.text = '';
      valorController.text = '';
      if (isClose ?? false) {
        Navigator.pop(context);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.white,
          duration: Duration(seconds: 3),
          content: Text(
            'Transação salva.',
            style: TextStyle(color: Colors.purple),
          ),
        ),
      );
    }
  }

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
                  maxLength: 50,
                  keyboardType: TextInputType.text,
                  controller: tituloController,
                  decoration: InputDecoration(labelText: widget.labelTextTitle),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Titulo não informado';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => {valorController},
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
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (_) => _submit(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 2.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: _transaction == null
                                ? null
                                : () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.white,
                                        duration: Duration(seconds: 3),
                                        content: Text(
                                          'Transação excluida',
                                          style:
                                              TextStyle(color: Colors.purple),
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                            child: const Text(
                              "Excluir",
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 2.5, top: 2.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: () => _submit(),
                            child: const Text("Salvar"),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 2.5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: () => _submit(isClose: true),
                            child: const Text(
                              "Salvar e Fechar",
                              style: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            )),
      ),
    );
  }
}
