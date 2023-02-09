import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../theme/theme_constants.dart';
import 'EventRead.dart';

class EventBox extends StatefulWidget {
  String title, date, description, imgurl;

  EventBox(
      {super.key,
      required this.title,
      required this.date,
      required this.description,
      required this.imgurl});

  @override
  State<EventBox> createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width * 0.95,
      child: InkWell(
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            elevation: 8.0,
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    image: DecorationImage(
                        image: NetworkImage(widget.imgurl),
                        fit: BoxFit.fitHeight),
                  ),
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 3, left: 5, right: 5),
                  child: Row(
                    children: <Widget>[
                      Container(
                          height: 70.0,
                          width: 225.0,
                          //margin: EdgeInsets.only(left: 0,right: 130),

                          child: Text(
                            // "GUEST LECTURE ON FUTURE OF WORK",
                            widget.title.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: fontColorDark,
                                fontWeight: FontWeight.w600),
                          )),
                      Container(
                          height: 70.0,
                          width: 50.0,
                          margin: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            widget.date.toString(),
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: fontColorBlue,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 5, right: 8),
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 80,
                    child: Scrollbar(
                      scrollbarOrientation: ScrollbarOrientation.right,
                      isAlwaysShown: true,
                      radius: Radius.circular(20),
                      child: SingleChildScrollView(
                        child: ExpandableText(
                          // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          widget.description.toString(),
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              color: fontColorLight,
                              fontWeight: FontWeight.w500),
                          maxLines: 4,
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
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EventRead()));
          }),
    );
  }
}
