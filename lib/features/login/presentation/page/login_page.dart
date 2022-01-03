import 'package:cubit_login_sample/core/config/app_routes.dart';
import 'package:cubit_login_sample/core/cubit/session_cubit/session_cubit.dart';
import 'package:cubit_login_sample/features/login/presentation/bloc/login_cubit.dart';
import 'package:cubit_login_sample/features/login/presentation/widget/screens/loading/loading_screen.dart';
import 'package:cubit_login_sample/features/login/presentation/widget/screens/singin/singin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> {

  Map states = {
    SingInState: const SinginScreen(),
    AuthenticationFailed: const SinginScreen(),
    LoadingState: LoadingScreen(),
    //é necessário por um widget aqui, pois acaba caindo aqui, caso nao tenha um 
    //widget dará erro
    AuthenticationSuccess: LoadingScreen(), 
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child:  BlocConsumer<LoginCubit, LoginState>(
          listener: (BuildContext context, LoginState state) {
            if(state is AuthenticationSuccess) {
              context.read<SessionCubit>().setUser(state.user!);
              Navigator.of(context).pushNamedAndRemoveUntil(Routes.main, (route) => false);
            }
          },
          builder: (BuildContext context, LoginState state) {
            return states[state.runtimeType];
          },
        ),
      ),
    );
  }
}