import 'dart:io';
import 'dart:io' show File;

//import 'package:firebase_storage/firebase_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/user/LoginPage.dart';
import 'package:flutter_application_1/info/SaveCafeInfo.dart';
//import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadPage extends StatefulWidget {
  UploadPage(this.sv, {Key? key}) : super(key: key);

  SaveInfo sv;
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<Widget> itemPhotosWidgetList = <Widget>[];

  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];

  List<String> downloadUrl = <String>[];

  bool uploading = false;

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width,
        _screenheight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 380) {
        return displayPhoneUploadFormScreen(_screenwidth, _screenheight);
      } else {
        return displayWebUploadFormScreen(_screenwidth, _screenheight);
      }
    });
  }

  displayPhoneUploadFormScreen(_screenwidth, _screenheight) {
    return Container();
  }

  displayWebUploadFormScreen(_screenwidth, _screenheight) {
    return OKToast(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(0.0, 0.5),
                    blurRadius: 30.0,
                  )
                ]),
            width: _screenwidth * 0.7,
            height: 100.0,
            child: Center(
              child: itemPhotosWidgetList.isEmpty
                  ? Center(
                      child: MaterialButton(
                        onPressed: pickPhotoFromGallery,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Center(
                            child: Image.network(
                              "https://static.thenounproject.com/png/3322766-200.png",
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        spacing: 5.0,
                        direction: Axis.horizontal,
                        children: itemPhotosWidgetList,
                        alignment: WrapAlignment.spaceEvenly,
                        runSpacing: 10.0,
                      ),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 100.0,
                  right: 100.0,
                ),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    color: const Color.fromRGBO(0, 35, 102, 1),
                    onPressed: uploading ? null : () => upload(),
                    child: uploading
                        ? const SizedBox(
                            child: CircularProgressIndicator(),
                            height: 15.0,
                          )
                        : const Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
              ),
            ],
          ),
          FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              color: const Color.fromRGBO(0, 35, 102, 1),
              onPressed: uploading ? null : () => upload(),
              child: uploading
                  ? const SizedBox(
                      child: CircularProgressIndicator(),
                      height: 15.0,
                    )
                  : const Text(
                      "DONE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
        ],
      ),
    ));
  }

  addImage() {
    for (var bytes in photo!) {
      itemPhotosWidgetList.add(Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: 90.0,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              child: kIsWeb
                  ? Image.network(File(bytes.path).path)
                  : Image.file(
                      File(bytes.path),
                    ),
            ),
          ),
        ),
      ));
    }
  }

  pickPhotoFromGallery() async {
    photo = await _picker.pickMultiImage();
    if (photo != null) {
      setState(() {
        itemImagesList = itemImagesList + photo!;
        addImage();
        photo!.clear();
      });
    }
  }

  upload() async {
    String productId = await uplaodImageAndSaveItemInfo();
    setState(() {
      uploading = false;
    });
    showToast("Image Uploaded Successfully");
    Navigator.pop(context);
    Navigator.pop(context);
    //Get.offAll(LoginPage());
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    String? strStoreKey;
    List<dynamic> store_List = [];
    String url;
    if (widget.sv.bImgaType == ImageType.LOGO) {
      url = "http://124.53.149.174:3000/CreateStore?StoreName=" +
          widget.sv.strName +
          "&StoreAddress=" +
          widget.sv.strAddress +
          "&StoreDesc=" +
          widget.sv.strDesc +
          "&storeTag=" +
          widget.sv.strTag +
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
    } else if (widget.sv.bImgaType == ImageType.SLICE ||
        widget.sv.bImgaType == ImageType.MENU) {
      strStoreKey = widget.sv.strStoreKey;
    }

    setState(() {
      uploading = true;
    });
    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    for (int i = 0; i < itemImagesList.length; i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);
      var formData =
          FormData.fromMap({'image': await MultipartFile.fromFile(file!.path)});
      patchUserProfileImage(formData, strStoreKey, widget.sv.bImgaType);
      //await uploadImageToStorage(pickedFile, productId);
    }
    return productId;
  }

  Future<dynamic> patchUserProfileImage(
      dynamic input, store_key, ImageType bImType) async {
    var baseUri;
    var dio = new Dio();
    if (bImType == ImageType.LOGO) {
      baseUri = 'http://124.53.149.174:3000/route/api/upload';
    } else if (bImType == ImageType.SLICE) {
      baseUri = 'http://124.53.149.174:3000/route/api/uploadSlice';
    } else if (bImType == ImageType.MENU) {
      baseUri = 'http://124.53.149.174:3000/route/api/uploadMenu';
    }

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

  // uploadImageToStorage(PickedFile? pickedFile, String productId) async {
  //   String? pId = const Uuid().v4();
  //   Reference reference =
  //       FirebaseStorage.instance.ref().child('Items/$productId/product_$pId');
  //   await reference.putData(
  //     await pickedFile!.readAsBytes(),
  //     SettableMetadata(contentType: 'image/jpeg'),
  //   );
  //   String value = await reference.getDownloadURL();
  //   downloadUrl.add(value);
  // }
}
