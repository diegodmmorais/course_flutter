import 'package:expenses/expenses/model/transction.dart';
import 'package:expenses/expenses/scream/card_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final _trasactions = [
    Transaction(
        id: 't1',
        title: 'Novo tenis de corrida teste',
        value: 2000000.03,
        date: DateTime(2002, 1, 15, 18, 35)),
    Transaction(
        id: 't2', title: 'Conta de energia', value: 50.0, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(title: const Text('Despesas Pessoais')),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch, // cumpritoda a tela
            children: [
              Card(
                elevation: 10.0,
                child: Container(
                  // width: double.infinity,
                  child: Text('grafico'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _trasactions
                    .map((transaction) => CardWidget(transaction: transaction))
                    .toList(),
              ),
            ],
          ),
        ));
  }
}
