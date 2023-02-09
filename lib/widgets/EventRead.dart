import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'CarouselCustom.dart';

class EventRead extends StatefulWidget {
  const EventRead({super.key});

  @override
  State<EventRead> createState() => _EventReadState();
}

class _EventReadState extends State<EventRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('INFOZYN'),
      ),
      body: ListView(
        children: [
          CarouselCustom(imageList: const [
            'https://firebasestorage.googleapis.com/v0/b/infozyn-db734.appspot.com/o/images%2Fimage_cropper_1661941114156.jpg?alt=media&token=65dd0061-1e25-4932-94ac-b9ab1c5df2f4'
          ]),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Machine Learing in Cybersecurity \n\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                        TextSpan(
                            text:
                                'Machine learning is a branch of artificial intelligence (AI) and computer science which focuses on the use of data and algorithms to imitate the way that humans learn, gradually improving its accuracy.IBM has a rich history with machine learning. One of its own, Arthur Samuel, is credited for coining the term, “machine learning” with his research (PDF, 481 KB) (link resides outside IBM) around the game of checkers. Robert Nealey, the self-proclaimed checkers master, played the game on an IBM 7094 computer in 1962, and he lost to the computer. Compared to what can be done today, this feat seems trivial, but it’s considered a major milestone in the field of artificial intelligence.Over the last couple of decades, the technological advances in storage and processing power have enabled some innovative products based on machine learning, such as Netflix’s recommendation engine and self-driving cars.Machine learning is an important component of the growing field of data science. Through the use of statistical methods, algorithms are trained to make classifications or predictions, and to uncover key insights in data mining projects. These insights subsequently drive decision making within applications and businesses, ideally impacting key growth metrics. As big data continues to expand and grow, the market demand for data scientists will increase. They will be required to help identify the most relevant business questions and the data to answer them.Machine learning algorithms are typically created using frameworks that accelerate solution development, such as TensorFlow and PyTorch.',
                            style: TextStyle(color: Colors.black54)),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
