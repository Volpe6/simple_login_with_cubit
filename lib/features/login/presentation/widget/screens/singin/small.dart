import 'package:cubit_login_sample/features/login/presentation/bloc/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Small extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  late bool hasError = false;

  Small({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        hasError = state is AuthenticationFailed;
        return Scaffold(
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*.5,
              child: _body(context),
            ),
          ),
        );
      }
    );
  }

  Widget _body(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormBuilder(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'username',
                    decoration: InputDecoration(
                      hintText: 'Usuário',
                      errorText: hasError ? '':null
                    ),
                    validator: (val) {
                      if(val==null || val.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                      return null;
                    },
                  ),
                  FormBuilderTextField(
                    name: 'pass',
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      errorText: hasError ? '':null
                    ),
                    validator: (val) {
                      if(val==null || val.isEmpty) {
                        return 'Este campo é obrigatório';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.1,),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginCubit>().login();
                    }, 
                    child: const Text('Entrar')
                  )
                ],
              ),
            )
          ),
          _errorMsg(context)
        ],
    );
  }

  Widget _errorMsg(BuildContext context) {
    if(!hasError) {
      return const SizedBox();
    }
    return const Text(
      'Usuário ou senha incorreto.',
      style: TextStyle(
        color: Colors.red
      ),
    );
  }
}