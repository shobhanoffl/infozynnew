import 'package:emag/widgets/ScoreBox.dart';
import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';
import '../theme/theme_styles.dart';

class ScoreTile extends StatelessWidget {
  String number, name, score;

  ScoreTile({
    super.key,
    required this.number,
    required this.name,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        // margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        width: screenWidth,
        height: 60,
        decoration: const BoxDecoration(
            // color: fontColorLightWhite,
            // border: Border.all(color: Colors.blueAccent, width: 2),
            // borderRadius: BorderRadius.circular(15)
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(number,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: fontSizeContent1,
                            color: fontColorDark)),
                    const SizedBox(width: 12),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: fontColorBlue,
                      child: Text('AH'),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: fontSizeHeading2,
                              color: fontColorDark),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ScoreBox(
                        scoreNo: score,
                        bgColor: const Color.fromRGBO(238, 238, 238, 1),
                        fgColor: fontColorDark)
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
