import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class SettingsTileWithArrow extends StatelessWidget {
  String title;
  IconData leftIcon;

  SettingsTileWithArrow({
    super.key,
    required this.title,
    //required this.subtitle,
    //required this.link,
    required this.leftIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        padding: const EdgeInsets.fromLTRB(20, 11, 20, 11),
        width: 384,
        height: 70,
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
                    Icon(
                      leftIcon,
                      size: 32,
                      color: fontColorBlue,
                    ),
                    const SizedBox(width: 17),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
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
                  children: const [
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: fontColorLight,
                      size: 30,
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
