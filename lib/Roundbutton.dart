import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundButton extends StatelessWidget {
  String icon;
  String title;
  RoundButton(this.icon, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12.0),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(icon)),
            shape: BoxShape.rectangle,
            //color: Colors.amber,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
