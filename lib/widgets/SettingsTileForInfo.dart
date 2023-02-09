import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class SettingsTileForInfo extends StatelessWidget {
  String title;
  String subtitle;
  IconData leftIcon, rightIcon;

  SettingsTileForInfo({
    super.key,
    required this.title,
    required this.subtitle,
    //required this.subtitle,
    //required this.link,
    required this.leftIcon,
    required this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        padding: const EdgeInsets.fromLTRB(20, 11, 20, 11),
        width: 384,
        height: 70,
        decoration: BoxDecoration(
            color: fontColorLightWhite2,
            // border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(15)),
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
                        Text(
                          subtitle,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: fontSizeContent2,
                              color: fontColorLight),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Row(
            //       children: [
            //         Icon(
            //           rightIcon,
            //           color: fontColorLight,
            //           size: 30,
            //         ),
            //       ],
            //     )
            //   ],
            // ),
          ],
        ));
  }
}
