import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/item.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

class ListItem implements Item {
  @override
  late String content;

  @override
  late Widget img;

  @override
  late String subtitle;

  @override
  late String title;

  ListItem({
    required this.title, 
    required this.content,
    required this.img,
    required this.subtitle
  });
}