import 'package:flutter/material.dart';

class DividerBar extends StatelessWidget {
  const DividerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      child: VerticalDivider(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        radius: BorderRadius.circular(32),
      ),
    );
  }
}
