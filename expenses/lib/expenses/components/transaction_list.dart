import 'package:expenses_app/expenses/components/transaction_card.dart';
import 'package:expenses_app/expenses/components/transaction_form.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final GlobalKey<ScaffoldState> scaffoldKey;

  final Function(String title, double value, [String? id]) _addTransaction;

  const TransactionList(
      {Key? key,
      required this.transactions,
      required this.scaffoldKey,
      required Function(String title, double value, [String? id])
          addTransaction})
      : _addTransaction = addTransaction,
        super(key: key);

  _onTransactionForm(Transaction transaction) {
    scaffoldKey.currentState?.showBottomSheet((_) {
      return TrasactionForm(
          transaction: transaction,
          onSave: ((title, value, [id]) => _addTransaction(title, value, id)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) => TransactionCard(
          transaction: transactions[index],
          onEdit: () => _onTransactionForm(transactions[index]),
        ),
      ),
    );
  }
}
