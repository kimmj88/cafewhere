import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/src/user/SaveCafeInfo.dart';
import 'package:flutter_application_1/uploadpage.dart';

class PictureModify extends StatefulWidget {
  PictureModify(this.sv, {Key? key}) : super(key: key);
  SaveInfo sv;
  @override
  State<PictureModify> createState() => _PictureModifyState();
}

class _PictureModifyState extends State<PictureModify> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: UploadPage(widget.sv),
    );
  }
}
