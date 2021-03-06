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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text(
                  value!.toStringAsFixed(2),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: constraints.maxWidth * 0.2,
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
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.10,
              child: FittedBox(
                child: Text(
                  label!.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'OpenSans',
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            )
          ],
        );
      },
    );
  }
}
