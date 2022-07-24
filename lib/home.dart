import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/CircleButton.dart';
import 'package:flutter_application_1/Roundbutton.dart';
import 'package:flutter_application_1/image_data.dart';
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
            TopBody(),
            WhereBody(),
            WhatBody(),
          ],
        ),
      ),
    );
  }
}

Widget TopBody() {
  return Container(
    height: 300,
    child: Swiper(
      control: const SwiperControl(),
      pagination: const SwiperPagination(),
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(imgList[index], fit: BoxFit.fill);
      },
    ),
  );
}

Widget WhereBody() {
  return Column(
    children: [
      mainText('어디로 갈까?'),
      Container(
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
    ],
  );
}

Widget WhatBody() {
  return Column(
    children: [
      mainText('오늘 뭐할까?'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RoundButton(IconsPath.theme_plant, '정원•식물'),
          RoundButton(IconsPath.theme_study, '스터디•독서'),
          RoundButton(IconsPath.theme_dessrt, '디저트•브런치'),
          RoundButton(IconsPath.theme_music, '음악•트렌드'),
          RoundButton(IconsPath.theme_takeout, '스탠딩•테이크아웃'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RoundButton(IconsPath.theme_grage, '로스팅•창고'),
          RoundButton(IconsPath.theme_rooftop, '테라스•루프탑'),
          RoundButton(IconsPath.theme_interior, '인테리어•소품'),
          RoundButton(IconsPath.theme_picture, '그림•전시'),
          RoundButton(IconsPath.theme_expresso, '에스프레소•핸드드립'),
        ],
      ),
    ],
  );
}

Widget mainText(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Batang',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
      ),
    ),
  );
}
