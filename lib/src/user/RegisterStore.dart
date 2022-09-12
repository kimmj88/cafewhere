import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/info/SaveCafeInfo.dart';
import 'package:flutter_application_1/uploadpage.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right_outlined),
            onPressed: () {
              Get.to(UploadPage(SaveInfo(
                  '0',
                  widget.Edit_strStoreName.text,
                  widget.Edit_strAddress.text,
                  widget.Edit_strDescription.text,
                  widget.Edit_strTag.text,
                  ImageType.LOGO)));
            },
          ),
        ],
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
            RaisedButton(onPressed: () async {
              String url = "http://124.53.149.174:3000/CreateStore?StoreName=" +
                  widget.Edit_strStoreName.text +
                  "&StoreAddress=" +
                  widget.Edit_strAddress.text +
                  "&StoreDesc=" +
                  widget.Edit_strDescription.text +
                  "&StoreTag=" +
                  widget.Edit_strTag.text +
                  "";

              var response = await http.get(Uri.parse(url));
              if (response.statusCode == 200) {
                print('Insert Successful');
              } else {
                print('Insert Failed');
              }
            }),
          ],
        ),
      ),
    );
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
