import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/description/ImageComponent.dart';
import 'package:flutter_application_1/description/PictureSlide.dart';
import 'package:flutter_application_1/description/modify/DescModify.dart';
import 'package:flutter_application_1/description/modify/MenuModify.dart';
import 'package:flutter_application_1/description/modify/PictureModify.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:flutter_application_1/info/SaveCafeInfo.dart';
import 'package:get/get.dart' as GET;

import 'dart:io';
import 'dart:io' show File;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<dynamic> store_picture_List = [];
List<dynamic> store_desc_List = [];

List<dynamic> store_menu_picture_List = [];

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
  final ImagePicker _picker = ImagePicker();
  List<XFile>? photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];
  File? file;
  ImageType? bSliceImageType;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    GetStorePictures(widget.strStoreName);
    GetStoreMenuPictures(widget.strStoreName);
    GetStoreDescription(widget.strStore_key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => {
      //     Get.to(UploadPage(SaveInfo(
      //         widget.strStore_key,
      //         widget.strStoreName,
      //         widget.strAddress,
      //         widget.strDescription,
      //         widget.strTag,
      //         ImageType.SLICE))),
      //   },
      // ),
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
              title: const Text('카페 삭제'),
              onTap: () {
                DeleteStore(widget.strStore_key);
                GET.Get.back();
                GET.Get.offAll(ImageComponent());
              },
            ),
            ListTile(
              title: const Text('정보 수정'),
              onTap: () {
                GET.Get.to(
                  DescModify(
                    SaveInfo(
                        widget.strStore_key,
                        widget.strStoreName,
                        widget.strAddress,
                        widget.strDescription,
                        widget.strTag,
                        ImageType.MENU),
                    store_desc_List[0]!['runtime_desc'],
                    store_desc_List[0]!['guide_desc'],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('메뉴 추가'),
              onTap: () {
                // GET.Get.to(MenuModify(SaveInfo(
                //     widget.strStore_key,
                //     widget.strStoreName,
                //     widget.strAddress,
                //     widget.strDescription,
                //     widget.strTag,
                //     ImageType.MENU)));
                pickPhotoFromGallery();
                bSliceImageType = ImageType.MENU;
              },
            ),
            ListTile(
              title: const Text('사진 추가'),
              onTap: () {
                // Get.to(PictureModify(SaveInfo(
                //     widget.strStore_key,
                //     widget.strStoreName,
                //     widget.strAddress,
                //     widget.strDescription,
                //     widget.strTag,
                //     ImageType.SLICE)));
                pickPhotoFromGallery();
                bSliceImageType = ImageType.SLICE;
              },
            ),
            ListTile(
              title: const Text('리뷰'),
              onTap: () {
                //Get.to(DescModify());
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
              GET.Get.back();
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
                MenuSlice(),
                //사진
                PictureSlice(),
                Container(
                  color: Colors.yellow[200],
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              color: Colors.red,
                              width: 100,
                              height: 100,
                              child: Text('4.5'),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [Text('5점'), Text('200')],
                                  ),
                                  Row(
                                    children: [Text('5점'), Text('200')],
                                  ),
                                  Row(
                                    children: [Text('5점'), Text('200')],
                                  ),
                                  Row(
                                    children: [Text('5점'), Text('200')],
                                  ),
                                  Row(
                                    children: [Text('5점'), Text('200')],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: GET.Get.width,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
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
                      if (store_desc_List.length != 0)
                        Text(
                          store_desc_List[0]['runtime_desc'],
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontFamily: 'Batang',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0),
                        ),
                    ],
                  ),
                  width: GET.Get.width * 0.5,
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
                            '이용 안내',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'NIXGON',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0),
                          ),
                        ),
                      ),
                      if (store_desc_List.length != 0)
                        Text(store_desc_List[0]?['guide_desc'],
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                                fontFamily: 'Batang',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0)),
                    ],
                  ),
                  width: GET.Get.width * 0.5,
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
                Container(
                    width: GET.Get.width, height: 400, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget MenuSlice() {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = 0; i < store_menu_picture_List.length; i++)
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('http://124.53.149.174:3000/' +
                          store_menu_picture_List[i]['image_name']))),
              width: GET.Get.width * 0.90,
              height: 350,
            ),
        ],
      ),
    );
  }

  Widget PictureSlice() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(children: [
              for (var i = 0; i < store_picture_List.length; i++)
                if (i % 3 == 0) PictureItem(i, store_picture_List[i]),
            ]),
          ),
          Expanded(
            child: Column(children: [
              for (var i = 0; i < store_picture_List.length; i++)
                if (i % 3 == 1) PictureItem(i, store_picture_List[i]),
            ]),
          ),
          Expanded(
            child: Column(children: [
              for (var i = 0; i < store_picture_List.length; i++)
                if (i % 3 == 2) PictureItem(i, store_picture_List[i]),
            ]),
          ),
        ],
      ),
    );
  }

  void GetStorePictures(String storeName) async {
    String url = "http://124.53.149.174:3000/getstorepictures?store_name=" +
        storeName +
        "&image_type=SLICE"
            "";
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    String responseBody = utf8.decode(response.bodyBytes);

    setState(() {
      store_picture_List = jsonDecode(responseBody);
    });
  }

  void GetStoreMenuPictures(String storeName) async {
    String url = "http://124.53.149.174:3000/getstorepictures?store_name=" +
        storeName +
        "&image_type=MENU"
            "";
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    String responseBody = utf8.decode(response.bodyBytes);

    setState(() {
      store_menu_picture_List = jsonDecode(responseBody);
    });
  }

  void GetStoreDescription(String store_key) async {
    String url = "http://124.53.149.174:3000/Get_store_description?store_key=" +
        store_key +
        "";
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    String responseBody = utf8.decode(response.bodyBytes);

    setState(() {
      store_desc_List = jsonDecode(responseBody);
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

  Widget PictureItem(int nIndex, dynamic pItem) {
    return GestureDetector(
      onTap: () async {
        store_picture_List =
            await GET.Get.to(PictureSlide(nIndex, pItem, store_picture_List));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'http://124.53.149.174:3000/' + pItem['image_name']))),
        width: GET.Get.width * 0.33,
        height: 100,
      ),
    );
  }

  pickPhotoFromGallery() async {
    photo = await _picker.pickMultiImage();
    if (photo != null) {
      //itemImagesList = itemImagesList + photo!;
      itemImagesList = photo!;
      //photo!.clear();

      uplaodImageAndSaveItemInfo();
    }
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    String? strStoreKey;
    List<dynamic> store_List = [];
    String url;

    if (bSliceImageType == ImageType.LOGO) {
      url = "http://124.53.149.174:3000/CreateStore?StoreName=" +
          widget.strStoreName +
          "&StoreAddress=" +
          widget.strAddress +
          "&StoreDesc=" +
          widget.strDescription +
          "&storeTag=" +
          widget.strTag +
          "";

      var response = await http.get(Uri.parse(url));

      String responseBody = utf8.decode(response.bodyBytes);
      store_List = jsonDecode(responseBody);
      strStoreKey = store_List[0]['store_key'].toString();

      if (response.statusCode == 200) {
        print('Insert Successful');
      } else {
        print('Insert Failed');
      }
    } else if (bSliceImageType == ImageType.SLICE ||
        bSliceImageType == ImageType.MENU) {
      strStoreKey = widget.strStore_key;
    }

    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    for (int i = 0; i < itemImagesList.length; i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);
      var formData =
          FormData.fromMap({'image': await MultipartFile.fromFile(file!.path)});
      patchUserProfileImage(formData, strStoreKey);
      //await uploadImageToStorage(pickedFile, productId);
    }
    return productId;
  }

  Future<dynamic> patchUserProfileImage(dynamic input, store_key) async {
    var baseUri;
    var dio = new Dio();
    if (bSliceImageType == ImageType.LOGO) {
      baseUri = 'http://124.53.149.174:3000/route/api/upload';
    } else if (bSliceImageType == ImageType.SLICE) {
      baseUri = 'http://124.53.149.174:3000/route/api/uploadSlice';
    } else if (bSliceImageType == ImageType.MENU) {
      baseUri = 'http://124.53.149.174:3000/route/api/uploadMenu';
    }

    try {
      dio.options.contentType = 'kimmin';
      dio.options.maxRedirects.isFinite;

      dio.options.headers = {'token': store_key};
      var response = await dio.post(baseUri, data: input);
      print('성공적으로 업로드했습니다');
      itemImagesList.clear();
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
