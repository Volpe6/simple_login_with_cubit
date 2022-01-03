import 'package:cubit_login_sample/core/widgets/sticky_headers_listview/single_tile.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';


class SingleSectionWidget extends StatelessWidget {

  final bool detachBackground; //destaca do fundo
  final bool fixTitle;// deixa o titilo fixo no topo ate o outro o substitua

  const SingleSectionWidget({
    Key? key,
    this.detachBackground = false,
    this.fixTitle = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(0),
        sliver: MultiSliver(
          children: [
            SliverStack(
              children: [
                buildCard(context),
              ],
            ),
          ],
        ),
      );

  Widget buildCard(BuildContext context) => MultiSliver(
        children: <Widget>[
          SliverClip(
            child: MultiSliver(
              children: <Widget>[
                buildItem(),
              ],
            ),
          ),
        ],
      );

  Widget buildItem() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const SingleTileWidget(),
        childCount: 1,
      ),
    );
  }
}