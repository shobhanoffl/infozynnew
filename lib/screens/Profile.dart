import 'package:emag/widgets/ProfileTile.dart';
import 'package:emag/widgets/SettingsTile.dart';
import 'package:emag/widgets/SettingsTileForInfo.dart';
import 'package:emag/widgets/SettingsTileWithArrow.dart';
import 'package:emag/widgets/SettingsTileWithSwitch.dart';
import 'package:flutter/material.dart';
import '../theme/theme_constants.dart';
import '../widgets/SettingsTileWOArrow.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // padding: const EdgeInsets.all(8),
      children: <Widget>[
        ProfileTile(
            title: 'Shivani', subtitle: 'shivani@sona.com', link: ' edit'),
        SettingsTileForInfo(
            title: 'Language',
            subtitle: 'English',
            leftIcon: Icons.language,
            rightIcon: Icons.home),
        SettingsTileWithSwitch(),
        SettingsTileWOArrow(title: 'Guide', leftIcon: Icons.route_outlined),
        Column(
          children: [
            Container(
              width: 384,
              decoration: BoxDecoration(
                  color: fontColorLightWhite,
                  borderRadius: BorderRadius.circular(22)),
              margin: const EdgeInsets.fromLTRB(15, 12, 15, 18),
              padding: const EdgeInsets.all(1.5),
              child: Column(
                children: [
                  // const Padding(padding: EdgeInsets.fromLTRB(15, 10, 15, 0)),
                  SettingsTileWithArrow(
                      leftIcon: Icons.feedback, title: "Feedback"),
                  SettingsTileWithArrow(
                      leftIcon: Icons.contact_phone, title: "Contact Us"),
                  SettingsTileWithArrow(
                      leftIcon: Icons.privacy_tip, title: "Privacy Policy"),
                  SettingsTileWithArrow(
                      leftIcon: Icons.notes, title: "Terms and Conditions"),
                  SettingsTileWithArrow(
                      leftIcon: Icons.logout, title: "Log out"),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}


// ProfileTile(
//         title: 'Shivani',
//         subtitle: 'shivani@sona.com',
//         link: 'edit',
//         iconForLink: Icons.edit);