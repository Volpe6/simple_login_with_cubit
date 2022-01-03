import 'package:cubit_login_sample/core/models/list_item.dart';
import 'package:cubit_login_sample/core/widgets/app_bar/custom_app_bar.dart';
import 'package:cubit_login_sample/features/login/presentation/bloc/login_cubit.dart';
import 'package:cubit_login_sample/features/main/presentation/bloc/add/add_cubit.dart';
import 'package:cubit_login_sample/features/main/presentation/bloc/main/main_cubit.dart';
import 'package:cubit_login_sample/features/main/presentation/bloc/search/search_cubit.dart';
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
    return BlocProvider(
      create: (BuildContext context) => AddCubit(),
      child: BlocBuilder<AddCubit, AddState>(
        builder: (BuildContext context, state) {
          hasError = state is AuthenticationFailed;
          return CustomAppbar(
            floatButton: null,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child: _body(context),
                  ),
                ),
              ),
            )
          );
        }
      ),
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
                    name: 'title',
                    onChanged: (val) => context.read<AddCubit>().onChangeTitle(val),
                    decoration: InputDecoration(
                      hintText: 'Título',
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
                    name: 'subtitle',
                    onChanged: (val) => context.read<AddCubit>().onChangeSubtitle(val),
                    decoration: InputDecoration(
                      hintText: 'Subtítulo',
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
                    name: 'content',
                    onChanged: (val) => context.read<AddCubit>().onChangeContent(val),
                    decoration: InputDecoration(
                      hintText: 'conteúdo',
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
                      if(!_formKey.currentState!.validate()) {
                        return;
                      }
                      AddState state = context.read<AddCubit>().state;
                      context.read<SearchCubit>().add(ListItem(
                        title: state.title,
                        subtitle: state.subtitle,
                        content: state.content,
                        img: const SizedBox()
                      ));
                      context.read<MainCubit>().search();
                    }, 
                    child: const Text('Adicionar')
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