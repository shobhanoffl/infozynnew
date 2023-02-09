import 'package:emag/widgets/ScoreBox.dart';
import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class LeaderboardTopPlaces extends StatelessWidget {
  const LeaderboardTopPlaces({
    Key? key,
    required this.screenWidth,
    required this.leaderboardSvg,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final Widget leaderboardSvg;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    const scoreColor1 = Color.fromARGB(255, 151, 151, 151);
    const scoreColor2 = Color.fromARGB(255, 255, 255, 255);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            child: leaderboardSvg,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Positioned(
                // top: screenHeight / 12,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            )
                          ]),
                      child: const CircleAvatar(
                        radius: 28,
                        backgroundColor: fontColorBlue,
                        child: Text('AH'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Shobhan Kumar',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: fontSizeContent1,
                          overflow: TextOverflow.ellipsis,
                          color: fontColorPureWhite),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 7.6,
            left: 12,
            child: SizedBox(
              width: screenWidth / 3,
              child: Positioned(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            )
                          ]),
                      child: const CircleAvatar(
                        radius: 28,
                        backgroundColor: fontColorBlue,
                        child: Text('AH'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Shobhan Kumar fjna',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: fontSizeContent1,
                          overflow: TextOverflow.ellipsis,
                          color: fontColorPureWhite),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 6.2,
            right: 12,
            child: SizedBox(
              width: screenWidth / 3,
              child: Positioned(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              offset: Offset(0, 4),
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            )
                          ]),
                      child: const CircleAvatar(
                        radius: 28,
                        backgroundColor: fontColorBlue,
                        child: Text('AH'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tom and Jerry',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: fontSizeContent1,
                          overflow: TextOverflow.ellipsis,
                          color: fontColorPureWhite),
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Positioned(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, (screenHeight / 4.4), 5, 0),
                child: ScoreBox(
                    scoreNo: '987',
                    bgColor: scoreColor2,
                    fgColor: Colors.black),
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 3.4,
            child: Container(
              margin: EdgeInsets.fromLTRB((screenWidth / 8), 0, 0, 0),
              child: ScoreBox(
                  scoreNo: '02', bgColor: scoreColor2, fgColor: Colors.black),
            ),
          ),
          Positioned(
            top: screenHeight / 3.05,
            right: screenWidth / 7.1,
            child: Container(
              // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ScoreBox(
                  scoreNo: '265', bgColor: scoreColor2, fgColor: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
