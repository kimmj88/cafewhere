import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width;
  ImageData(
    this.icon, {
    Key? key,
    this.width = 65,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: width! / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class IconsPath {
  static String get homeOn => 'assets/images/home_on.png';
  static String get homeOff => 'assets/images/home_off.png';

  static String get searchOn => 'assets/images/search_on.png';
  static String get searchOff => 'assets/images/search_on.png';

  static String get saveOn => 'assets/images/save_on.png';
  static String get saveOff => 'assets/images/save_off.png';

  static String get userOn => 'assets/images/user_on.png';
  static String get userOff => 'assets/images/user_off.png';

  static String get theme_plant => 'assets/images/garden_plant.png';
  static String get theme_study => 'assets/images/study_round.png';
  static String get theme_dessrt => 'assets/images/dessrt.png';
  static String get theme_music => 'assets/images/music_trend.png';
  static String get theme_takeout => 'assets/images/takeout.png';
  static String get theme_grage => 'assets/images/grage.png';
  static String get theme_rooftop => 'assets/images/rooftop.png';
  static String get theme_interior => 'assets/images/study_round.png';
  static String get theme_picture => 'assets/images/picture_concert.png';
  static String get theme_expresso => 'assets/images/expresso.png';
}
