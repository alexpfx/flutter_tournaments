import 'package:flutter/material.dart';
import 'package:flutter_tournaments/src/widgets/game/bracket.dart';

class RoundPage extends StatelessWidget {
  final List<Bracket> brackets;
  final double percentVisible;

  RoundPage({this.brackets, this.percentVisible = 1.0});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: brackets.length,
      itemBuilder: _builder,
    );
  }

  Widget _builder(BuildContext context, int index) {
    return Opacity(
      opacity: percentVisible,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24),
        child: brackets[index],
      ),
    );
  }
}
