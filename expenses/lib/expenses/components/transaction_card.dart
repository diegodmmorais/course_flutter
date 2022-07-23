import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ElevationEnum.dp12.value,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: 140.0,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.purple, width: 1.5)),
            margin: const EdgeInsets.fromLTRB(10, 10, 2, 10),
            padding: const EdgeInsets.all(10),
            child: Text(
              'R\$ ${transaction.value.toStringAsFixed(2)}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.purple,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 2, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  DateFormat('d MMM y HH:mm').format(transaction.date),
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
