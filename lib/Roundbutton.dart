import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'description/ImageComponent.dart';

class RoundButton extends StatelessWidget {
  String icon;
  String title;
  RoundButton(this.icon, this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ImageComponent(
              nCrossType: CrossMenu.CircleMenu,
            ));
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.0),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(icon)),
              shape: BoxShape.rectangle,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
