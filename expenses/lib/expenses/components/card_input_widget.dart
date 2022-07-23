import 'package:expenses_app/expenses/constants/elevation_enum.dart';
import 'package:flutter/material.dart';

class CardInputWidget extends StatelessWidget {
  final List<Widget> children;

  const CardInputWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: ElevationEnum.dp10.value,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [...children],
        ),
      ),
    );
  }
}
