import 'package:flutter/material.dart';
import 'package:flutter_tournaments/src/widgets/game/bracket.dart';
import 'package:flutter_tournaments/src/widgets/game/team_score.dart';
import 'package:flutter_tournaments/src/widgets/knockout/knockout_header.dart';
import 'package:flutter_tournaments/src/widgets/knockout/round_page.dart';
import 'package:flutter_tournaments/src/util/utils.dart';

const horizPadding = 24.0;

class KnockoutTournament extends StatefulWidget {
  List<List<Bracket>> rounds;

  KnockoutTournament({@required this.rounds});

  @override
  _KnockoutTournamentState createState() => _KnockoutTournamentState();
}

class _KnockoutTournamentState extends State<KnockoutTournament> {
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  int _selected = 0;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          KnockoutHeader(
            selected: _selected,
            roundTitles: _buildRoundTitles(),
            onSelect: (index) {
              setState(() {
                _selected = index;
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              });
            },
          ),
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                print('${notification.scrollDelta}');
              }
            },
            child: Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: _buildPages,
                itemCount: widget.rounds.length,
                controller: _pageController,
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildRoundTitles() {
    List<String> titles = [];
    for (var brackets in widget.rounds) {
      if (brackets.length > 0) {
        var title = getRoundName(brackets);
        titles.add(title);
      }
    }
    return titles;
  }

  Widget _buildPages(BuildContext context, int index) {
    List<Bracket> r = widget.rounds[index];
    return RoundPage(
      brackets: r,
      percentVisible: 1,
    );
  }
}
