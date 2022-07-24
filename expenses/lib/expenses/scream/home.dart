import 'package:expenses_app/expenses/components/transaction_container.dart';
import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const TransactionContainer()
              ],
            ),
          ),
        ));
  }
}
