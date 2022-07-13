import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NextPage extends StatelessWidget {
  NextPage(this.input_param, {Key? key}) : super(key: key);
  String input_param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('next_page'),
      ),
      body: Text(input_param),
    );
  }
}
