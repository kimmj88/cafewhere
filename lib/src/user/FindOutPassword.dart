import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/src/user/RegisterUserComplete.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';

class FindOutPassword extends StatefulWidget {
  const FindOutPassword({Key? key}) : super(key: key);

  @override
  State<FindOutPassword> createState() => _FindOutPasswordState();
}

class _FindOutPasswordState extends State<FindOutPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                //controller: EditText..text = strInitValue,
                maxLines: 1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일을 입력해주세요.',
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final Email email = Email(
                  body: '',
                  subject: '[양파가족 문의]',
                  recipients: ['daialop88@nate.com'],
                  cc: ['daialop88@nate.com'],
                  bcc: ['daialop88@nate.com'],
                  attachmentPaths: [],
                  isHTML: false,
                );

                try {
                  await FlutterEmailSender.send(email);
                } catch (error) {
                  String title =
                      "기본 메일 앱을 사용할 수 없기 때문에 앱에서 바로 문의를 전송하기 어려운 상황입니다.\n\n아래 이메일로 연락주시면 친절하게 답변해드릴게요 :)\n\nonionfamily.official@gmail.com";
                  String message = "";
                }
                //Get.to(RegisterUserComplete());
              },
              child: Container(
                child: Center(child: Text('확인')),
                width: Get.width * 0.80,
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
