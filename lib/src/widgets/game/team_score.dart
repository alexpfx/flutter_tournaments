import 'package:flutter/material.dart';
import 'package:flutter_tournaments/src/widgets/style_constants.dart';
import 'package:flutter_tournaments/src/widgets/colors.dart';

enum TeamPosition { top, bottom, center }

const radius = 8.0;
const brHome = BorderRadius.only(
    topLeft: Radius.circular(radius), topRight: Radius.circular(radius));
const brAway = BorderRadius.only(
    bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius));

const brChampion = BorderRadius.all(Radius.circular(8));

const emptyBottom = TeamScores(
  teamPosition: TeamPosition.bottom,
);
const emptyTop = TeamScores(
  teamPosition: TeamPosition.top,
);

class TeamScores extends StatelessWidget {
  final Widget image;
  final String teamName;
  final TeamPosition teamPosition;

  const TeamScores(
      {this.image: const SizedBox(),
      this.teamName: "",
      this.teamPosition});

  @override
  Widget build(BuildContext context) {
    final borderRadius = getBorderRadius();

    return InkWell(
      onTap: () {},
      child: Container(
        decoration:
            BoxDecoration(color: kColorBackground, borderRadius: borderRadius),
        height: 44,
        width: 240,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 36,
                  maxHeight: 28,
                ),
                child: image,
              ),
              SizedBox(width: 24,),
              Text(
                teamName,
                style: kTextStyleTeamScore,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius getBorderRadius() {
    switch (teamPosition) {
      case TeamPosition.top:
        return brHome;
      case TeamPosition.bottom:
        return brAway;
      case TeamPosition.center:
        return brChampion;
    }
  }

  TeamScores copyWith(TeamPosition teamPosition) {
    return TeamScores(
      image: image,
      teamPosition: teamPosition,
      teamName: teamName,
    );
  }


}
