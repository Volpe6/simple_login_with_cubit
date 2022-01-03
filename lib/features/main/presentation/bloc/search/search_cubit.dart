import 'package:cubit_login_sample/core/models/list_item.dart';
import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState.init());

  void search(query) {
    emit(state.search(query));
  }

  void add(item) {
    emit(state.addItem(item));
  }
}