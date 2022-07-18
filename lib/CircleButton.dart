import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  String icon;
  CircleButton(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      //padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.purple, Colors.orange],
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(65),
          child: SizedBox(
              width: 58,
              height: 65,
              child: Image(
                image: AssetImage(icon),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
