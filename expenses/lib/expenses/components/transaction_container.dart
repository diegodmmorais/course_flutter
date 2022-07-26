import 'package:expenses_app/expenses/components/transaction_list.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';

class TransactionContainer extends StatefulWidget {
  final List<Transaction> transactions;
  final Function(String title, double value, [String? id]) addTransaction;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TransactionContainer(
      {Key? key,
      required this.transactions,
      required this.addTransaction,
      required this.scaffoldKey})
      : super(key: key);

  @override
  State<TransactionContainer> createState() => _State(transactions);
}

class _State extends State<TransactionContainer> {
  final List<Transaction> transactions;

  _State(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(
            transactions: transactions,
            addTransaction: widget.addTransaction,
            scaffoldKey: widget.scaffoldKey),
      ],
    );
  }
}
