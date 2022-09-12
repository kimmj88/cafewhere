import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          ],
        ),
      ),
    );
  }
}
