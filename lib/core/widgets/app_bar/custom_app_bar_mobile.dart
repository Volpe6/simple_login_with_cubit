import 'package:cubit_login_sample/core/widgets/app_bar/drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbarMobile extends StatelessWidget {
  final Widget child;
  final Widget? floatButton;

  
  const CustomAppbarMobile({Key? key, required this.child, required this.floatButton}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _AppbarPotrait(child: child, floatButton: floatButton,);
        }
        return _AppBarLandscape(child: child, floatButton: floatButton,);
      },
    );
  }
}

class _AppbarPotrait extends StatelessWidget {
  final Widget child;
  final Widget? floatButton;
  
  const _AppbarPotrait({ required this.child, required this.floatButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: floatButton,
      drawer: const CustomDrawer(),
      body: child,
    );
  }
}

class _AppBarLandscape extends StatelessWidget {
  final Widget child;
  final Widget? floatButton;
  
  const _AppBarLandscape({ required this.child, required this.floatButton });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatButton,
      body: Row(
        children: [
          const CustomDrawer(),
          Expanded(child: child)
        ],
      ),
    );
  }
}