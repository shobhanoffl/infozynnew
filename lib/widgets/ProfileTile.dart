import 'package:emag/theme/theme_styles.dart';
import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';

class ProfileTile extends StatelessWidget {
  String title, subtitle, link;
  IconData? iconForLink;

  ProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.link,
    this.iconForLink = Icons.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        padding: const EdgeInsets.fromLTRB(18, 13, 18, 13),
        width: 384,
        height: 87,
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
                    const CircleAvatar(
                      backgroundColor: fontColorBlue,
                      child: Text('AH'),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: tileHead),
                        Text(subtitle, style: tileSubHead)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      iconForLink,
                      color: fontColorBlue,
                      size: fontSizeHeading2,
                    ),
                    Text(
                      link,
                      style: tileSubLink,
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
