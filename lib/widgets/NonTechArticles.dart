import 'package:emag/widgets/NonTechPhotoPost.dart';
import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  static const studName = 'S.Joshua';
  static const studDept = '2nd Year IT';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView(
        children: [
          NonTechPhotoPost(
              postCaption: '545',
              postDate: '5454',
              studName: 'S.Joshua',
              studDept: '2nd Year IT',
              imageList: const [
                'assets/images/falls.jpg',
                'assets/images/falls.jpg'
              ]),
          NonTechPhotoPost(
              postCaption: '545',
              postDate: '5454',
              studName: 'S.Joshua',
              studDept: '2nd Year IT',
              imageList: const [
                'assets/images/falls.jpg',
                'assets/images/falls.jpg'
              ])
        ],
      ),
    );
  }
}
