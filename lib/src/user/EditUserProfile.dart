import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/info/UserInfo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditUserProfile extends StatefulWidget {
  EditUserProfile(this.user_info, {Key? key}) : super(key: key);

  UserInfo user_info;

  TextEditingController Edit_name = new TextEditingController();
  TextEditingController Edit_birthday = new TextEditingController();
  TextEditingController Edit_Email = new TextEditingController();
  TextEditingController Edit_password = new TextEditingController();
  TextEditingController Edit_ckpassword = new TextEditingController();
  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보 설정'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(children: [
                Text('이름  ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
              ]),
            ),
            SizedBox(height: 15),
            Container(
              width: Get.width * 0.90,
              child: TextField(
                controller: widget.Edit_name..text = widget.user_info.m_strName,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(children: [
                Text('생년월일  ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
              ]),
            ),
            SizedBox(height: 15),
            Container(
              width: Get.width * 0.90,
              child: TextField(
                controller: widget.Edit_birthday
                  ..text = widget.user_info.m_strBirthday,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(children: [
                Text('이메일 아이디(ID)  ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
              ]),
            ),
            SizedBox(height: 15),
            Container(
              width: Get.width * 0.90,
              child: TextField(
                controller: widget.Edit_Email..text = widget.user_info.m_email,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(children: [
                Text('비밀번호  ',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('필수', style: TextStyle(fontSize: 10, color: Colors.red)),
              ]),
            ),
            SizedBox(height: 15),
            Container(
              width: Get.width * 0.90,
              child: TextField(
                obscureText: true,
                controller: widget.Edit_password
                  ..text = widget.user_info.m_strPassword,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 50),
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

                String url = "http://124.53.149.174:3000/Set_users?username=" +
                    widget.Edit_name.text +
                    "&email=" +
                    widget.Edit_Email.text +
                    "&birthday=19880910" +
                    //widget.Edit_birthday.text +
                    "&password=" +
                    widget.Edit_password.text +
                    "&users_key=" +
                    widget.user_info.m_nUser_key.toString() +
                    "&gender=1" +
                    "";

                var response = await http.get(Uri.parse(url));
                if (response.statusCode == 200) {
                  print('Update Successful');
                  Get.defaultDialog(title: '수정완료', middleText: '확인');
                  //Get.to(RegisterUserComplete());
                } else {
                  print('Update Failed');
                }
              },
              child: Container(
                child: Center(child: Text('수정하기')),
                width: Get.width * 0.90,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(136, 158, 158, 158),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
