import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
void main() {
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: screen3(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class screen3 extends StatefulWidget {
  const screen3({Key? key}) : super(key: key);

  @override
  State<screen3> createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
       
        leading: Icon(Icons.abc),
        title: Text("INFOZYN"),
      ),
      body: cont(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        items: const <BottomNavigationBarItem>[BottomNavigationBarItem(icon: Icon(Icons.paragliding),label: "events",backgroundColor: Colors.blue),
        BottomNavigationBarItem(icon: Icon(Icons.build),label: "events",backgroundColor: Colors.blue),
        BottomNavigationBarItem(icon: Icon(Icons.event_note)
        ,label: "events",backgroundColor: Colors.blue),
        BottomNavigationBarItem(icon: Icon(Icons.info_outline_rounded),label: "events",backgroundColor: Colors.blue),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "events",backgroundColor: Colors.blue)],
      ),
    );
  }
}

class cont extends StatefulWidget {
  const cont({Key? key}) : super(key: key);

  @override
  State<cont> createState() => _contState();
}

class _contState extends State<cont> {
  @override
  bool isreadmore = false;

  Widget build(BuildContext context) {
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
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Card(
                      shape: RoundedRectangleBorder(
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
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("images/sho.jpg"),
                                  fit: BoxFit.fill),
                            ),
                            height: MediaQuery.of(context).size.height * 0.50,
                            width: MediaQuery.of(context).size.width * 0.95,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 3, left: 5, right: 5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    height: 70.0,
                                    width: 225.0,
                                    //margin: EdgeInsets.only(left: 0,right: 130),

                                    child: Text(
                                      "GUEST LECTURE ON FUTURE OF WORK",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Container(
                                    height: 70.0,
                                    width: 90.0,
                                    margin: EdgeInsets.only(left: 40.0),
                                    child: Text(
                                      "14/9/2022",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5, left: 5, right: 8),
                            child: Container(
                              alignment: Alignment.topCenter,
                              height: 100,
                              width: MediaQuery.of(context).size.width * 80,

                              child: Scrollbar(
                                scrollbarOrientation: ScrollbarOrientation.right,
                                isAlwaysShown: true,
                                radius: Radius.circular(20),
                                child: SingleChildScrollView(


                                  child: ExpandableText
                                    (

                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    style: TextStyle(
                                        fontSize: 15.0, fontWeight: FontWeight.w500),maxLines: 4,
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
                  ), //card1
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Card(
                      shape: RoundedRectangleBorder(
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
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  topLeft: Radius.circular(30)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("images/sho.jpg"),
                                  fit: BoxFit.fill),
                            ),
                            height: MediaQuery.of(context).size.height * 0.50,
                            width: MediaQuery.of(context).size.width * 0.95,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5, bottom: 3, left: 5, right: 5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    height: 70.0,
                                    width: 225.0,
                                    //margin: EdgeInsets.only(left: 0,right: 130),

                                    child: Text(
                                      "GUEST LECTURE ON FUTURE OF WORK",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                Container(
                                    height: 70.0,
                                    width: 90.0,
                                    margin: EdgeInsets.only(left: 40.0),
                                    child: Text(
                                      "14/9/2022",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5, left: 5, right: 8),
                            child: Container(
                              alignment: Alignment.topCenter,
                              height: 100,
                              width: MediaQuery.of(context).size.width * 80,

                                child: Scrollbar(
                                  scrollbarOrientation: ScrollbarOrientation.right,
                                  isAlwaysShown: true,
                                  radius: Radius.circular(20),
                                  child: SingleChildScrollView(


                                    child: ExpandableText
                                      (

                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                      style: TextStyle(
                                          fontSize: 15.0, fontWeight: FontWeight.w500),maxLines: 3,
                                      expandText: "show more",
                                      collapseText: "show less",
                                      linkColor: Colors.blue,
                                    ),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //card2

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}