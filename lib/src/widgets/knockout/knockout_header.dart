import 'package:flutter/material.dart';
import 'package:flutter_tournaments/src/widgets/style_constants.dart';

class KnockoutHeader extends StatelessWidget {
  final List<String> roundTitles;
  final int selected;
  final Function(int index) onSelect;

  KnockoutHeader({this.roundTitles, this.selected, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      child: Row(
        children: _buildItems(),
      ),
    );

//    return ListView.builder(
//      shrinkWrap: true,
//      scrollDirection: Axis.horizontal,
//      itemBuilder: _itemBuilder,
//      itemCount: roundTitles.length,
//    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final roundTitle = roundTitles[index];
    final style =
        index == selected ? kTextStyleSelectedRound : kTextStyleUnSelectedRound;

    var padInsets = roundTitle.length - 1 != index
        ? EdgeInsets.only(right: 24)
        : EdgeInsets.zero;

    return InkWell(
      onTap: () {
        onSelect(index);
      },
      child: Padding(
        padding: padInsets.add(EdgeInsets.only(top: 24, bottom: 24)),
        child: Text(
          roundTitle,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _buildItems() {
    List<Widget> list = [];
    for (int i = 0; i < roundTitles.length; i++) {
      list.add(_itemBuilder(null, i));
    }
    return list;
  }
}
