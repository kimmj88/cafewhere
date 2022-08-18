import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/src/user/UserPage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController Edit_strEmail = new TextEditingController();
  TextEditingController Edit_strPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/login_bg.jpg'))),
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Center(
            child: Container(
              width: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoContainer(),
                  StaticControl('E-mail'),
                  EditBox(Edit_strEmail),
                  StaticControl('Password'),
                  EditBox(Edit_strPassword),
                  CheckBoxControl(),
                  LoginButtonControl(context),
                  SignButtonControl('계정 만들기 (Sign Up)'),
                  SignButtonControl('비밀번호 찾기 (Forget Password)'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CheckBoxControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            activeColor: Colors.white,
            checkColor: Colors.green,
            value: true,
            onChanged: (value) {
              // setState(() {
              //   _checkBoxValue3 = value;
              // });
            },
          ),
        ),
        Text('Remember me'),
      ],
    );
  }

  Widget LogoContainer() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/main_logo.png'))),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: Text(
            'Cafe Where',
            style: TextStyle(
                color: Color.fromARGB(255, 101, 68, 30),
                fontSize: 30,
                fontFamily: 'RIGHTEOUS',
                //fontWeight: FontWeight.bold,
                letterSpacing: 2.0),
          ),
        ),
      ],
    );
  }

  Widget SignButtonControl(String strCaption) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: 300,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Center(
        child: Text(
          strCaption,
          style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: 'RIGHTEOUS',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
      ),
    );
  }

  Widget LoginButtonControl(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String url = "http://124.53.149.174:3000/IsLogin?email=" +
            Edit_strEmail.text +
            "&password=" +
            Edit_strPassword.text +
            "";
        var response = await http.get(Uri.parse(url));
        var statusCode = response.statusCode;
        var responseHeaders = response.headers;
        String responseBody = utf8.decode(response.bodyBytes);

        List<dynamic> list = jsonDecode(responseBody);
        if (list[0]['isvaild'] == '1') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserPage()));
          //Get.to(() => UserPage());
        } else {
          print('Not matched user data');
        }
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text('Login')),
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

  Widget StaticControl(String strCaption) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(strCaption),
      ),
    );
  }
}
