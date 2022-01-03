import 'package:cubit_login_sample/core/widgets/app_bar/custom_app_bar_mobile.dart';
import 'package:cubit_login_sample/core/widgets/responsive/responsive_widget.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Widget child;
  final Widget? floatButton;
  
  const CustomAppbar({Key? key, required this.child, required this.floatButton}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(smallScreen: CustomAppbarMobile(child: child, floatButton: floatButton,));
  }
}