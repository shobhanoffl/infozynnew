import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class SettingsTileWithSwitch extends StatelessWidget {
  // String title, subtitle, link;
  // IconData? iconForLink;
  String? withType;
  bool switchVal = false;

  SettingsTileWithSwitch({
    super.key,
    this.withType,
    //required this.title,
    //required this.subtitle,
    //required this.link,
    //this.iconForLink = Icons.edit,
  });

  changeSwitchVal(bool value) {
    switchVal = !switchVal;
  }

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
                    const Icon(
                      Icons.data_usage,
                      size: 32,
                      color: fontColorBlue,
                    ),
                    const SizedBox(width: 17),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Data Saver',
                          style: TextStyle(
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
                Switch(value: switchVal, onChanged: changeSwitchVal(switchVal))
              ],
            )

            // Column(
            //   children: [
            //     Row(
            //       children: const [
            //         Icon(
            //           Icons.home,
            //           color: fontColorBlue,
            //           size: fontSizeHeading1,
            //         ),
            //         Text(
            //           'link',
            //           style: tileSubLink,
            //         ),
            //       ],
            //     )
            //   ],
            // ),
          ],
        ));
  }
}
