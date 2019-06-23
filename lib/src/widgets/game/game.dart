import 'package:flutter/material.dart';
import 'package:flutter_tournaments/src/widgets/game/team_score.dart';
import 'package:flutter_tournaments/src/widgets/style_constants.dart';
import 'package:flutter_tournaments/src/widgets/colors.dart';

class Game extends StatelessWidget {
  final TeamScores team1;
  final TeamScores team2;
  final TeamScores winnerGame;
  final List<Score> scores;

  Game({this.team1, this.team2, this.winnerGame, this.scores: const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      width: 240,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: team1,
          ),
          Positioned(
            child: team2,
            bottom: 0,
            left: 0,
          ),
          ..._buildScores()
        ],
      ),
    );
  }

  _buildScores() {
    double offset = -16;

    return scores.reversed
        .map((score) => Positioned(
              child: ScoreView(score),
              right: (offset += 28),
              top: 0,
            ))
        .toList();
  }
}

class Score {
  int team1;
  int team2;

  Score(this.team1, this.team2);
}

class ScoreView extends StatelessWidget {
  final Score score;

  ScoreView(this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 89,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: kColorBackground,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  score.team1.toString(),
                  style: kTextStyleTeamScore,
                ),
              )),
          Container(
              decoration: BoxDecoration(
                  color: kColorBackground,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  score.team2.toString(),
                  style: kTextStyleTeamScore,
                ),
              ))
        ],
      ),
    );
  }
}
