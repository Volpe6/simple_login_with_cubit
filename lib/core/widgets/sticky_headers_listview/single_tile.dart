import 'package:flutter/material.dart';

class SingleTileWidget extends StatelessWidget {

  const SingleTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        'assets/img/imf.png',
        fit: BoxFit.cover,
      )
    );
  }
}