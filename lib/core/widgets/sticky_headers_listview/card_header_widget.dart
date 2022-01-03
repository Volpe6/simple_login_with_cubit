import 'package:flutter/material.dart';

class CardHeaderWidget extends StatelessWidget {
  final String title;

  const CardHeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 25),
        child: Container(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700
            )
          )
        ),
      );
}