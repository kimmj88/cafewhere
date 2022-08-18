import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/CircleButton.dart';
import 'package:flutter_application_1/bottom_nav_controller.dart';
import 'package:flutter_application_1/image_data.dart';
import 'package:flutter_application_1/src/home/home.dart';
import 'package:flutter_application_1/src/user/LoginPage.dart';
import 'package:get/get.dart';

class App extends GetView<BottmNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.pageIndex.value,
          children: [
            Home(),
            Center(child: Container(child: Text('SEARCH'))),
            Center(child: Container(child: Text('SAVE'))),
            Navigator(
                //key: controller.home_navigatorKey,
                onGenerateRoute: (routeSettings) {
              return MaterialPageRoute(
                builder: ((context) => LoginPage()),
              );
            }),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 206, 190, 161),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: controller.changeBottomNav,
          currentIndex: controller.pageIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOn),
                activeIcon: ImageData(IconsPath.homeOff),
                label: 'HOME'),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'SEARCH'),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.saveOn),
                activeIcon: ImageData(IconsPath.saveOff),
                label: 'SAVE'),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.userOn),
                activeIcon: ImageData(IconsPath.userOff),
                label: 'USERINFO'),
          ],
        ),
      ),
    );
  }
}
