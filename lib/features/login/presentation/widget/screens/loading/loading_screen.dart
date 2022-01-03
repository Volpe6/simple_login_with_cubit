import 'package:cubit_login_sample/core/widgets/responsive/responsive_widget.dart';
import 'package:cubit_login_sample/features/login/presentation/widget/screens/loading/small.dart';
import 'package:flutter/cupertino.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(smallScreen: const Small());
  }
}