import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/src/user/RegisterStore.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

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
      body: Container(
        child: Center(child: Text('Input Sample')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Get.to(RegisterStore()),
        },
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
