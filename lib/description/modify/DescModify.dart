import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DescModify extends StatefulWidget {
  DescModify({Key? key}) : super(key: key);

  TextEditingController Edit_strStoreName = new TextEditingController();
  TextEditingController Edit_strAddress = new TextEditingController();

  @override
  State<DescModify> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DescModify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text('영업 시간'),
            EditBox(widget.Edit_strStoreName),
            Text('이용 안내'),
            EditBox(widget.Edit_strAddress),
            RaisedButton(onPressed: () async {
              String url = "http://124.53.149.174:3000/CreateStore?StoreName=" +
                  widget.Edit_strStoreName.text +
                  "&StoreAddress=" +
                  widget.Edit_strAddress.text +
                  "";

              var response = await http.get(Uri.parse(url));
              if (response.statusCode == 200) {
                print('Insert Successful');
              } else {
                print('Insert Failed');
              }
            }),
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
        onChanged: (text) {
          //print(Edit_strPassword.text);
        },
      ),
    );
  }
}
