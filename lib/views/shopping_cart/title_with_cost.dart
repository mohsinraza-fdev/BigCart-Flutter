import 'package:flutter/material.dart';

class TitleWithCost extends StatelessWidget {
  final String title;
  final double cost;
  final TextStyle style;

  const TitleWithCost({
    Key? key,
    required this.title,
    required this.cost,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: style,
          ),
          Text(
            '\$' + cost.toStringAsFixed(1),
            style: style,
          ),
        ],
      ),
    );
  }
}
