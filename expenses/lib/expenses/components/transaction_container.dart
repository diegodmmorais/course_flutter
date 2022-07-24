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
        id: const Uuid().v4(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
      _transactions.sort((a, b) => b.date.compareTo(a.date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrasactionForm(onSave: _addTransaction),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}
