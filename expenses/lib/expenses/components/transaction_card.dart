import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:expenses_app/expenses/model/transction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  final Function() _onEdit;

  const TransactionCard(
      {Key? key, required this.transaction, required Function() onEdit})
      : _onEdit = onEdit,
        super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final _numberFormat = NumberFormat.simpleCurrency(locale: "pt_Br");

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ElevationEnum.dp12.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: 130.0,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.purple, width: 1.5)),
            margin: const EdgeInsets.fromLTRB(10, 10, 2, 10),
            padding: const EdgeInsets.all(10),
            child: Text(
              _numberFormat.format(widget.transaction.value),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  widget.transaction.title.length > 16
                      ? widget.transaction.title.substring(0, 17)
                      : widget.transaction.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                DateFormat('d MMM y HH:mm').format(widget.transaction.date),
                style: const TextStyle(color: Colors.blueGrey, fontSize: 10),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              color: Colors.deepPurple,
              icon: const Icon(Icons.edit),
              onPressed: () => widget._onEdit(),
            ),
          )
        ],
      ),
    );
  }
}
