import 'package:expenses_app/expenses/components/card_input_widget.dart';
import 'package:expenses_app/expenses/components/card_widget.dart';
import 'package:expenses_app/expenses/components/transaction_widget.dart';
import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final _trasactions = [
    Transaction(
        id: 't1',
        title: 'Novo tenis de corrida teste',
        value: 193.45,
        date: DateTime(2002, 1, 15, 18, 35)),
    Transaction(
        id: 't2', title: 'Conta de energia', value: 50.0, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Conta de água', value: 150, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(title: const Text('Despesas Pessoais')),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: ElevationEnum.dp12.value,
                  child: const Text('grafico'),
                ),
                Column(
                  children: _trasactions
                      .map(
                          (transaction) => CardWidget(transaction: transaction))
                      .toList(),
                ),
                TrasactionWidget()
              ],
            ),
          ),
        ));
  }
}
