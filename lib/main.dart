import 'package:cubit_login_sample/core/config/app_routes.dart';
import 'package:cubit_login_sample/core/cubit/session_cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> globalNavigator = GlobalKey<NavigatorState>();

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionCubit>(create: (BuildContext context) => SessionCubit())
      ], 
      child: MaterialApp(
        navigatorKey: globalNavigator,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>  AppRoutes.routes[settings.name]!(context),
            transitionDuration: const Duration(milliseconds: 500),
            // transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //   return TopBottomAnimation(child: child, animation: animation);
            // }
          );
        },
      )
    );
  }
}