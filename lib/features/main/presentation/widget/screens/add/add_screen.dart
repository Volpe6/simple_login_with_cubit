import 'package:cubit_login_sample/core/widgets/responsive/responsive_widget.dart';
import 'package:cubit_login_sample/features/main/presentation/widget/screens/add/small.dart';
import 'package:flutter/cupertino.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: Small()
    );
  }
}