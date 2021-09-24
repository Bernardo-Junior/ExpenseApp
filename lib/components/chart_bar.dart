import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  CharBar({
    this.label,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 20,
          child: FittedBox(
            child: Text(
              value!.toStringAsFixed(2),
              style: TextStyle(fontSize: 3),
            ),
          ),
        ),
        Container(
          height: 80,
          width: 10,
          margin: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          label!.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
