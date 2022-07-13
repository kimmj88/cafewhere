import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/nextPage.dart';
import 'package:get/get.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home_page'),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: (() {
            Get.to(NextPage('456'));
          }),
        ),
      ),
    );
  }
}
