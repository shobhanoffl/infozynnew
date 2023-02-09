import 'package:emag/theme/theme_styles.dart';
import 'package:emag/widgets/ScoreTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/theme_constants.dart';
import '../widgets/LeaderboardTopPlaces.dart';
import '../widgets/ScoreBox.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final Widget leaderboardSvg =
      SvgPicture.asset('assets/images/leaderboard.svg');
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // return LeaderboardTopPlaces(
    // screenWidth: screenWidth,
    // leaderboardSvg: leaderboardSvg,
    // screenHeight: screenHeight);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(47, 137, 237, 1),
      ),
      child: ListView(
        children: [
          LeaderboardTopPlaces(
              screenWidth: screenWidth,
              leaderboardSvg: leaderboardSvg,
              screenHeight: screenHeight),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                )),
            child: Column(
              children: [
                ScoreTile(number: '4 ', name: 'Shobhan', score: '255'),
                ScoreTile(number: '5 ', name: 'Shobhan', score: '255'),
                ScoreTile(number: '6 ', name: 'Shobhan', score: '255'),
                ScoreTile(number: '7 ', name: 'Shobhan', score: '255'),
                ScoreTile(number: '8 ', name: 'Shobhan', score: '255'),
                ScoreTile(number: '9 ', name: 'Shobhan', score: '255'),
                ScoreTile(number: '10', name: 'Shobhan', score: '255'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
