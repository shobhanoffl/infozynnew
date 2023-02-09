import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emag/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:emag/widgets/NonTechArticles.dart';
// import 'package:emag/widgets/TechArticles.dart';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cached_network_image/cached_network_image.dart';

import '../services/database.dart';
import '../widgets/NonTechPhotoPost.dart';
import '../widgets/Read.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  int _value = 1;

  PageController _pageController =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);

  bool isSwitch = false;

  // String _radioSelected = 'Odd';

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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              child: Column(
                children: [
                  Material(
                    // elevation: 5,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(135, 162, 242, 1),
                      ),
                      child: const TabBar(
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.white),
                        indicator: BoxDecoration(
                            //  v2.0.1_AddOns -> Add this borderRadius and shadows
                            //  to both tabs dynamically as in documentation
                            // borderRadius: BorderRadius.only(
                            //   bottomRight: Radius.circular(6),
                            //   topRight: Radius.circular(6),
                            // ),
                            color: Color.fromRGBO(103, 138, 247, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(51, 0, 0, 0),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: Offset(4, 0),
                              )
                            ]),
                        tabs: [
                          Tab(
                            text: 'Technical',
                          ),
                          Tab(
                            text: 'Non-Techinal',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                    margin: EdgeInsets.all(0),
                    // margin: const EdgeInsets.fromLTRB(9, 10, 9, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: DecoratedBox(
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.5,
                                          style: BorderStyle.solid,
                                          color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 45,
                                    width: 180,
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: DropdownButtonFormField<String>(
                                        decoration:
                                            const InputDecoration.collapsed(
                                                hintText: ''),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),

                                        //elevation: 5,
                                        style: const TextStyle(
                                            color: Colors.black),

                                        // items: <String>[
                                        // '2011-2012',
                                        // '2012-2013',
                                        // '2013-2014',
                                        // '2014-2015',
                                        // '2015-2016',
                                        // ].map<DropdownMenuItem<String>>(
                                        // (String value) {
                                        // return DropdownMenuItem<String>(
                                        // value: value,
                                        // child: Text(value),
                                        // );
                                        // }).toList(),

                                        items: avaYear
                                            .map<DropdownMenuItem<String>>(
                                                (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.toString(),
                                            child: Text(value),
                                          );
                                        }).toList(),

                                        hint: const Text(
                                          "2011-2012",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            category = value!;
                                            getTechArticle();
                                            getNonTech();
                                            // _pageController.jumpToPage(0);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 'Odd',
                                  groupValue: issue,
                                  onChanged: (v) {
                                    setState(() {
                                      issue = v!;
                                      getTechArticle();
                                      getNonTech();
                                    });
                                  },
                                ),
                                const Text(
                                  'Odd',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: fontColorDark),
                                ),
                                // ],
                                // ),
                                // Row(
                                // children: [
                                Radio(
                                  value: 'Even',
                                  groupValue: issue,
                                  onChanged: (v) {
                                    setState(() {
                                      issue = v!;
                                      getTechArticle();
                                      getNonTech();
                                    });
                                  },
                                ),
                                const Text(
                                  'Even',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: fontColorDark),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                        ListView.builder(
                            itemCount: articlefeed.length,
                            itemBuilder: (context, index) {
                              Timestamp x = articlefeed[index]['date'];
                              DateTime dateTime =
                                  DateTime.parse(x.toDate().toString());
                              // String date =
                              // DateFormat().add_yMd().format(dateTime);
                              return Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Material(
                                  elevation: 30,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
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
                                                      text: articlefeed[index]
                                                          ['title'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black87)),
                                                  TextSpan(
                                                      text:
                                                          // 'Machine learing is defined as a branch of artifical intelligence that enables software to more accurately predicate outcome by using...',
                                                          articlefeed[index][
                                                                      'description']
                                                                  .toString()
                                                                  .substring(
                                                                      0, 140) +
                                                              "... ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black87)),
                                                  TextSpan(
                                                    text: 'Read more\n\n',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                  TextSpan(
                                                    text: x.toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const read()));
                                        }),
                                  ),
                                ),
                              );
                            }),
                        // Tab2(),
                        PageView.builder(
                          scrollDirection: Axis.vertical,
                          controller: _pageController,
                          itemCount: nonTech.length,
                          itemBuilder: (context, index) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NonTechPhotoPost(
                                      postCaption: nonTech[index]['title'],
                                      postDate: nonTech[index]['date'],
                                      studName: nonTech[index]['authorname'],
                                      studDept: nonTech[index]['yearofstudy'],
                                      imageList: [nonTech[index]['imageurl']]),
                                ]);
                          },
                        )
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
