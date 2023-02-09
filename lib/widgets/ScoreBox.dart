import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class ScoreBox extends StatelessWidget {
  String scoreNo;
  Color bgColor, fgColor;

  ScoreBox(
      {super.key,
      required this.scoreNo,
      required this.bgColor,
      required this.fgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 68,
      padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(13)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Padding(padding: EdgeInsets.fromLTRB(7, 4, 7, 4)),
          const Icon(Icons.star, color: Color.fromRGBO(255, 194, 18, 1)),
          const SizedBox(width: 5),
          Text(
            scoreNo,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: fontSizeContent2,
                color: fgColor),
          )
        ],
      ),
    );
  }
}
