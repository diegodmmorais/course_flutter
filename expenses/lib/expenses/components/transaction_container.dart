import 'package:expenses_app/expenses/components/transaction_form.dart';
import 'package:expenses_app/expenses/components/transaction_list.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';

class TransactionContainer extends StatefulWidget {
  const TransactionContainer({Key? key}) : super(key: key);

  @override
  State<TransactionContainer> createState() => _State();
}

class _State extends State<TransactionContainer> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo tenis de corrida teste tes',
        value: 100000000.45,
        date: DateTime(2002, 1, 15, 18, 35)),
    Transaction(
        id: 't2', title: 'Conta de energia', value: 50.0, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Conta de água', value: 150, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TrasactionForm()
      ],
    );
  }
}
