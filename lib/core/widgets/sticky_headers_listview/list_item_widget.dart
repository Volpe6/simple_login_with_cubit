import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/item.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {

  Item item;

  ListItemWidget({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
              ),
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/img/imf.png',
                    fit: BoxFit.cover,
                  )
              ),
            ),
            SizedBox(width: 16,),
            Column(
              children: [
                Text("${item.title}"),
                Text("${item.content}"),
              ],
            )
          ],
        ),
        SizedBox(height: 11,)
      ],
    );
  }
  
}