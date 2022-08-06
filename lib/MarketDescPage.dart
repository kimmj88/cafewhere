import 'package:flutter/material.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> store_List = [];

class MarketDescPage extends StatefulWidget {
  MarketDescPage(this.strStoreName, this.strAddress, this.strDescription,
      this.strImagePath,
      {Key? key})
      : super(key: key);

  String strImagePath;
  String strStoreName;
  String strAddress;
  String strDescription;

  @override
  State<MarketDescPage> createState() => _MarketDescPageState();
}

class _MarketDescPageState extends State<MarketDescPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    GetStorePictures(widget.strStoreName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.rectangle,
            ),
            child: Image.network(
              'http://124.53.149.174:3000/images/' + widget.strImagePath,
              //'http://124.53.149.174:3000/images/cafe_2.png',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  widget.strStoreName,
                  //'궤도연남',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'BATANG',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/star.png'))),
                    ),
                    Text('4.5'),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        '(200)',
                        style: TextStyle(fontSize: 9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '나무 본연의 훈연향을 느낄 수 있는 우드파이어 레스토랑',
                    style: TextStyle(fontSize: 14),
                  ),
                  Align(
                    //alignment: Alignment.centerLeft,
                    child: Text(
                      widget.strDescription,
                      //'#연남동 #샐러드 #브런치 #핸드드립 #신상카페',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/navigator.png'))),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: Size.infinite.width,
            child: TabBar(
              controller: tabController,
              tabs: [
                Text('정보', style: TextStyle(color: Colors.black, fontSize: 17)),
                Text('메뉴', style: TextStyle(color: Colors.black, fontSize: 17)),
                Text('사진', style: TextStyle(color: Colors.black, fontSize: 17)),
                Text('리뷰', style: TextStyle(color: Colors.black, fontSize: 17)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(
                  color: Colors.yellow[200],
                  alignment: Alignment.center,
                  child: Text(
                    'Tab1 View',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  color: Colors.green[200],
                  alignment: Alignment.center,
                  child: Text(
                    'Tab2 View',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    for (int i = 0; i < store_List.length; i++)
                      PictureItem(store_List[i]['image_name']),
                  ]),
                ),
                Container(
                  color: Colors.yellow[200],
                  alignment: Alignment.center,
                  child: Text(
                    'Tab1 View',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void GetStorePictures(String storeName) async {
    String url = "http://124.53.149.174:3000/getstorepictures?store_name=" +
        storeName +
        "";
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    String responseBody = utf8.decode(response.bodyBytes);

    setState(() {
      store_List = jsonDecode(responseBody);
    });
  }
}

Widget PictureItem(String strImagePath) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'http://124.53.149.174:3000/images/' + strImagePath))),
        width: 196,
        height: 100,
      ),
    ],
  );
}
