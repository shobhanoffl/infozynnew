import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:photo_view/photo_view.dart';

class CarouselCustom extends StatelessWidget {
  CarouselCustom({super.key, required this.imageList});

  List imageList;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.45,
      // width: screenWidth,
      child: Flexible(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            // return Image.asset(
            // imageList[index],
            // fit: BoxFit.contain,
            // );

            return Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(imageList[index]),
                      fit: BoxFit.contain),
                ),
                child: GestureDetector(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                              // appBar: AppBar(
                              // iconTheme: const IconThemeData(
                              // color: Colors.black, //change your color here
                              // ),
                              // title: const Text("Sample"),
                              // ),
                              body: PhotoView(
                                  imageProvider:
                                      NetworkImage(imageList[index])))));
                }));
          },

          // onTap: (index) {
          //  v2.0.1_AddOns -> Feature to View this Picture in Zoom & Fullscreen
          //  loop:false :) raises error, currently
          // },

          // loop: false,
          itemHeight: 100,
          indicatorLayout: PageIndicatorLayout.SCALE,
          itemCount: imageList.length,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
        ),
      ),
    );
  }
}
