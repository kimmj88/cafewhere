import 'package:flutter/material.dart';
import 'package:flutter_application_1/CircleButton.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:flutter_application_1/samplePage.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(const MyApp());
}

final List<String> imgList = [
  'https://christianlife.nz/wp-content/uploads/2018/03/london-1770192_640.jpg',
  'https://c.wallhere.com/photos/3a/ce/england_london_united_kingdom_street-1089076.jpg!d'
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 219, 219, 216),
                height: 220,
                child: Swiper(
                  control: const SwiperControl(),
                  pagination: const SwiperPagination(),
                  itemCount: imgList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(imgList[index]);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 65.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                    CircleButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => {print('click')},
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: 'HOME'),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'SEARCH'),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.saveOn),
                activeIcon: ImageData(IconsPath.saveOff),
                label: 'SAVE'),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.userOff),
                activeIcon: ImageData(IconsPath.userOn),
                label: 'USERINFO'),
          ],
        ),
      ),
    );
  }
}
