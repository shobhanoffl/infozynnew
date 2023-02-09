import 'package:emag/screens/Articles.dart';
import 'package:emag/screens/Events.dart';
import 'package:emag/screens/Leaderboard.dart';
import 'package:emag/theme/theme_constants.dart';
import 'package:emag/widgets/EventRead.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Home.dart';
import 'Profile.dart';

class Redirector extends StatefulWidget {
  const Redirector({Key? key}) : super(key: key);

  @override
  State<Redirector> createState() => _RedirectorState();
}

class _RedirectorState extends State<Redirector> {
  int currentScreen = 2;
  static final List screensLst = [const Home(), const Profile()];
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomBar(),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 2;

  final widgetOptions = [
    const Articles(),
    const Events(),
    const Home(),
    const LeaderBoard(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // flexibleSpace: const Image(
          //   image: AssetImage('assets/images/bggroup.png'),
          //   fit: BoxFit.fill,
          // ),
          backgroundColor: const Color.fromRGBO(72, 110, 229, 0.8),
          title:
              const Text('INFOZYN', style: TextStyle(fontFamily: 'RussoOne')),
          leading: Padding(
            padding: EdgeInsets.fromLTRB(4, 5, 0, 0),
            child: Image.asset("assets/images/mainicon.png"),
          ),
          // leadingWidth: 35,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          selectedItemColor: const Color.fromRGBO(72, 110, 229, 1),
          unselectedItemColor: fontColorDark,
          // type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: const Color.fromRGBO(245, 247, 255, 1),
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.mode_edit_outlined), label: 'Articles'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: 'Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard_outlined), label: 'Leaderboard'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          ],
        ),
        body: widgetOptions[currentIndex],
      ),
    );
  }
}
