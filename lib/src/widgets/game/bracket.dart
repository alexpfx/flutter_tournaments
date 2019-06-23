import 'package:flutter/material.dart';
import 'package:flutter_tournaments/src/widgets/game/game.dart';
import 'package:flutter_tournaments/src/widgets/game/team_score.dart';

const spaceInterTeams = 1.0;
const spaceInterBrackets = 10.0;
const spaceInterMatchs = 4.0;

class Bracket extends StatelessWidget {
  final TeamScores game1Team1;
  final TeamScores game1Team2;

  final TeamScores game2Team1;
  final TeamScores game2Team2;

  final TeamScores winnerGame1;
  final TeamScores winnerGame2;

  final bool isFinal;

  Bracket({
    this.game1Team1: emptyTop,
    this.game1Team2: emptyBottom,
    this.game2Team1: emptyTop,
    this.game2Team2: emptyBottom,
    this.winnerGame1: emptyTop,
    this.winnerGame2: emptyBottom,
    this.isFinal: false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isFinal ? _buildFinalBracket() : _buildNormalBracket(),
    );
  }
  _buildNormalBracket() {
    return <Widget>[
      Column(
        children: <Widget>[
          Game(
            team1: game1Team1.copyWith(TeamPosition.top),
            team2: game1Team2.copyWith(TeamPosition.bottom),
            scores: [Score(2,0), Score(1,2)],
          ),
          SizedBox(
            height: spaceInterMatchs,
          ),
          Game(
              team1: game2Team1.copyWith(TeamPosition.top),
              team2: game2Team2.copyWith(TeamPosition.bottom)),
        ],
      ),
      SizedBox(
        width: spaceInterBrackets,
      ),
      /*Column(
        children: <Widget>[

          this.winnerGame1,
          SizedBox(
            height: spaceInterTeams,
          ),
          this.winnerGame2
        ],
      )*/
    ];
  }

  _buildFinalBracket() {
    return <Widget>[
      Column(
        children: <Widget>[
          game1Team1.copyWith(TeamPosition.top),
          SizedBox(
            height: spaceInterTeams,
          ),
          game1Team2.copyWith(TeamPosition.bottom),
          SizedBox(
            height: spaceInterBrackets,
          ),
        ],
      ),
      SizedBox(
        width: spaceInterBrackets,
      ),
      Column(
        children: <Widget>[
          winnerGame1.copyWith(TeamPosition.center),
        ],
      )
    ];
  }
}
