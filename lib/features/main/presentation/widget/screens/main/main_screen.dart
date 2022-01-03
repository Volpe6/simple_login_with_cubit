import 'package:cubit_login_sample/core/widgets/responsive/responsive_widget.dart';
import 'package:cubit_login_sample/features/main/presentation/widget/screens/main/small.dart';
import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: Small()
    );
  }
}