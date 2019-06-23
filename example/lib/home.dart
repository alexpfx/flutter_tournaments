import 'package:flutter/material.dart';
import 'package:flutter_tournaments/flutter_tournaments.dart';


class Home extends StatelessWidget {
  String imagePfx = "images/";

  TeamScores buildTeam(String name) {
    return TeamScores(
      image: Image.asset(
          (imagePfx + name.replaceAll(' ', '') + '.png').toLowerCase()),
      teamName: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tournament Example'),
        ),
        body: KnockoutTournament(
          rounds: [
            [
              Bracket(
                game1Team1: buildTeam(
                  'Germany',
                ),
                game1Team2: buildTeam(
                  'Nigeria',
                ),
                game2Team1: buildTeam(
                  'Sweden',
                ),
                game2Team2: buildTeam(
                  'Canada',
                ),
              ),
              Bracket(
                game1Team1: buildTeam(
                  'Italy',
                ),
                game1Team2: buildTeam(
                  'China',
                ),
                game2Team1: buildTeam(
                  'Netherlands',
                ),
                game2Team2: buildTeam(
                  'Japan',
                ),
              ),
              Bracket(
                game1Team1: buildTeam(
                  'Norway',
                ),
                game1Team2: buildTeam(
                  'Australia',
                ),
                game2Team1: buildTeam(
                  'England',
                ),
                game2Team2: buildTeam(
                  'Cameroon',
                ),
              ),
              Bracket(
                game1Team1: buildTeam(
                  'France',
                ),
                game1Team2: buildTeam(
                  'Brazil',
                ),
                game2Team1: buildTeam(
                  'Spain',
                ),
                game2Team2: buildTeam(
                  'United States',
                ),
              ),
            ],
            [
              Bracket(
                game1Team1: buildTeam(
                  'Germany',
                ),
                game1Team2: buildTeam(
                  'Sweden',
                ),
                game2Team1: buildTeam(
                  'Italy',
                ),
                game2Team2: buildTeam(
                  'Netherlands',
                ),
              ),
              Bracket(
                game1Team1: buildTeam(
                  'Norway',
                ),
                game1Team2: buildTeam(
                  'England',
                ),
                game2Team1: buildTeam(
                  'France',
                ),
                game2Team2: buildTeam(
                  'Spain',
                ),
              ),
            ],
            [
              Bracket(
                game1Team1: buildTeam(
                  'Sweden',
                ),
                game1Team2: buildTeam(
                  'Italy',
                ),
                game2Team1: buildTeam(
                  'Norway',
                ),
                game2Team2: buildTeam(
                  'Spain',
                ),
              ),
            ],
            [
              Bracket(
                isFinal: true,
                game1Team1: buildTeam(
                  'Sweden',
                ),
                game2Team2: buildTeam(
                  'Spain',
                ),
              ),
            ]
          ],
        ));
  }
}
