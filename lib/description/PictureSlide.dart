import 'package:flutter/material.dart';
import 'package:flutter_application_1/description/MarketDescPage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PictureSlide extends StatefulWidget {
  PictureSlide(this.nIndex, this.pItem, this.image_list, {Key? key})
      : super(key: key);

  int nIndex;
  dynamic pItem;
  List<dynamic> image_list;

  @override
  State<PictureSlide> createState() => _PictureSlideState();
}

class _PictureSlideState extends State<PictureSlide> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('수정'),
            ),
            ListTile(
              title: const Text('삭제'),
              onTap: () async {
                Get.back(result: widget.image_list);
                String url =
                    "http://124.53.149.174:3000/DeleteImage?Image_key=" +
                        widget.image_list[widget.nIndex]['image_key']
                            .toString() +
                        "";
                var response = await http.get(Uri.parse(url));
                var statusCode = response.statusCode;
                var responseHeaders = response.headers;
                String responseBody = utf8.decode(response.bodyBytes);
                setState(() {
                  widget.image_list.removeAt(widget.nIndex);
                });
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 30,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Container(
        color: Colors.black,
        child: Swiper(
          onIndexChanged: (value) {
            widget.nIndex = value;
          },
          index: widget.nIndex,
          control: const SwiperControl(),
          pagination: const SwiperPagination(),
          itemCount: store_picture_List.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.network("http://124.53.149.174:3000/" +
                widget.image_list[widget.nIndex]['image_name']);
          },
        ),
      ),
    );
  }
}
