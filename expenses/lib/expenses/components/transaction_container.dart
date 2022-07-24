import 'dart:math';

import 'package:expenses_app/expenses/components/transaction_form.dart';
import 'package:expenses_app/expenses/components/transaction_list.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionContainer extends StatefulWidget {
  const TransactionContainer({Key? key}) : super(key: key);

  @override
  State<TransactionContainer> createState() => _State();
}

class _State extends State<TransactionContainer> {
  final _transactions = <Transaction>[];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: const Uuid().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TrasactionForm(
            onSave: (String title, double value) =>
                _addTransaction(title, value))
      ],
    );
  }
}
