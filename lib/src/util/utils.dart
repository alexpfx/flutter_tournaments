import 'package:flutter_tournaments/src/widgets/game/bracket.dart';

bool isPowerOf2(int n) {
  return n > 0 && (n & (n - 1) == 0);
}

Map<int, String> namedRounds = {
  1: "Final",
  2: "Semi-final",
  4: "Quartas de final",
  8: "Oitavas de final"
};

String getRoundName(List<Bracket> brackets) {
  var number = brackets.length;
  if (number == 0){
    return "";
  }

  if (number == 1 && brackets[0].isFinal) {
    return namedRounds[number];
  }

  String name = namedRounds[number * 2];
  return name ?? "$number-avos de final";
}
