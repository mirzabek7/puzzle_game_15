import 'package:flutter/material.dart';

class TableItem extends StatelessWidget {
  TableItem({
    super.key,
    required this.items,
    required this.i,
  });

  final List<String> items;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: items[i].isEmpty ? Colors.white : Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "${items[i]}",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
