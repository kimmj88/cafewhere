import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/CircleButton.dart';
import 'package:flutter_application_1/MarketDescPage.dart';
import 'package:flutter_application_1/Roundbutton.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:get/get.dart';

enum CrossMenu {
  CircleMenu,
  RactangleMenu,
}

List<CircleButton> circleBtnList = [
  CircleButton(IconsPath.theme_plant),
  CircleButton(IconsPath.theme_study),
  CircleButton(IconsPath.theme_dessrt),
  CircleButton(IconsPath.theme_music),
  CircleButton(IconsPath.theme_takeout),
  CircleButton(IconsPath.theme_grage),
  CircleButton(IconsPath.theme_rooftop),
  CircleButton(IconsPath.theme_interior),
  CircleButton(IconsPath.theme_picture),
  CircleButton(IconsPath.theme_expresso),
];
List<CircleButton> roundBtnList = [
  CircleButton('assets/images/ag.png'),
  CircleButton('assets/images/be.png'),
  CircleButton('assets/images/hm.png'),
  CircleButton('assets/images/hs.png'),
  CircleButton('assets/images/je.png'),
  CircleButton('assets/images/ks.png'),
  CircleButton('assets/images/ss.png'),
  CircleButton('assets/images/yi.png'),
  CircleButton('assets/images/ym.png'),
];

class ImageComponent extends StatefulWidget {
  CrossMenu nCrossType;
  ImageComponent(this.nCrossType, {Key? key}) : super(key: key);

  @override
  State<ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ComponentAppBar(),
      body: ComponentScrollBody(),
    );
  }

  Widget ComponentScrollBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => MarketDescPage());
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.rectangle,
              ),
              child: Image.network(
                  'http://124.53.149.174:3000/images/kakao_test.png'),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget ComponentAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Container(
        child: TextField(
          decoration: new InputDecoration(
              //fillColor: Color.fromARGB(255, 206, 190, 161),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: Icon(Icons.search), //검색 아이콘 추가
              contentPadding:
                  EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
              hintText: '검색'),
        ),
        height: 40,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 206, 190, 161),
          shape: BoxShape.rectangle,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          height: 100,
          child: Column(
            children: [
              CrossMenuListView(widget.nCrossType),
              Container(
                height: 40,
                width: Size.infinite.width,
                child: TabBar(
                  controller: tabController,
                  tabs: [
                    Text('Recmd', style: TextStyle(color: Colors.black)),
                    Text('Search', style: TextStyle(color: Colors.black)),
                    Text('ViewType', style: TextStyle(color: Colors.black)),
                    Text('Sorting', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Container CrossMenuListView(CrossMenu crsm) {
  if (CrossMenu.RactangleMenu == crsm) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < circleBtnList.length; i++) circleBtnList[i],
        ],
      ),
    );
  } else if (CrossMenu.CircleMenu == crsm) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (int i = 0; i < roundBtnList.length; i++) roundBtnList[i],
        ],
      ),
    );
  }
  return Container();
}
// Widget SelectDescriptionPage() {
//   return DecoratedBox(
//     decoration: BoxDecoration(color: Colors.grey),
//     child: Stack(
//       alignment: Alignment.centerRight,
//       children: <Widget>[
//         Container(
//           height: 200,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 fit: BoxFit.fitWidth,
//                 image: NetworkImage(
//                     'http://192.168.219.101:3000/images/cafe_1.jpg')),
//             color: Colors.amber,
//             shape: BoxShape.rectangle,
//           ),
//         ),
//         Positioned(
//           right: 0,
//           top: 0,
//           child: Opacity(
//             opacity: 0.7,
//             child: Container(
//               width: 180,
//               height: 45,
//               decoration: BoxDecoration(color: Colors.grey),
//               child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text('로얄살룬\n서울특별시 동교동 113-108')),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 0,
//           bottom: 0,
//           child: Opacity(
//             opacity: 0.7,
//             child: Container(
//               width: 230,
//               height: 35,
//               decoration: BoxDecoration(color: Colors.grey),
//               child: Align(
//                   alignment: Alignment.centerRight,
//                   child: Text('#연남동#샐러드#브런치#신상카페')),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }