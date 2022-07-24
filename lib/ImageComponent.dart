import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/CircleButton.dart';
import 'package:flutter_application_1/image_data.dart';

class ImageComponent extends StatefulWidget {
  ImageComponent({Key? key}) : super(key: key);

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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //색변경
        ),
        backgroundColor: Colors.white,
        title: Container(
          child: TextField(
            decoration: new InputDecoration(
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
            color: Colors.black12,
            shape: BoxShape.rectangle,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            height: 100,
            child: Column(
              children: [
                Container(
                  //color: Colors.amber,
                  //margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
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
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  //color: Colors.red,
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.amber, shape: BoxShape.rectangle)),
            Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.blue, shape: BoxShape.rectangle)),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.deepOrange, shape: BoxShape.rectangle),
            ),
            Container(
              height: 200,
              decoration:
                  BoxDecoration(color: Colors.amber, shape: BoxShape.rectangle),
            ),
            Container(
              height: 200,
              decoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.rectangle),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.deepOrange, shape: BoxShape.rectangle),
            ),
          ],
        ),
      ),
    );
  }
}
