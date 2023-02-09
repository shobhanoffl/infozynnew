import 'package:emag/theme/theme_styles.dart';
import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class SettingsTile extends StatelessWidget {
  // String title, subtitle, link;
  // IconData? iconForLink;
  String? withType;

  SettingsTile({
    super.key,
    this.withType,
    //required this.title,
    //required this.subtitle,
    //required this.link,
    //this.iconForLink = Icons.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        padding: const EdgeInsets.fromLTRB(18, 13, 220, 18),
        width: 384,
        height: 82,
        decoration: BoxDecoration(
            color: fontColorLightWhite,
            // border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.language,
                      size: 30,
                    ),
                    const SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Language',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: fontSizeHeading2,
                              color: fontColorDark),
                        ),
                        Text(
                          'English',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: fontSizeContent1,
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
            //     Switch(
            //         value: switchVal,
            //         onChanged: (bool value) {
            //           switchVal = !switchVal;
            //         })
            //   ],
            // )

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
