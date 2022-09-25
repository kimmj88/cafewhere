import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/info/SaveCafeInfo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DescModify extends StatefulWidget {
  DescModify(this.sv, this.str_runtime_desc, this.str_guide_desc, {Key? key})
      : super(key: key);

  TextEditingController Edit_runtimeDesc = new TextEditingController();
  TextEditingController Edit_runtimeUse = new TextEditingController();
  SaveInfo sv;
  String str_runtime_desc;
  String str_guide_desc;
  @override
  State<DescModify> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DescModify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              EditBox('영업시간', widget.Edit_runtimeDesc, widget.str_runtime_desc),
              SizedBox(height: 20),
              EditBox('이용안내', widget.Edit_runtimeUse, widget.str_guide_desc),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (() {
                SetStoreDescription();
              }), child: Text('수정'))
            ],
          ),
        ),
      ),
    );
  }

  void SetStoreDescription() async {
    String url = "http://124.53.149.174:3000/Set_store_description?store_key=" +
        widget.sv.strStoreKey +
        "&runtime_desc=" +
        widget.Edit_runtimeDesc.text +
        "&guide_desc=" +
        widget.Edit_runtimeUse.text +
        "";
    var response = await http.get(Uri.parse(url));
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    String responseBody = utf8.decode(response.bodyBytes);

    Get.back();

    // store_List = jsonDecode(responseBody);

    // setState(() {
    //   store_List = jsonDecode(responseBody);
    // });
  }

  Widget EditBox(
      String text, TextEditingController EditText, String strInitValue) {
    return Center(
      child: Container(
        width: Get.width * 0.95,
        child: TextField(
          controller: EditText..text = strInitValue,
          maxLines: 7,
          decoration: InputDecoration(
            //contentPadding: EdgeInsets.symmetric(vertical: 20),
            border: OutlineInputBorder(),
            labelText: text,
          ),
        ),
      ),
    );
  }
}
