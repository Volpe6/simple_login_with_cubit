import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/item.dart';
import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'card_background_widget.dart';
import 'card_header_widget.dart';

class ListSectionWidget extends StatelessWidget {

  final bool detachBackground; //destaca do fundo
  final bool fixTitle;// deixa o titilo fixo no topo ate o outro o substitua
  final List<Item> items;
  final String generalTitle;

  const ListSectionWidget({
    Key? key,
    required this.items,
    required this.generalTitle,
    this.detachBackground = false,
    this.fixTitle = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: MultiSliver(
          pushPinnedChildren: true,
          children: [
            SliverStack(
              insetOnOverlap: true,
              children: [
                if(detachBackground)
                  const SliverPositioned.fill(
                    top: 16,
                    child: CardBackgroundWidget(),
                  ),
                buildCard(context),
              ],
            ),
          ],
        ),
      );

  Widget buildCard(BuildContext context) => MultiSliver(
        children: <Widget>[
          getTitle(),
          SliverClip(
            child: MultiSliver(
              children: <Widget>[
                buildItems(),
              ],
            ),
          ),
        ],
      );

  Widget getTitle() {
    if(fixTitle) {
      return SliverPinnedHeader(child: CardHeaderWidget(title: generalTitle));
    }
    return CardHeaderWidget(title: generalTitle);
  }

  Widget buildItems() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListItemWidget(item: items[index],),
        childCount: items.length,
      ),
    );
  }
}