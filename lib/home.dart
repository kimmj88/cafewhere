import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/CircleButton.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:get/get.dart';

// final List<String> imgList = [
//   'https://christianlife.nz/wp-content/uploads/2018/03/london-1770192_640.jpg',
//   'https://c.wallhere.com/photos/3a/ce/england_london_united_kingdom_street-1089076.jpg!d'
// ];

final List<String> imgList = [
  'assets/images/main_home.png',
  'assets/images/main_home2.png',
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 219, 219, 216),
              height: 245,
              child: Swiper(
                control: const SwiperControl(),
                pagination: const SwiperPagination(),
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(imgList[index]);
                },
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      '오늘 뭐할까?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Batang',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              //color: Colors.black12,
              //margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 70.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CircleButton('assets/images/ag.png'),
                  CircleButton('assets/images/be.png'),
                  CircleButton('assets/images/hm.png'),
                  CircleButton('assets/images/hs.png'),
                  CircleButton('assets/images/je.png'),
                  CircleButton('assets/images/ks.png'),
                  CircleButton('assets/images/ss.png'),
                  CircleButton('assets/images/yi.png'),
                  CircleButton('assets/images/ym.png'),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      '오늘 뭐할까?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Batang',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 131, 131, 130),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amber,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
