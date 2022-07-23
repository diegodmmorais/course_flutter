import 'package:expenses_app/expenses/components/transaction_card.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/widgets.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((transaction) => TransactionCard(transaction: transaction))
          .toList(),
    );
  }
}
