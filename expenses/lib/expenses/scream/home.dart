import 'package:expenses_app/expenses/components/transaction_container.dart';
import 'package:expenses_app/expenses/components/transaction_form.dart';
import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final transactions = <Transaction>[];

  _addTransaction(String title, double value, [String? id]) {
    if (id == null) {
      final newTransaction = Transaction(
          id: const Uuid().v4(),
          title: title,
          value: value,
          date: DateTime.now());

      setState(() {
        transactions.add(newTransaction);
        transactions.sort((a, b) => b.date.compareTo(a.date));
      });
    } else {
      setState(() {
        var transaction =
            transactions.firstWhere((element) => element.id == id);
        transaction.title = title;
        transaction.value = value;
      });
    }
  }

  _onTransactionForm() {
    scaffoldKey.currentState?.showBottomSheet((_) {
      return TrasactionForm(
          onSave: ((title, value, [id]) => _addTransaction(title, value, id)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: _onTransactionForm,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: ElevationEnum.dp12.value,
                child: const Text('grafico'),
              ),
              TransactionContainer(
                  transactions: transactions,
                  addTransaction: _addTransaction,
                  scaffoldKey: scaffoldKey),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _onTransactionForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}
