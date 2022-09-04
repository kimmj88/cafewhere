import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/src/user/SaveCafeInfo.dart';
import 'package:flutter_application_1/uploadpage.dart';

class MenuModify extends StatefulWidget {
  MenuModify(this.sv, {Key? key}) : super(key: key);
  SaveInfo sv;
  @override
  State<MenuModify> createState() => _MenuModifyState();
}

class _MenuModifyState extends State<MenuModify> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: UploadPage(widget.sv),
    );
  }
}
