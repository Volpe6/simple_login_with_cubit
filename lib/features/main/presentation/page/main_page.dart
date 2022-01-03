import 'package:cubit_login_sample/features/main/presentation/bloc/main/main_cubit.dart';
import 'package:cubit_login_sample/features/main/presentation/bloc/search/search_cubit.dart';
import 'package:cubit_login_sample/features/main/presentation/widget/screens/add/add_screen.dart';
import 'package:cubit_login_sample/features/main/presentation/widget/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MainPage> {

  Map states = {
    SearchStep: const MainScreen(),
    AddStep: const AddScreen()
  };


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(create: (BuildContext context) => MainCubit()),
        BlocProvider<SearchCubit>(create: (BuildContext context) => SearchCubit()),
      ], 
      child: BlocBuilder<MainCubit, MainState>(
        builder: (BuildContext context, state) {
          return states[state.runtimeType];
        }
      )
    );
  }

}