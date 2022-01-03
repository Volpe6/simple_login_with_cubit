import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Small extends StatelessWidget {
  const Small({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}