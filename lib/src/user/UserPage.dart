import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:flutter_application_1/src/user/EditUserProfile.dart';
import 'package:flutter_application_1/src/user/LoginPage.dart';
import 'package:flutter_application_1/src/user/RegisterStore.dart';
import 'package:flutter_application_1/info/UserInfo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserPage extends StatefulWidget {
  UserPage(this.user_info, {Key? key}) : super(key: key);

  UserInfo user_info;
  TextEditingController Edit_strStoreName = new TextEditingController();
  TextEditingController Edit_strAddress = new TextEditingController();
  TextEditingController Edit_strDescription = new TextEditingController();

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Container(
              width: 130,
              height: 130,
              decoration:
                  BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
            ),
          ),
          SizedBox(height: 15),
          Text(widget.user_info.m_email),
          SizedBox(height: 15),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.to(EditUserProfile(widget.user_info));
              },
              child: Container(
                child: Center(
                  child: Text(
                    '프로필 편집',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                width: Get.width * 0.90,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(136, 158, 158, 158),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Get.to(RegisterStore()),
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
              child: Text('관리 페이지'),
            ),
            ListTile(
              title: const Text('로그아웃'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LoginPage()));
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()),
                    (route) => false);
              },
            ),
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
        onChanged: (text) {},
      ),
    );
  }
}
