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
            height: 40,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black12,
                shape: BoxShape.rectangle)),
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
