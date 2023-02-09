import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/database.dart';
import 'Read.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  PageController _pageController =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  bool isSwitch = false;

  int _radioSelected = 0;

  List articlefeed = [];

  List nonTech = [];

  List avaYear = [];

  var category = "All";

  var issue = "Odd";

  final Stream<QuerySnapshot> stream = FirebaseFirestore.instance
      .collection("nontecharticle")
      .orderBy('realdate', descending: true)
      .snapshots();

  final Stream<QuerySnapshot> stream1 = FirebaseFirestore.instance
      .collection("techarticles")
      .orderBy('realdate', descending: true)
      .snapshots();

  getTechArticle() async {
    dynamic res =
        await Database().getTechArticle(category, issue.toLowerCase());
    if (res == null) {
      print("error....");
    } else {
      setState(() {
        articlefeed = res;
      });
    }
  }

  getNonTech() async {
    dynamic res =
        await Database().getNonTechArticle(category, issue.toLowerCase());
    if (res == null) {
      print("error....");
    } else {
      setState(() {
        nonTech = res;
      });
    }
  }

  getCategoryYear() async {
    dynamic res = await Database().getAvaliableYear();
    if (res == null) {
      print("Error...............");
    } else {
      setState(() {
        avaYear = res;
        avaYear = avaYear.toSet().toList();
        avaYear.sort();
        avaYear.insert(0, 'All');
        print(avaYear);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTechArticle();
    getNonTech();
    getCategoryYear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialApp(
        home: Scaffold(
            body: ListView.builder(
          itemCount: articlefeed.length,
          itemBuilder: (context, index) {
            Timestamp x = articlefeed[index]['date'];
            DateTime dateTime = DateTime.parse(x.toDate().toString());
            // String date =
            // DateFormat().add_yMd().format(dateTime);
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Material(
                elevation: 30,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white38),
                  height: 200,
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      child: Container(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: articlefeed[index]['title'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87)),
                                TextSpan(
                                    text:
                                        // 'Machine learing is defined as a branch of artifical intelligence that enables software to more accurately predicate outcome by using...',
                                        articlefeed[index]['description']
                                                .toString()
                                                .substring(0, 140) +
                                            "... ",
                                    style: TextStyle(color: Colors.black87)),
                                TextSpan(
                                  text: 'Read more\n\n',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                TextSpan(
                                  text: x.toString(),
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ]),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => read()));
                      }),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
