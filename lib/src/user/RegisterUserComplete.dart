import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:get/get.dart';

class RegisterUserComplete extends StatefulWidget {
  const RegisterUserComplete({Key? key}) : super(key: key);

  @override
  State<RegisterUserComplete> createState() => _RegisterUserCompleteState();
}

class _RegisterUserCompleteState extends State<RegisterUserComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 200),
        Container(
          child: ImageData(
            IconsPath.theme_plant,
            width: 400,
          ),
        ),
        Text('회원가입이 완료 되었습니다!'),
        SizedBox(height: 150),
        Center(
          child: GestureDetector(
            onTap: () {
              Get.offAll(App());
            },
            child: Container(
              child: Center(child: Text('메인으로 가기')),
              width: Get.width * 0.80,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.brown[200],
                shape: BoxShape.rectangle,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
