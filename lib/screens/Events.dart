import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emag/theme/theme_constants.dart';
import 'package:emag/widgets/EventBox.dart';
import 'package:emag/widgets/EventRead.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../theme/theme_styles.dart';

import '../services/database.dart';
import '../services/auth.dart';
import '../services/preferences.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List docss = [];

  final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
      .collection("wrapper")
      .orderBy('realdate', descending: true)
      .snapshots();

  getEvents() async {
    dynamic res = await Database().Eventread();
    if (res == null) {
      print("error....");
    } else {
      setState(() {
        docss = res;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    int eventLen = docss.length;

    return RawScrollbar(
      thumbColor: Colors.blue,
      isAlwaysShown: true, //always show scrollbar
      thickness: 7, //width of scrollbar
      radius: Radius.circular(50), //corner radius of scrollbar
      scrollbarOrientation: ScrollbarOrientation.right,
      crossAxisMargin: 2,

      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < eventLen; i++)
                    EventBox(
                        title: docss[i]['title'],
                        date: docss[i]['date'].toString(),
                        description: docss[i]['description'],
                        imgurl: docss[i]['imageurl'])

                  //card1
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.75,
                  //   width: MediaQuery.of(context).size.width * 0.95,
                  //   child: Card(
                  //     shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(30),
                  //             topRight: Radius.circular(30),
                  //             bottomLeft: Radius.circular(30),
                  //             bottomRight: Radius.circular(30))),
                  //     elevation: 8.0,
                  //     color: Colors.white70,
                  //     child: Column(
                  //       children: <Widget>[
                  //         Container(
                  //           decoration: const BoxDecoration(
                  //             borderRadius: BorderRadius.only(
                  //                 topRight: Radius.circular(30),
                  //                 topLeft: Radius.circular(30)),
                  //             image: DecorationImage(
                  //                 image: AssetImage("assets/images/falls.jpg"),
                  //                 fit: BoxFit.fill),
                  //           ),
                  //           height: MediaQuery.of(context).size.height * 0.50,
                  //           width: MediaQuery.of(context).size.width * 0.95,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               top: 5, bottom: 3, left: 5, right: 5),
                  //           child: Row(
                  //             children: <Widget>[
                  //               Container(
                  //                   height: 70.0,
                  //                   width: 225.0,
                  //                   //margin: EdgeInsets.only(left: 0,right: 130),

                  //                   child: const Text(
                  //                     "GUEST LECTURE ON FUTURE OF WORK",
                  //                     textAlign: TextAlign.start,
                  //                     style: TextStyle(
                  //                       fontSize: 13.5,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   )),
                  //               Container(
                  //                   height: 70.0,
                  //                   width: 90.0,
                  //                   margin: const EdgeInsets.only(left: 40.0),
                  //                   child: const Text(
                  //                     "14/9/2022",
                  //                     textAlign: TextAlign.end,
                  //                     style: TextStyle(
                  //                         fontSize: 15.0,
                  //                         color: Colors.blue,
                  //                         fontWeight: FontWeight.w500),
                  //                   )),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //               bottom: 5, left: 5, right: 8),
                  //           child: Container(
                  //               alignment: Alignment.topCenter,
                  //               height: 100,
                  //               width: MediaQuery.of(context).size.width * 80,
                  //               child: const Scrollbar(
                  //                 scrollbarOrientation:
                  //                     ScrollbarOrientation.right,
                  //                 isAlwaysShown: true,
                  //                 radius: Radius.circular(20),
                  //                 child: SingleChildScrollView(
                  //                   child: ExpandableText(
                  //                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  //                     style: TextStyle(
                  //                         fontSize: 15.0,
                  //                         fontWeight: FontWeight.w500),
                  //                     maxLines: 3,
                  //                     expandText: "show more",
                  //                     collapseText: "show less",
                  //                     linkColor: Colors.blue,
                  //                   ),
                  //                 ),
                  //               )),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ), //card2
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
