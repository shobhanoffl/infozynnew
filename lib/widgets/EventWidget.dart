import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';

class EventWidget extends StatelessWidget {
  String eventTitle =
      'Guest Lecture of Future of WorkGuest Lecture of Future of Work Guest Lecture of Future of WorkGuest Lecture of Future of WorkGuest Lecture of Future of Work';
  String eventContent =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  EventWidget({
    super.key,
    required this.eventTitle,
    required this.eventContent,
  });

  bool isreadmore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromARGB(8, 0, 0, 0),
          spreadRadius: 3,
          blurRadius: 25,
          offset: Offset(0, 3),
        )
      ]),
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        elevation: 8.0,
        color: const Color.fromRGBO(245, 246, 254, 1),
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                image: DecorationImage(
                  image: AssetImage("assets/images/falls.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 15, 17, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 250,
                    child: Text(
                      eventTitle.length < 35
                          ? eventTitle
                          : '${eventTitle.substring(0, 40)}...',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: fontColorDark,
                        fontSize: fontSizeHeading2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    "14/9/2022",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: fontSizeContent1,
                        color: fontColorBlue,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 5, right: 8),
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 12, 15, 5),
                alignment: Alignment.topCenter,
                height: 145,
                width: MediaQuery.of(context).size.width * 80,
                child: Scrollbar(
                  controller: ScrollController(initialScrollOffset: 10.0),
                  scrollbarOrientation: ScrollbarOrientation.right,
                  // isAlwaysShown: true,
                  radius: const Radius.circular(20),
                  child: SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: 10.0),
                    child: ExpandableText(
                      textAlign: TextAlign.justify,
                      eventContent,
                      style: const TextStyle(
                          height: 1.3,
                          fontSize: fontSizeContent1,
                          fontWeight: FontWeight.w500,
                          color: fontColorLight),
                      maxLines: 6,
                      expandText: "show more",
                      collapseText: "show less",
                      linkColor: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
