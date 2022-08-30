import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/description/ImageComponent.dart';
import 'package:flutter_application_1/description/modify/DescModify.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:flutter_application_1/src/user/SaveCafeInfo.dart';
import 'package:flutter_application_1/uploadpage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> store_List = [];

class MarketDescPage extends StatefulWidget {
  MarketDescPage(this.strStore_key, this.strStoreName, this.strAddress,
      this.strDescription, this.strTag, this.strImagePath,
      {Key? key})
      : super(key: key);

  String strStore_key;
  String strImagePath;
  String strStoreName;
  String strAddress;
  String strDescription;
  String strTag;

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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Get.to(UploadPage(SaveInfo(
              widget.strStore_key,
              widget.strStoreName,
              widget.strAddress,
              widget.strDescription,
              widget.strTag,
              ImageType.SLICE))),
        },
      ),
      endDrawer: Drawer(
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('페이지 수정'),
            ),
            ListTile(
              title: const Text('삭제'),
              onTap: () {
                DeleteStore(widget.strStore_key);
                Get.back();
                Get.offAll(ImageComponent());
              },
            ),
            ListTile(
              title: const Text('정보 수정'),
              onTap: () {
                Get.to(DescModify());
              },
            ),
            ListTile(
              title: const Text('메뉴'),
              onTap: () {
                Get.to(DescModify());
              },
            ),
            ListTile(
              title: const Text('사진'),
              onTap: () {
                Get.to(DescModify());
              },
            ),
            ListTile(
              title: const Text('리뷰'),
              onTap: () {
                Get.to(DescModify());
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
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
              'http://124.53.149.174:3000/' + widget.strImagePath,
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
                    widget.strDescription,
                    style: TextStyle(fontSize: 14),
                  ),
                  Align(
                    //alignment: Alignment.centerLeft,
                    child: Text(
                      widget.strTag,
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
                //정보
                DescSlice(),
                //메뉴
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'http://124.53.149.174:3000/uploadFolder/132/image_picker2838291003834217718.jpg'))),
                  width: Get.width * 0.33,
                  height: 100,
                ),
                SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(children: [
                          for (var i = 0; i < store_List.length; i++)
                            if (i % 3 == 0)
                              PictureItem(store_List[i]['image_name']),
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          for (var i = 0; i < store_List.length; i++)
                            if (i % 3 == 1)
                              PictureItem(store_List[i]['image_name']),
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          for (var i = 0; i < store_List.length; i++)
                            if (i % 3 == 2)
                              PictureItem(store_List[i]['image_name']),
                        ]),
                      ),
                    ],
                  ),
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

  Widget DescSlice() {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            '영업 시간',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'NIXGON',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                        ),
                      ),
                      Text(
                        'Mon (월). 10:00 ~ 23:00\n'
                        'Tue (화). 10:00 ~ 23:00\n'
                        'Wed (수). 10:00 ~ 23:00\n'
                        'Thu (목). 10:00 ~ 23:00\n'
                        'Fri (금). 10:00 ~ 23:00\n'
                        'Sat (토). 10:00 ~ 23:00\n'
                        'Sun (일). 휴무',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontFamily: 'Batang',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ],
                  ),
                  width: Get.width * 0.5,
                  height: 230,
                  color: Colors.white,
                ),
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            '영업 시간',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'NIXGON',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                        ),
                      ),
                      Text(
                          '- 1인 1음료 주문필수입니다.\n'
                          '- 대기 손님이 있는 경우 이용시간 2시간으로 제한될 수 있습니다.',
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontFamily: 'Batang',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0)),
                    ],
                  ),
                  width: Get.width * 0.5,
                  height: 230,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Text(
                      '위치 정보',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'NIXGON',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0),
                    ),
                  ),
                ),
                Container(width: Get.width, height: 400, color: Colors.white),
              ],
            ),
          ],
        ),
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

    store_List = jsonDecode(responseBody);

    setState(() {
      store_List = jsonDecode(responseBody);
    });
  }

  void DeleteStore(String strStoreKey) async {
    String url =
        "http://124.53.149.174:3000/DeleteStore?StoreKey=" + strStoreKey + "";
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    String responseBody = utf8.decode(response.bodyBytes);
  }
}

Container PictureItem(String strImagePath) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage('http://124.53.149.174:3000/' + strImagePath))),
    width: Get.width * 0.33,
    height: 100,
  );
}
