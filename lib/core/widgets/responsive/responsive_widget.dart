// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponsiveWidget extends StatelessWidget {
  Widget smallScreen;
  Widget? mediumScreen;
  Widget? largeScreen;

  ResponsiveWidget({
    Key? key,
    required this.smallScreen,
    this.mediumScreen,
    this.largeScreen
  }): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth> 1200) {
        return largeScreen??smallScreen;
      }
      if(constraints.maxWidth>800) {
        return mediumScreen??smallScreen;
      }
      return smallScreen;
    });
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 && MediaQuery.of(context).size.width < 1200;
  }

}