import 'package:cubit_login_sample/core/widgets/app_bar/drawer/drawer_mobile.dart';
import 'package:cubit_login_sample/core/widgets/responsive/responsive_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({ Key? key }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(smallScreen: const DrawerMobile());
  }
}