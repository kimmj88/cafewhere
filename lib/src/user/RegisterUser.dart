import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/ToggleButton.dart';
import 'package:flutter_application_1/src/user/RegisterUserComplete.dart';
import 'package:flutter_application_1/info/UserInfo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterUser extends StatefulWidget {
  RegisterUser({Key? key}) : super(key: key);

  TextEditingController Edit_name = new TextEditingController();
  TextEditingController Edit_birthday = new TextEditingController();
  TextEditingController Edit_Email = new TextEditingController();
  TextEditingController Edit_password = new TextEditingController();
  TextEditingController Edit_ckpassword = new TextEditingController();

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [
              Text('이름  ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
            ]),
          ),
          SizedBox(height: 15),
          Container(
            width: Get.width * 0.90,
            child: TextField(
              controller: widget.Edit_name,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '한글 16자리 이하 이름을 입력해주세요',
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [
              Text('생년월일  ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
            ]),
          ),
          SizedBox(height: 15),
          Container(
            width: Get.width * 0.90,
            child: TextField(
              controller: widget.Edit_birthday,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ex) 19990202',
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [
              Text('이메일 아이디(ID)  ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
            ]),
          ),
          SizedBox(height: 15),
          Container(
            width: Get.width * 0.90,
            child: TextField(
              controller: widget.Edit_Email,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '이메일을 입력해주세요',
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: Get.width * 0.95,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(136, 158, 158, 158),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text('[안전한 비밀번호 설정방법]',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('- 영문+(숫자 또는 특수 문자) 조합 최소 10자리 이상',
                        style: TextStyle(fontSize: 13)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('- 영문+숫자+특수문자 조합 시 최소 9자리 이상',
                        style: TextStyle(fontSize: 13)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('- 연속적인 숫자 및 전화번호 사용 불가',
                        style: TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [
              Text('비밀번호  ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
            ]),
          ),
          SizedBox(height: 15),
          Container(
            width: Get.width * 0.90,
            child: TextField(
              obscureText: true,
              controller: widget.Edit_password,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '새 비밀번호를 입력하세요.',
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [
              Text('비밀번호 확인  ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
            ]),
          ),
          SizedBox(height: 15),
          Container(
            width: Get.width * 0.90,
            child: TextField(
              obscureText: true,
              controller: widget.Edit_ckpassword,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '새 비밀번호를 다시 입력하세요',
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(children: [
              Text('성별  ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('선택', style: TextStyle(fontSize: 10, color: Colors.blue)),
            ]),
          ),
          SizedBox(height: 15),
          ToggleButton(),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () async {
              if (widget.Edit_name.text.isEmpty ||
                  widget.Edit_name.text.length <= 1) {
                print('Naming rule is failed');
                return;
              }
              if (widget.Edit_birthday.text.isEmpty) {
                print('birthday rule is failed');
                return;
              }
              if (widget.Edit_Email.text.isEmpty) {
                print('Email rule is failed');
                return;
              }
              if (widget.Edit_password.text.isEmpty) {
                print('Password rule is failed');
                return;
              }

              String url = "http://124.53.149.174:3000/CreateUser?name=" +
                  widget.Edit_name.text +
                  "&email=" +
                  widget.Edit_Email.text +
                  "&birthday=" +
                  widget.Edit_birthday.text +
                  "&password=" +
                  widget.Edit_password.text +
                  "&gender=1" +
                  "";

              var response = await http.get(Uri.parse(url));
              if (response.statusCode == 200) {
                print('Insert Successful');
                Get.to(RegisterUserComplete());
              } else {
                print('Insert Failed');
              }
            },
            child: Container(
              child: Center(child: Text('회원가입')),
              width: Get.width * 0.80,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(136, 158, 158, 158),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          SizedBox(height: 70),
        ],
      )),
    );
  }
}
