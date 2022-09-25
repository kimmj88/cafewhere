import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/info/SaveCafeInfo.dart';
import 'package:flutter_application_1/uploadpage.dart';
import 'package:get/get.dart' as GET;

import 'dart:io';
import 'dart:io' show File;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterStore extends StatefulWidget {
  RegisterStore({Key? key}) : super(key: key);
  TextEditingController Edit_strStoreName = new TextEditingController();
  TextEditingController Edit_strAddress = new TextEditingController();
  TextEditingController Edit_strDescription = new TextEditingController();
  TextEditingController Edit_strTag = new TextEditingController();
  SaveInfo? svinfo;

  @override
  State<RegisterStore> createState() => _RegisterStoreState();
}

class _RegisterStoreState extends State<RegisterStore> {
  PickedFile? _image;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(Icons.keyboard_arrow_right_outlined),
          //     onPressed: () {
          //       GET.Get.to(UploadPage(SaveInfo(
          //           '0',
          //           widget.Edit_strStoreName.text,
          //           widget.Edit_strAddress.text,
          //           widget.Edit_strDescription.text,
          //           widget.Edit_strTag.text,
          //           ImageType.LOGO)));
          //     },
          //   ),
          // ],
          ),
      body: Container(
        child: Column(
          children: [
            Text('이름'),
            EditBox(widget.Edit_strStoreName),
            Text('주소'),
            EditBox(widget.Edit_strAddress),
            Text('설명'),
            EditBox(widget.Edit_strDescription),
            Text('태그'),
            EditBox(widget.Edit_strTag),
            // RaisedButton(onPressed: () async {
            //   String url = "http://124.53.149.174:3000/CreateStore?StoreName=" +
            //       widget.Edit_strStoreName.text +
            //       "&StoreAddress=" +
            //       widget.Edit_strAddress.text +
            //       "&StoreDesc=" +
            //       widget.Edit_strDescription.text +
            //       "&StoreTag=" +
            //       widget.Edit_strTag.text +
            //       "";

            //   var response = await http.get(Uri.parse(url));
            //   if (response.statusCode == 200) {
            //     print('Insert Successful');
            //   } else {
            //     print('Insert Failed');
            //   }
            // }),

            Center(
              child: MaterialButton(
                onPressed: getImageFromGallery,
                child: Container(
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Center(
                    child: _image == null
                        ? Text('No image selected.')
                        : Image.file(File(_image!.path)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (() {
                uplaodImageAndSaveItemInfo();
              }),
              child: Container(
                child: Text('스토어 만들기'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImageFromGallery() async {
    // for gallery
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    String? strStoreKey;
    List<dynamic> store_List = [];
    String url;

    url = "http://124.53.149.174:3000/CreateStore?StoreName=" +
        widget.Edit_strStoreName.text +
        "&StoreAddress=" +
        widget.Edit_strAddress.text +
        "&StoreDesc=" +
        widget.Edit_strDescription.text +
        "&storeTag=" +
        widget.Edit_strTag.text +
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

    PickedFile? pickedFile;
    String? productId = const Uuid().v4();

    var formData =
        FormData.fromMap({'image': await MultipartFile.fromFile(_image!.path)});
    patchUserProfileImage(formData, strStoreKey);

    return productId;
  }

  Future<dynamic> patchUserProfileImage(dynamic input, store_key) async {
    var baseUri;
    var dio = new Dio();

    baseUri = 'http://124.53.149.174:3000/route/api/upload';

    try {
      dio.options.contentType = 'kimmin';
      dio.options.maxRedirects.isFinite;

      dio.options.headers = {'token': store_key};
      var response = await dio.post(baseUri, data: input);
      print('성공적으로 업로드했습니다');

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Widget EditBox(TextEditingController EditText) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), //모서리를 둥글게
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: TextField(
        controller: EditText,
        decoration: new InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 5),
        ),
        onChanged: (text) {
          //print(Edit_strPassword.text);
        },
      ),
    );
  }
}
