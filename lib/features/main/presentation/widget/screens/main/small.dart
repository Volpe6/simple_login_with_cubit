import 'package:cubit_login_sample/core/widgets/app_bar/custom_app_bar.dart';
import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/item.dart';
import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/list_section_widget.dart';
import 'package:cubit_login_sample/features/main/presentation/bloc/main/main_cubit.dart';
import 'package:cubit_login_sample/features/main/presentation/bloc/search/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Small extends StatefulWidget {
  const Small({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Small> {
  TextEditingController controller = TextEditingController();
  late List<Item> rows = context.read<SearchCubit>().state.items;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (BuildContext context, state) {
        setState(() {
          rows = context.read<SearchCubit>().state.results;
        });
      },
      builder: (BuildContext context, state) {
        return _body(context);
      }
    );
  }

  Widget _body(BuildContext context) {
    return CustomAppbar(
      child: _content(context), 
      floatButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        onPressed: () => context.read<MainCubit>().add(),
      )
    );
  }

   Widget _content(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                context.read<SearchCubit>().search(value);
              },
              decoration: const InputDecoration(
                labelText: 'Buscar', 
                suffixIcon: Icon(Icons.search)
              ),
            )
          )
          ,
          Expanded(child: _listCards(context))
        ],
      ),
    );
  }

  _listCards(BuildContext context) {
    return CustomScrollView(
      slivers: buildItems(context),
    );
  }

  List<Widget> buildItems(BuildContext context) {
    List<Widget> items = [];
    items.add(ListSectionWidget(items: rows, generalTitle: 'Principal'));
    return items;
  }
}
